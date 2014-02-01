package pl.wroc.pwr.wiz.io.psi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.UczestnikAdresWrapper;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
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
    uiModel.addAttribute("krajs", krajService.findAllKrajs());
    uiModel.addAttribute("wojewodztwoes", wojewodztwoService.findAllWojewodztwoes());
    uiModel.addAttribute("uczestnikAdresWrapper", uczestnikAdresWrapper);

    return "pelnaaktywacjakonta/create";
  }
}
