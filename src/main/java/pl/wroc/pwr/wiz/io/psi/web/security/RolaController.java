package pl.wroc.pwr.wiz.io.psi.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wroc.pwr.wiz.io.psi.model.security.Rola;

@RequestMapping("/security/role")
@Controller
@RooWebScaffold(path = "security/role", formBackingObject = Rola.class)
public class RolaController {
}
