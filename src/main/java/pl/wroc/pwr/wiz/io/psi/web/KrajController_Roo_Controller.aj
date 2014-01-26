// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.web;

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
import pl.wroc.pwr.wiz.io.psi.model.Kraj;
import pl.wroc.pwr.wiz.io.psi.service.dao.AdresService;
import pl.wroc.pwr.wiz.io.psi.service.dao.KrajService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WojewodztwoService;
import pl.wroc.pwr.wiz.io.psi.web.KrajController;

privileged aspect KrajController_Roo_Controller {
    
    @Autowired
    KrajService KrajController.krajService;
    
    @Autowired
    AdresService KrajController.adresService;
    
    @Autowired
    WojewodztwoService KrajController.wojewodztwoService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String KrajController.create(@Valid Kraj kraj, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, kraj);
            return "krajs/create";
        }
        uiModel.asMap().clear();
        krajService.saveKraj(kraj);
        return "redirect:/krajs/" + encodeUrlPathSegment(kraj.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String KrajController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Kraj());
        return "krajs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String KrajController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("kraj", krajService.findKraj(id));
        uiModel.addAttribute("itemId", id);
        return "krajs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String KrajController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("krajs", krajService.findKrajEntries(firstResult, sizeNo));
            float nrOfPages = (float) krajService.countAllKrajs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("krajs", krajService.findAllKrajs());
        }
        return "krajs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String KrajController.update(@Valid Kraj kraj, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, kraj);
            return "krajs/update";
        }
        uiModel.asMap().clear();
        krajService.updateKraj(kraj);
        return "redirect:/krajs/" + encodeUrlPathSegment(kraj.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String KrajController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, krajService.findKraj(id));
        return "krajs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String KrajController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Kraj kraj = krajService.findKraj(id);
        krajService.deleteKraj(kraj);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/krajs";
    }
    
    void KrajController.populateEditForm(Model uiModel, Kraj kraj) {
        uiModel.addAttribute("kraj", kraj);
        uiModel.addAttribute("adreses", adresService.findAllAdreses());
        uiModel.addAttribute("wojewodztwoes", wojewodztwoService.findAllWojewodztwoes());
    }
    
    String KrajController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
