package pl.wroc.pwr.wiz.io.psi.web;

import static org.apache.commons.lang3.StringUtils.isEmpty;

import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.wroc.pwr.wiz.io.psi.model.PowodZmianyDanych;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiska;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WniosekZmianyImieniaINazwiskaService;

@RequestMapping("/wniosekZmianyImieniaiNazwiska")
@Controller
@RooWebScaffold(path = "wniosekZmianyImieniaiNazwiska", formBackingObject = WniosekZmianyImieniaINazwiska.class)
public class WniosekZmianyImieniaINazwiskaController {

  @Autowired
  private WniosekZmianyImieniaINazwiskaService wniosekZmianyImieniaINazwiskaService;

  @Autowired
  private UzytkownikService uzytkownikService;

  @RequestMapping(params = "form", produces = "text/html")
  public String createForm(Model uiModel) {
    WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska =
        new WniosekZmianyImieniaINazwiska();

    populateEditForm(uiModel, wniosekZmianyImieniaINazwiska);
    return "wniosekZmianyImieniaiNazwiska/create";
  }

  @RequestMapping(produces = "text/html")
  public String list(@RequestParam(value = "page", required = false) Integer page,
      @RequestParam(value = "size", required = false) Integer size, Model uiModel) {


    if (isUzytkownikAdmin())
      uiModel.addAttribute("wniosekZmianyImieniaiNazwiska",
          wniosekZmianyImieniaINazwiskaService.findAllWniosekZmianyImieniaINazwiskas());
    else
      uiModel.addAttribute("wniosekZmianyImieniaiNazwiska", WniosekZmianyImieniaINazwiska
          .findWniosekZmianyImieniaINazwiskasByUzytkownik(getUzytkownikFromSession())
          .getResultList());

    addDateTimeFormatPatterns(uiModel);
    return "wniosekZmianyImieniaiNazwiska/list";
  }

  @RequestMapping(value = "/{id}", produces = "text/html")
  public String show(@PathVariable("id") Long id, Model uiModel) {

    if (isUzytkownikAdmin()) {
      WniosekZmianyImieniaINazwiska wniosek =
          wniosekZmianyImieniaINazwiskaService.findWniosekZmianyImieniaINazwiska(id);
      Uzytkownik uzytkownik =
          Uzytkownik.findUzytkowniksByEmailEquals(wniosek.getEmail()).getSingleResult();
      uzytkownik.setImie(wniosek.getImie());
      uzytkownik.setNazwisko(wniosek.getNazwisko());
      uzytkownikService.saveUzytkownik(uzytkownik);
      wniosekZmianyImieniaINazwiskaService
          .deleteWniosekZmianyImieniaINazwiska(wniosek);
    }

    return "redirect:/wniosekzmianyimieniainazwiskas";
  }


  private Uzytkownik getUzytkownikFromSession() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    String email = auth.getName();
    return Uzytkownik.findUzytkowniksByEmailEquals(email).getSingleResult();
  }

  private boolean isUzytkownikAdmin() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    for (GrantedAuthority grant : auth.getAuthorities()) {
      if ("ROLE_ADMIN".equals(grant.getAuthority())
          || "ROLE_MODERATOR".equals(grant.getAuthority())) return true;
    }
    return false;
  }

  // http://localhost:8080/eSothebys/wniosekzmianyimieniainazwiskas/1?form

  @RequestMapping(method = RequestMethod.POST, produces = "text/html")
  public String create(@Valid WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska,
      BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {

    if (isEmpty(wniosekZmianyImieniaINazwiska.getNazwisko())
        || isEmpty(wniosekZmianyImieniaINazwiska.getImie())) {
      populateEditForm(uiModel, wniosekZmianyImieniaINazwiska);
      return "wniosekzmianyimieniainazwiskas/create";
    }

    Uzytkownik uzytkownikFromSession = getUzytkownikFromSession();
    wniosekZmianyImieniaINazwiska.setUzytkownik(uzytkownikFromSession);
    Date dataZlozenia = new Date();
    wniosekZmianyImieniaINazwiska.setDataZlozenia(dataZlozenia);

    uiModel.asMap().clear();
    wniosekZmianyImieniaINazwiskaService
        .saveWniosekZmianyImieniaINazwiska(wniosekZmianyImieniaINazwiska);
    return "redirect:/wniosekzmianyimieniainazwiskas/"
        + encodeUrlPathSegment(wniosekZmianyImieniaINazwiska.getId().toString(), httpServletRequest);
  }

  void populateEditForm(Model uiModel, WniosekZmianyImieniaINazwiska wniosekZmianyImieniaINazwiska) {
    uiModel.addAttribute("wniosekZmianyImieniaINazwiska", wniosekZmianyImieniaINazwiska);
    uiModel.addAttribute("powodzmianydanyches", Arrays.asList(PowodZmianyDanych.values()));
  }
}
