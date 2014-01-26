// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.web.security;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import pl.wroc.pwr.wiz.io.psi.model.security.Rola;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaService;
import pl.wroc.pwr.wiz.io.psi.web.security.RolaController;

privileged aspect RolaController_Roo_Controller {
    
    @Autowired
    RolaService RolaController.rolaService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RolaController.create(@Valid Rola rola, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rola);
            return "security/role/create";
        }
        uiModel.asMap().clear();
        rolaService.saveRola(rola);
        return "redirect:/security/role/" + encodeUrlPathSegment(rola.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RolaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Rola());
        return "security/role/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RolaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("rola", rolaService.findRola(id));
        uiModel.addAttribute("itemId", id);
        return "security/role/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RolaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("rolas", rolaService.findRolaEntries(firstResult, sizeNo));
            float nrOfPages = (float) rolaService.countAllRolas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("rolas", rolaService.findAllRolas());
        }
        return "security/role/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RolaController.update(@Valid Rola rola, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rola);
            return "security/role/update";
        }
        uiModel.asMap().clear();
        rolaService.updateRola(rola);
        return "redirect:/security/role/" + encodeUrlPathSegment(rola.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RolaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, rolaService.findRola(id));
        return "security/role/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RolaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Rola rola = rolaService.findRola(id);
        rolaService.deleteRola(rola);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/security/role";
    }
    
    void RolaController.populateEditForm(Model uiModel, Rola rola) {
        uiModel.addAttribute("rola", rola);
    }
    
    String RolaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
