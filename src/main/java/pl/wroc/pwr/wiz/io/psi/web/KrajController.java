package pl.wroc.pwr.wiz.io.psi.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wroc.pwr.wiz.io.psi.model.Kraj;

@RequestMapping("/krajs")
@Controller
@RooWebScaffold(path = "krajs", formBackingObject = Kraj.class)
public class KrajController {
}
