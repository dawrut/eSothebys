package pl.wroc.pwr.wiz.io.psi.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.service.utils.RegistrationEmailService;

@RequestMapping("/wniosekrejestracyjnys")
@Controller
@RooWebScaffold(path = "wniosekrejestracyjnys", formBackingObject = WniosekRejestracyjny.class)
public class RegistrationController {
	
	@Autowired
	private RegistrationEmailService registrationEmailService;
	
	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new WniosekRejestracyjny());
        return "wniosekrejestracyjnys/create";
    }
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid WniosekRejestracyjny wniosekRejestracyjny, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wniosekRejestracyjny);
            return "wniosekrejestracyjnys/create";
        }
        uiModel.asMap().clear();
        wniosekRejestracyjny.persist();
        registrationEmailService.sendMessage(wniosekRejestracyjny.getEmail(), wniosekRejestracyjny.getId());
        return "redirect:/wniosekrejestracyjnys/" + encodeUrlPathSegment(wniosekRejestracyjny.getId().toString(), httpServletRequest);
    }

	public RegistrationEmailService getRegistrationEmailService() {
		return registrationEmailService;
	}

	public void setRegistrationEmailService(
			RegistrationEmailService registrationEmailService) {
		this.registrationEmailService = registrationEmailService;
	}
}
