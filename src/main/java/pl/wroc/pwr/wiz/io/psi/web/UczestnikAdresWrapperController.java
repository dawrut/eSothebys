package pl.wroc.pwr.wiz.io.psi.web;

import static org.apache.commons.lang3.StringUtils.isEmpty;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.UczestnikAdresWrapper;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;
import pl.wroc.pwr.wiz.io.psi.service.dao.KrajService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WojewodztwoService;

@RequestMapping("/pelnaaktywacjakonta")
@Controller
@RooWebScaffold(path = "pelnaaktywacjakonta", formBackingObject = UczestnikAdresWrapper.class)
public class UczestnikAdresWrapperController {

  @Autowired
  WojewodztwoService wojewodztwoService;

  @Autowired
  KrajService krajService;

  @RequestMapping(params = "form", produces = "text/html")
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


  @RequestMapping(method = RequestMethod.POST, produces = "text/html")
  public String create(
      @ModelAttribute("uczestnikAdresWrapper") UczestnikAdresWrapper uczestnikAdresWrapper,
      BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    validateWrapper(uczestnikAdresWrapper, bindingResult);
    return "pelnaaktywacjakonta/create";
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


  @RequestMapping(value = "/{id}", produces = "text/html")
  public String show(Model uiModel) {
    System.out.println("tu bylem");
    return "pelnaaktywacjakonta/show";
  }



}