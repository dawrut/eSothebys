package pl.wroc.pwr.wiz.io.psi.web;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.wroc.pwr.wiz.io.psi.model.StanKonta;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.model.security.Rola;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.security.Roles;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WniosekRejestracyjnyService;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaUzytkownikService;

@RequestMapping("/registration/**")
@Controller
public class RegistrationConfirmerController {
  private static final Logger LOGGER = LoggerFactory
      .getLogger(RegistrationConfirmerController.class);

  @Autowired
  private WniosekRejestracyjnyService wniosekRejestracyjnyService;

  @Autowired
  private UzytkownikService uzytkownikService;

  @Autowired
  private RolaUzytkownikService rolaUzytkownikService;

  private WniosekRejestracyjnyUzytkownikConverter converter =
      new WniosekRejestracyjnyUzytkownikConverter();

  @RequestMapping(value = "/{id}", produces = "text/html")
  public String show(@PathVariable("id") Long id, Model uiModel) {
    WniosekRejestracyjny wniosekRejestracyjny =
        wniosekRejestracyjnyService.findWniosekRejestracyjny(id);

    if (wniosekRejestracyjny != null && wniosekRejestracyjny.getUzytkownik() == null) {
      Uzytkownik uzytkownik =
          converter.convertWniosekRejestracyjnyToUzytkownik(wniosekRejestracyjny);

      wniosekRejestracyjnyService.saveWniosekRejestracyjny(wniosekRejestracyjny);
      uzytkownikService.saveUzytkownik(uzytkownik);

      LOGGER.info("Uzytkownik {} created!", uzytkownik.getId());

      // pomyslna rejestracja
      return "redirect:/";
    }

    // blad
    return "redirect:/";
  }

  public WniosekRejestracyjnyService getWniosekRejestracyjnyService() {
    return wniosekRejestracyjnyService;
  }

  public void setWniosekRejestracyjnyService(WniosekRejestracyjnyService wniosekRejestracyjnyService) {
    this.wniosekRejestracyjnyService = wniosekRejestracyjnyService;
  }

  public UzytkownikService getUzytkownikService() {
    return uzytkownikService;
  }

  public void setUzytkownikService(UzytkownikService uzytkownikService) {
    this.uzytkownikService = uzytkownikService;
  }

  class WniosekRejestracyjnyUzytkownikConverter {
    Uzytkownik convertWniosekRejestracyjnyToUzytkownik(WniosekRejestracyjny wniosekRejestracyjny) {
      Uzytkownik uzytkownik = new Uzytkownik();

      uzytkownik.setEmail(wniosekRejestracyjny.getEmail());
      uzytkownik.setHaslo(wniosekRejestracyjny.getHaslo());
      uzytkownik.setDataUrodzenia(wniosekRejestracyjny.getDataUrodzenia());
      uzytkownik.setDataUtworzenia(new Date());
      uzytkownik.setWniosekRejestracyjny(wniosekRejestracyjny);
      uzytkownik.setStanKonta(StanKonta.KUPUJACY);

      uzytkownikService.saveUzytkownik(uzytkownik);

      createRolesForKupujacyUzytkownik(uzytkownik);

      // TODO: ewentualne inne pola?

      return uzytkownik;
    }

    private void createRolesForKupujacyUzytkownik(Uzytkownik uzytkownik) {
      RolaUzytkownik kupTeraz = new RolaUzytkownik();
      kupTeraz.setEmail(uzytkownik);
      kupTeraz.setIdRoli(Rola.findRolasByNazwaRoliLike(Roles.ROLE_KUPTERAZ.toString())
          .getSingleResult());
      rolaUzytkownikService.saveRolaUzytkownik(kupTeraz);

      RolaUzytkownik licytacja = new RolaUzytkownik();
      licytacja.setEmail(uzytkownik);
      licytacja.setIdRoli(Rola.findRolasByNazwaRoliLike(Roles.ROLE_LICYTATOR.toString())
          .getSingleResult());
      rolaUzytkownikService.saveRolaUzytkownik(licytacja);

      RolaUzytkownik wyslijWiadomosc = new RolaUzytkownik();
      wyslijWiadomosc.setEmail(uzytkownik);
      wyslijWiadomosc.setIdRoli(Rola
          .findRolasByNazwaRoliLike(Roles.ROLE_WYSLIJWIADOMOSC.toString()).getSingleResult());
      rolaUzytkownikService.saveRolaUzytkownik(wyslijWiadomosc);

    }
  }
}
