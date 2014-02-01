package pl.wroc.pwr.wiz.io.psi.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.service.utils.RegistrationEmailService;

import static org.apache.commons.lang3.StringUtils.isEmpty;

@RequestMapping("/wniosekrejestracyjnys")
@Controller
@RooWebScaffold(path = "wniosekrejestracyjnys", formBackingObject = WniosekRejestracyjny.class)
public class RegistrationController {

  @Autowired
  private RegistrationEmailService registrationEmailService;

  @RequestMapping(params = "form", produces = "text/html")
  public String createForm(Model uiModel) {
    WniosekRejestracyjny wniosekRejestracyjny = new WniosekRejestracyjny();
    populateEditForm(uiModel, wniosekRejestracyjny);
    return "wniosekrejestracyjnys/create";
  }

  @RequestMapping(method = RequestMethod.POST, produces = "text/html")
  public String create(@Valid WniosekRejestracyjny wniosekRejestracyjny,
      BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    wniosekRejestracyjny.setDataZlozenia(new Date());
    if (bindingResult.hasErrors()) {
      populateEditForm(uiModel, wniosekRejestracyjny);
      return "wniosekrejestracyjnys/create";
    }
    int size =
        Uzytkownik.findUzytkowniksByEmailEquals(wniosekRejestracyjny.getEmail()).getResultList()
            .size();
    if (size > 0) {
      bindingResult.addError(new FieldError("wniosekRejestracyjny", "email",
          "Email już istnieje w systemie."));
      // TODO: dodac do i18n wiadomosc
      return "wniosekrejestracyjnys/create";
    }

    if (isEmpty(wniosekRejestracyjny.getRetypedPassword())
        && wniosekRejestracyjny.getRetypedPassword().equals(wniosekRejestracyjny.getHaslo())) {
      bindingResult.addError(new FieldError("wniosekRejestracyjny", "retypedPassword",
          "Hasła się różnią."));
      // TODO: dodac do i18n wiadomosc
      return "wniosekrejestracyjnys/create";
    }

    uiModel.asMap().clear();
    wniosekRejestracyjny.persist();
    registrationEmailService.sendMessage(wniosekRejestracyjny.getEmail(),
        wniosekRejestracyjny.getId());
    return "redirect:/wniosekrejestracyjnys/"
        + encodeUrlPathSegment(wniosekRejestracyjny.getId().toString(), httpServletRequest);
  }

  public RegistrationEmailService getRegistrationEmailService() {
    return registrationEmailService;
  }

  public void setRegistrationEmailService(RegistrationEmailService registrationEmailService) {
    this.registrationEmailService = registrationEmailService;
  }
}
