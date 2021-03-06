package pl.wroc.pwr.wiz.io.psi.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;

@RequestMapping("/security/zarzadzanieRolami")
@Controller
@RooWebScaffold(path = "security/zarzadzanieRolami", formBackingObject = RolaUzytkownik.class)
public class RolaMappingController {
  
  
  @RequestMapping(produces = "text/html")
  public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
      if (page != null || size != null) {
          int sizeNo = size == null ? 10 : size.intValue();
          final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
          uiModel.addAttribute("rolauzytkowniks", rolaUzytkownikService.findRolaUzytkownikEntries(firstResult, sizeNo));
          float nrOfPages = (float) rolaUzytkownikService.countAllRolaUzytkowniks() / sizeNo;
          uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
      } else {
          uiModel.addAttribute("rolauzytkowniks", rolaUzytkownikService.findAllRolaUzytkowniks());
      }
      return "security/zarzadzanieRolami/list";
  }
}
