// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.ZawieszenieKonta;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.ZawieszenieKontaService;
import pl.wroc.pwr.wiz.io.psi.web.ZawieszenieKontaController;

privileged aspect ZawieszenieKontaController_Roo_Controller {
    
    @Autowired
    ZawieszenieKontaService ZawieszenieKontaController.zawieszenieKontaService;
    
    @Autowired
    UzytkownikService ZawieszenieKontaController.uzytkownikService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ZawieszenieKontaController.create(@Valid ZawieszenieKonta zawieszenieKonta, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, zawieszenieKonta);
            return "zawieszeniekontas/create";
        }
        uiModel.asMap().clear();
        zawieszenieKontaService.saveZawieszenieKonta(zawieszenieKonta);
        return "redirect:/zawieszeniekontas/" + encodeUrlPathSegment(zawieszenieKonta.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ZawieszenieKontaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ZawieszenieKonta());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (uzytkownikService.countAllUzytkowniks() == 0) {
            dependencies.add(new String[] { "uzytkownik", "security/uzytkownicy" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "zawieszeniekontas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ZawieszenieKontaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("zawieszeniekonta", zawieszenieKontaService.findZawieszenieKonta(id));
        uiModel.addAttribute("itemId", id);
        return "zawieszeniekontas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ZawieszenieKontaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("zawieszeniekontas", zawieszenieKontaService.findZawieszenieKontaEntries(firstResult, sizeNo));
            float nrOfPages = (float) zawieszenieKontaService.countAllZawieszenieKontas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("zawieszeniekontas", zawieszenieKontaService.findAllZawieszenieKontas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "zawieszeniekontas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ZawieszenieKontaController.update(@Valid ZawieszenieKonta zawieszenieKonta, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, zawieszenieKonta);
            return "zawieszeniekontas/update";
        }
        uiModel.asMap().clear();
        zawieszenieKontaService.updateZawieszenieKonta(zawieszenieKonta);
        return "redirect:/zawieszeniekontas/" + encodeUrlPathSegment(zawieszenieKonta.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ZawieszenieKontaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, zawieszenieKontaService.findZawieszenieKonta(id));
        return "zawieszeniekontas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ZawieszenieKontaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ZawieszenieKonta zawieszenieKonta = zawieszenieKontaService.findZawieszenieKonta(id);
        zawieszenieKontaService.deleteZawieszenieKonta(zawieszenieKonta);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/zawieszeniekontas";
    }
    
    void ZawieszenieKontaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("zawieszenieKonta_dataod_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("zawieszenieKonta_datado_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ZawieszenieKontaController.populateEditForm(Model uiModel, ZawieszenieKonta zawieszenieKonta) {
        uiModel.addAttribute("zawieszenieKonta", zawieszenieKonta);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("uzytkowniks", uzytkownikService.findAllUzytkowniks());
    }
    
    String ZawieszenieKontaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
