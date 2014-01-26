// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
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
import pl.wroc.pwr.wiz.io.psi.model.PowodZmianyDanych;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiska;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WniosekZmianyImieniaINazwiskaService;
import pl.wroc.pwr.wiz.io.psi.web.WniosekZmianyImieniaINazwiskaController;

privileged aspect WniosekZmianyImieniaINazwiskaController_Roo_Controller {
    
    @Autowired
    WniosekZmianyImieniaINazwiskaService WniosekZmianyImieniaINazwiskaController.wniosekZmianyImieniaINazwiskaService;
    
    @Autowired
    UzytkownikService WniosekZmianyImieniaINazwiskaController.uzytkownikService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.create(@Valid WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wniosekZmianyImieniaINazwiska);
            return "wniosekzmianyimieniainazwiskas/create";
        }
        uiModel.asMap().clear();
        wniosekZmianyImieniaINazwiskaService.saveWniosekZmianyImieniaINazwiska(wniosekZmianyImieniaINazwiska);
        return "redirect:/wniosekzmianyimieniainazwiskas/" + encodeUrlPathSegment(wniosekZmianyImieniaINazwiska.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new WniosekZmianyImieniaINazwiska());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (uzytkownikService.countAllUzytkowniks() == 0) {
            dependencies.add(new String[] { "uzytkownik", "security/uzytkownicy" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "wniosekzmianyimieniainazwiskas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("wniosekzmianyimieniainazwiska", wniosekZmianyImieniaINazwiskaService.findWniosekZmianyImieniaINazwiska(id));
        uiModel.addAttribute("itemId", id);
        return "wniosekzmianyimieniainazwiskas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("wniosekzmianyimieniainazwiskas", wniosekZmianyImieniaINazwiskaService.findWniosekZmianyImieniaINazwiskaEntries(firstResult, sizeNo));
            float nrOfPages = (float) wniosekZmianyImieniaINazwiskaService.countAllWniosekZmianyImieniaINazwiskas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("wniosekzmianyimieniainazwiskas", wniosekZmianyImieniaINazwiskaService.findAllWniosekZmianyImieniaINazwiskas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "wniosekzmianyimieniainazwiskas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.update(@Valid WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wniosekZmianyImieniaINazwiska);
            return "wniosekzmianyimieniainazwiskas/update";
        }
        uiModel.asMap().clear();
        wniosekZmianyImieniaINazwiskaService.updateWniosekZmianyImieniaINazwiska(wniosekZmianyImieniaINazwiska);
        return "redirect:/wniosekzmianyimieniainazwiskas/" + encodeUrlPathSegment(wniosekZmianyImieniaINazwiska.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, wniosekZmianyImieniaINazwiskaService.findWniosekZmianyImieniaINazwiska(id));
        return "wniosekzmianyimieniainazwiskas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WniosekZmianyImieniaINazwiskaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska = wniosekZmianyImieniaINazwiskaService.findWniosekZmianyImieniaINazwiska(id);
        wniosekZmianyImieniaINazwiskaService.deleteWniosekZmianyImieniaINazwiska(wniosekZmianyImieniaINazwiska);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/wniosekzmianyimieniainazwiskas";
    }
    
    void WniosekZmianyImieniaINazwiskaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("wniosekZmianyImieniaINazwiska_datazlozenia_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void WniosekZmianyImieniaINazwiskaController.populateEditForm(Model uiModel, WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska) {
        uiModel.addAttribute("wniosekZmianyImieniaINazwiska", wniosekZmianyImieniaINazwiska);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("powodzmianydanyches", Arrays.asList(PowodZmianyDanych.values()));
        uiModel.addAttribute("uzytkowniks", uzytkownikService.findAllUzytkowniks());
    }
    
    String WniosekZmianyImieniaINazwiskaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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