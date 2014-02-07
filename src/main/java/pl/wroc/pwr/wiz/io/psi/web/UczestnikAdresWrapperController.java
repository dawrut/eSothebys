package pl.wroc.pwr.wiz.io.psi.web;

import static org.apache.commons.lang3.StringUtils.isEmpty;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.UczestnikAdresWrapper;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;
import pl.wroc.pwr.wiz.io.psi.model.security.Rola;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.security.Roles;
import pl.wroc.pwr.wiz.io.psi.service.dao.AdresService;
import pl.wroc.pwr.wiz.io.psi.service.dao.KrajService;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WojewodztwoService;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaUzytkownikService;

@RequestMapping("/pelnaaktywacjakonta")
@Controller
@RooWebScaffold(path = "pelnaaktywacjakonta", formBackingObject = UczestnikAdresWrapper.class)
public class UczestnikAdresWrapperController {

  @Autowired
  WojewodztwoService wojewodztwoService;

  @Autowired
  KrajService krajService;


  @Autowired
  AdresService adresService;

  @Autowired
  UzytkownikService uzytkownikService;

  @Autowired
  private RolaUzytkownikService rolaUzytkownikService;


  @RequestMapping(method = RequestMethod.GET)
  public String createForm(Model uiModel) {
    if (isUzytkownikFullyRegistered()) {
      return "index";
    }

    Adres adres = new Adres();
    Uzytkownik uzytkownik = new Uzytkownik();
    UczestnikAdresWrapper uczestnikAdresWrapper = new UczestnikAdresWrapper();
    uczestnikAdresWrapper.setUzytkownik(uzytkownik);
    uczestnikAdresWrapper.setAdres(adres);
    List<Wojewodztwo> findAllWojewodztwoes = wojewodztwoService.findAllWojewodztwoes();
    adres.setWojewodztwo(findAllWojewodztwoes.get(0));
    uiModel.addAttribute("wojewodztwa", findAllWojewodztwoes);
    uiModel.addAttribute("uczestnikAdresWrapper", uczestnikAdresWrapper);

    return "pelnaaktywacjakonta/create";
  }


  @RequestMapping(value = "zrob", method = RequestMethod.POST, produces = "text/html")
  public String create(
      @ModelAttribute("uczestnikAdresWrapper") UczestnikAdresWrapper uczestnikAdresWrapper,
      BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {

    validateWrapper(uczestnikAdresWrapper, bindingResult);
    if (bindingResult.hasErrors()) {
      return "pelnaaktywacjakonta/create";
    }
    createNewUzytkownik(uczestnikAdresWrapper);

    return "pelnaaktywacjakonta/create";
  }

  private void createNewUzytkownik(UczestnikAdresWrapper uczestnikAdresWrapper) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    String email = auth.getName();
    WniosekRejestracyjny wniosek =
        WniosekRejestracyjny.findWniosekRejestracyjnysByEmailEquals(email).getSingleResult();

    Uzytkownik uzytkownik = wniosek.getUzytkownik();

    uzytkownik.setDataUrodzenia(wniosek.getDataUrodzenia());
    uzytkownik.setDataOstatniegoLogowania(new Date());
    uzytkownik.setEmail(email);
    uzytkownik.setHaslo(wniosek.getEmail());
    uzytkownik.setWniosekRejestracyjny(wniosek);
    uzytkownik.setPesel("761214901321");

    Adres adres = uczestnikAdresWrapper.getAdres();
    adres.setWojewodztwo(wojewodztwoService.findWojewodztwo(1L));
    adres.setKraj(adres.getWojewodztwo().getKraj());
    RolaUzytkownik ru = new RolaUzytkownik();
    Rola rola = Rola.findRolasByNazwaRoliLike(Roles.ROLE_SPRZEDAJACY.toString()).getSingleResult();
    ru.setIdRoli(rola);
    ru.setEmail(uzytkownik);

    uzytkownikService.saveUzytkownik(uzytkownik);
    rolaUzytkownikService.saveRolaUzytkownik(ru);
  }

  private boolean isUzytkownikFullyRegistered() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    for (GrantedAuthority grant : auth.getAuthorities()) {
      if ("ROLE_SPRZEDAJACY".equals(grant.getAuthority())) return true;
    }
    try {
      Uzytkownik uzytkownik =
          Uzytkownik.findUzytkowniksByEmailEquals(auth.getName()).getSingleResult();
      if (uzytkownik.getNazwisko() != null) return true;
    } catch (Exception e) {
      return false;
    }


    return false;
  }

  void populateEditForm(Model uiModel, UczestnikAdresWrapper uczestnikAdresWrapper) {
    uiModel.addAttribute("uczestnikAdresWrapper", uczestnikAdresWrapper);
    uiModel.addAttribute("adreses", adresService.findAllAdreses());
    uiModel.addAttribute("uzytkowniks", uzytkownikService.findAllUzytkowniks());
  }

  String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
    String enc = httpServletRequest.getCharacterEncoding();
    if (enc == null) {
      enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
    }
    try {
      pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
    } catch (UnsupportedEncodingException uee) {}
    return pathSegment;
  }

  private void validateWrapper(UczestnikAdresWrapper uczestnikAdresWrapper,
      BindingResult bindingResult) {
    if (isEmpty(uczestnikAdresWrapper.getImie())) {
      // TODO: i18n
      System.out.println("\n\n\n\nPUSTY!!!\n\n\n");
      bindingResult.addError(new FieldError("uzytkownik", "imie", "Nie moze byc puste"));
    }
    if (isEmpty(uczestnikAdresWrapper.getNazwisko())) {
      // TODO: i18n
      System.out.println("\n\n\n\nPUSTY!!!\n\n\n");
      bindingResult.addError(new FieldError("uzytkownik", "nazwisko", "Nie moze byc puste"));
    }
    if (isEmpty(uczestnikAdresWrapper.getMiejscowosc())) {
      // TODO: i18n
      System.out.println("\n\n\n\nPUSTY!!!\n\n\n");
      bindingResult.addError(new FieldError("adres", "miejscowosc", "Nie moze byc puste"));
    }
    if (isEmpty(uczestnikAdresWrapper.getKodPocztowy())) {
      // TODO: i18n
      System.out.println("\n\n\n\nPUSTY!!!\n\n\n");
      bindingResult.addError(new FieldError("adres", "kodpocztowy", "Nie moze byc puste"));
    }
    if (isEmpty(uczestnikAdresWrapper.getUlicaZNumerem())) {
      // TODO: i18n
      System.out.println("\n\n\n\nPUSTY!!!\n\n\n");
      bindingResult.addError(new FieldError("adres", "ulicaznumerem", "Nie moze byc puste"));
    }

  }

}
