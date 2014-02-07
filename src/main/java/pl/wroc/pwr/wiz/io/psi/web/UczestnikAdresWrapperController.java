package pl.wroc.pwr.wiz.io.psi.web;

import static org.apache.commons.lang3.StringUtils.isEmpty;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
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
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;
import pl.wroc.pwr.wiz.io.psi.service.dao.AdresService;
import pl.wroc.pwr.wiz.io.psi.service.dao.KrajService;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WojewodztwoService;

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


  @RequestMapping(method = RequestMethod.GET)
  public String createForm(Model uiModel) {
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

    System.out.println("BYLEM!");
    return "pelnaaktywacjakonta/create";
  }

  // @RequestMapping(method = RequestMethod.POST, produces = "text/html")
  // public String create(@Valid UczestnikAdresWrapper uczestnikAdresWrapper,
  // BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
  // if (bindingResult.hasErrors()) {
  // populateEditForm(uiModel, uczestnikAdresWrapper);
  // return "pelnaaktywacjakonta/create";
  // }
  // uiModel.asMap().clear();
  // uczestnikAdresWrapper.persist();
  // return "redirect:/pelnaaktywacjakonta/"
  // + encodeUrlPathSegment(uczestnikAdresWrapper.getId().toString(), httpServletRequest);
  // }

  // @RequestMapping(params = "form", produces = "text/html")
  // public String createForm(Model uiModel) {
  // // populateEditForm(uiModel, new UczestnikAdresWrapper());
  // // List<String[]> dependencies = new ArrayList<String[]>();
  // // if (adresService.countAllAdreses() == 0) {
  // // dependencies.add(new String[] { "adres", "adreses" });
  // // }
  // // if (uzytkownikService.countAllUzytkowniks() == 0) {
  // // dependencies.add(new String[] { "uzytkownik", "security/uzytkownicy" });
  // // }
  // // uiModel.addAttribute("dependencies", dependencies);
  // return "pelnaaktywacjakonta/create";
  // }


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
