package pl.wroc.pwr.wiz.io.psi.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;

@RequestMapping("/security/uzytkownicy")
@Controller
@RooWebScaffold(path = "security/uzytkownicy", formBackingObject = Uzytkownik.class)
public class UzytkownikController {
}
