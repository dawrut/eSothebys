package pl.wroc.pwr.wiz.io.psi.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
    uiModel.addAttribute("wojewodztwa", findAllWojewodztwoes);
    uiModel.addAttribute("uczestnikAdresWrapper", uczestnikAdresWrapper);

    return "pelnaaktywacjakonta/create";
  }


  @RequestMapping(method = RequestMethod.POST, produces = "text/html")
  public String create(
      @ModelAttribute("uczestnikAdresWrapper") UczestnikAdresWrapper uczestnikAdresWrapper,
      BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    // TODO: walidacja danych
    System.out.println(uczestnikAdresWrapper.getImie());
    return "pelnaaktywacjakonta/create";
  }

  @RequestMapping(value = "/{id}", produces = "text/html")
  public String show(Model uiModel) {
    System.out.println("tu bylem");
    return "pelnaaktywacjakonta/show";
  }



}
