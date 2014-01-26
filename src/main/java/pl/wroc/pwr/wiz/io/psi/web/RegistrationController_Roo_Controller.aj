// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.web;

import java.io.UnsupportedEncodingException;
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
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WniosekRejestracyjnyService;
import pl.wroc.pwr.wiz.io.psi.web.RegistrationController;

privileged aspect RegistrationController_Roo_Controller {
    
    @Autowired
    WniosekRejestracyjnyService RegistrationController.wniosekRejestracyjnyService;
    
    @Autowired
    UzytkownikService RegistrationController.uzytkownikService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RegistrationController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("wniosekrejestracyjny", wniosekRejestracyjnyService.findWniosekRejestracyjny(id));
        uiModel.addAttribute("itemId", id);
        return "wniosekrejestracyjnys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RegistrationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("wniosekrejestracyjnys", wniosekRejestracyjnyService.findWniosekRejestracyjnyEntries(firstResult, sizeNo));
            float nrOfPages = (float) wniosekRejestracyjnyService.countAllWniosekRejestracyjnys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("wniosekrejestracyjnys", wniosekRejestracyjnyService.findAllWniosekRejestracyjnys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "wniosekrejestracyjnys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RegistrationController.update(@Valid WniosekRejestracyjny wniosekRejestracyjny, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wniosekRejestracyjny);
            return "wniosekrejestracyjnys/update";
        }
        uiModel.asMap().clear();
        wniosekRejestracyjnyService.updateWniosekRejestracyjny(wniosekRejestracyjny);
        return "redirect:/wniosekrejestracyjnys/" + encodeUrlPathSegment(wniosekRejestracyjny.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RegistrationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, wniosekRejestracyjnyService.findWniosekRejestracyjny(id));
        return "wniosekrejestracyjnys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RegistrationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        WniosekRejestracyjny wniosekRejestracyjny = wniosekRejestracyjnyService.findWniosekRejestracyjny(id);
        wniosekRejestracyjnyService.deleteWniosekRejestracyjny(wniosekRejestracyjny);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/wniosekrejestracyjnys";
    }
    
    void RegistrationController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("wniosekRejestracyjny_dataurodzenia_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("wniosekRejestracyjny_datazlozenia_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void RegistrationController.populateEditForm(Model uiModel, WniosekRejestracyjny wniosekRejestracyjny) {
        uiModel.addAttribute("wniosekRejestracyjny", wniosekRejestracyjny);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("uzytkowniks", uzytkownikService.findAllUzytkowniks());
    }
    
    String RegistrationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
