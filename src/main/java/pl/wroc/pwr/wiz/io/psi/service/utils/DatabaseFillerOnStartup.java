package pl.wroc.pwr.wiz.io.psi.service.utils;

import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.Kraj;
import pl.wroc.pwr.wiz.io.psi.model.Regulamin;
import pl.wroc.pwr.wiz.io.psi.model.StanKonta;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;
import pl.wroc.pwr.wiz.io.psi.model.security.Rola;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.security.Roles;
import pl.wroc.pwr.wiz.io.psi.service.dao.AdresService;
import pl.wroc.pwr.wiz.io.psi.service.dao.KrajService;
import pl.wroc.pwr.wiz.io.psi.service.dao.RegulaminService;
import pl.wroc.pwr.wiz.io.psi.service.dao.UzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WniosekRejestracyjnyService;
import pl.wroc.pwr.wiz.io.psi.service.dao.WojewodztwoService;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaService;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaUzytkownikService;
import pl.wroc.pwr.wiz.io.psi.service.utils.helpers.AdresGenerator;
import pl.wroc.pwr.wiz.io.psi.service.utils.helpers.DateGenerator;
import pl.wroc.pwr.wiz.io.psi.service.utils.helpers.Kraje;
import pl.wroc.pwr.wiz.io.psi.service.utils.helpers.RoleGenerator;
import pl.wroc.pwr.wiz.io.psi.service.utils.helpers.Wojewodztwa;

@Component
public class DatabaseFillerOnStartup implements ApplicationListener<ContextRefreshedEvent> {

  private static final int ILOSC_ADRESOW = 5;

  private static final String EXAMPLE_EMAIL = "example_email";

  private static final String GMAIL_COM = "@gmail.com";

  private static final int ILOSC_WNIOSKOW = 11;

  private static final Logger LOGGER = LoggerFactory.getLogger(DatabaseFillerOnStartup.class);

  // FIXME: hate such solution :-(
  private static boolean isStarted = false;

  private DateGenerator dateGenerator = new DateGenerator();

  private AdresGenerator adresGenerator = new AdresGenerator();

  private RoleGenerator roleGenerator = new RoleGenerator();

  @Autowired
  private RolaService rolaService;

  @Autowired
  private RegulaminService regulaminService;

  @Autowired
  private KrajService krajService;

  @Autowired
  private WojewodztwoService wojewodztwoService;

  @Autowired
  private WniosekRejestracyjnyService wniosekRejestracyjnyService;

  @Autowired
  private AdresService adresService;

  @Autowired
  private UzytkownikService uzytkownikService;

  @Autowired
  private RolaUzytkownikService rolaUzytkownikService;


  @Override
  public void onApplicationEvent(ContextRefreshedEvent event) {
    if (!isStarted) {
      initRoles();
      initRegulamin();
      initKraje();
      initWojewodztwa();
      initAdresy();
      try {
        initWnioskiRejestracyjne();
        initUzytkownicy();
      } catch (NoSuchAlgorithmException e) {
        LOGGER.error("Failed to init SHA HASHER!");
      }

      isStarted = true;
    }
  }

  private void initUzytkownicy() throws NoSuchAlgorithmException {
    initKupujacy();
    initSprzedajacy();
    initModerator();
    initAdmin();
    initNieaktywowane();
  }

  private Uzytkownik initUzytkownik(int i) throws NoSuchAlgorithmException {
    WniosekRejestracyjny wniosekRejestracyjny =
        wniosekRejestracyjnyService.findWniosekRejestracyjny((long) i);
    Uzytkownik uzytkownik = new Uzytkownik();
    uzytkownik.setEmail(wniosekRejestracyjny.getEmail());
    uzytkownik.setAdresZamieszkania(Adres.findAdres((long) i));
    uzytkownik.setDataUrodzenia(wniosekRejestracyjny.getDataUrodzenia());
    uzytkownik.setAkceptacjaZmianRegulaminu(wniosekRejestracyjny.getDataZlozenia());
    uzytkownik.setDataUtworzenia(new Date());
    uzytkownik.setWniosekRejestracyjny(wniosekRejestracyjny);
    uzytkownik.setHaslo("przykladowe");
    // TODO: haslo do poprawy
    return uzytkownik;
  }

  private void initKupujacy() throws NoSuchAlgorithmException {
    Uzytkownik kupujacy = initUzytkownik(2);
    kupujacy.setImie("Andrzej");
    kupujacy.setNazwisko("Kowalski");
    kupujacy.setTelefon("999111222");
    kupujacy.setPesel("88021414292");
    kupujacy.setStanKonta(StanKonta.KUPUJACY);
    addUzytkownikToDb(kupujacy);

    List<Roles> kupujacyRoles = roleGenerator.getKupujacyRoles();
    addRoleUzytkownikToDb(kupujacy, kupujacyRoles);

  }

  private void addRoleUzytkownikToDb(Uzytkownik kupujacy, List<Roles> roles) {
    for (Roles role : roles) {
      RolaUzytkownik ru = new RolaUzytkownik();
      ru.setEmail(kupujacy);
      ru.setIdRoli(Rola.findRolasByNazwaRoliLike(role.toString()).getSingleResult());
      rolaUzytkownikService.saveRolaUzytkownik(ru);
    }
  }

  private void initSprzedajacy() throws NoSuchAlgorithmException {
    Uzytkownik sprzedajacy = initUzytkownik(3);
    sprzedajacy.setImie("Maciej");
    sprzedajacy.setNazwisko("Nowak");
    sprzedajacy.setTelefon("888222111");
    sprzedajacy.setPesel("77111110090");
    sprzedajacy.setStanKonta(StanKonta.SPRZEDAJACY);
    addUzytkownikToDb(sprzedajacy);

    List<Roles> sprzedajacyRoles = roleGenerator.getSprzedajacyRoles();
    addRoleUzytkownikToDb(sprzedajacy, sprzedajacyRoles);
  }

  private void initModerator() throws NoSuchAlgorithmException {
    Uzytkownik moderator = initUzytkownik(4);
    moderator.setImie("Filip");
    moderator.setNazwisko("Duzy");
    moderator.setTelefon("882132111");
    moderator.setPesel("71313130030");
    moderator.setStanKonta(StanKonta.SPRZEDAJACY);
    addUzytkownikToDb(moderator);

    List<Roles> moderatorRoles = roleGenerator.getSprzedajacyRoles();
    addRoleUzytkownikToDb(moderator, moderatorRoles);
  }

  private void initNieaktywowane() throws NoSuchAlgorithmException {
    Uzytkownik nieaktywowane = initUzytkownik(5);
    nieaktywowane.setImie("Katarzyna");
    nieaktywowane.setNazwisko("Nowak");
    nieaktywowane.setTelefon("818222111");
    nieaktywowane.setPesel("91211110091");
    nieaktywowane.setStanKonta(StanKonta.NIEAKTYWOWANE);
    addUzytkownikToDb(nieaktywowane);

    List<Roles> nieaktywowaneRoles = roleGenerator.getSprzedajacyRoles();
    addRoleUzytkownikToDb(nieaktywowane, nieaktywowaneRoles);
  }

  private void initAdmin() throws NoSuchAlgorithmException {
    Uzytkownik admin = initUzytkownik(1);
    admin.setImie("Admin");
    admin.setNazwisko("Potezny");
    admin.setTelefon("898898989");
    admin.setPesel("85901221440");
    admin.setStanKonta(StanKonta.SPRZEDAJACY);
    addUzytkownikToDb(admin);

    List<Roles> adminRoles = roleGenerator.getAdminRoles();
    addRoleUzytkownikToDb(admin, adminRoles);
  }

  private void addUzytkownikToDb(Uzytkownik uzytkownik) {
    uzytkownikService.saveUzytkownik(uzytkownik);
  }

  private void initRoles() {
    LOGGER.info("init roles");
    for (Roles rola : Roles.values())
      addRoleToDb(rola);
  }

  void initKraje() {
    LOGGER.info("init kraje");
    for (Kraje kraj : Kraje.values())
      addKrajToDb(kraj);
  }

  private void initWnioskiRejestracyjne() throws NoSuchAlgorithmException {
    for (int i = 1; i < ILOSC_WNIOSKOW; i++) {
      addWniosekRejestracyjnyToDb(i);
    }
  }

  private void initAdresy() {
    LOGGER.info("init adresy");
    for (int i = 0; i < ILOSC_ADRESOW; i++) {
      addAdresToDb();
    }
  }

  private void addAdresToDb() {
    adresService.saveAdres(initAdres());
  }

  private Adres initAdres() {
    Adres nowyAdres = new Adres();
    nowyAdres.setKodPocztowy(adresGenerator.generateRandomPostalCode());
    nowyAdres.setKraj(Kraj.findKrajsByNazwaLike(Kraje.POLSKA.toString()).getSingleResult());
    nowyAdres.setWojewodztwo(adresGenerator.getRandomWojewodztwoByKraj(nowyAdres.getKraj()));
    nowyAdres.setUlicaZNumerem(adresGenerator.generateRandomUlicaZNumerem());
    nowyAdres.setMiejscowosc(adresGenerator.getRandomMiejscowosc());

    return nowyAdres;
  }

  private void addWniosekRejestracyjnyToDb(int i) throws NoSuchAlgorithmException {
    wniosekRejestracyjnyService.saveWniosekRejestracyjny(initWniosekRejestracyjny(i));
  }

  private WniosekRejestracyjny initWniosekRejestracyjny(int i) throws NoSuchAlgorithmException {
    WniosekRejestracyjny nowyWniosek = new WniosekRejestracyjny();
    nowyWniosek.setEmail(EXAMPLE_EMAIL + i + GMAIL_COM);
    nowyWniosek.setDataUrodzenia(dateGenerator.createRandomBirthDate());
    nowyWniosek.setDataZlozenia(new Date());
    nowyWniosek.setHaslo("testowehaslo" + i);
    return nowyWniosek;
  }



  private Kraj initKraj(Kraje kraj) {
    Kraj nowyKraj = new Kraj();
    nowyKraj.setNazwa(kraj.toString());
    return nowyKraj;
  }

  private void initWojewodztwa() {
    LOGGER.info("init wojewodztwa");
    for (Kraje kraj : Kraje.values()) {
      Kraj currentKraj = Kraj.findKrajsByNazwaLike(kraj.toString()).getSingleResult();
      for (Wojewodztwa noweWojewodztwo : Wojewodztwa.values())
        if (noweWojewodztwo.getKraj() == kraj) addWojewodztwoToDb(currentKraj, noweWojewodztwo);
    }
  }

  private void addWojewodztwoToDb(Kraj currentKraj, Wojewodztwa noweWojewodztwo) {
    wojewodztwoService.saveWojewodztwo(initWojewodztwo(currentKraj, noweWojewodztwo));
    LOGGER.info("added {} wojewodztwo", noweWojewodztwo);
  }

  private Wojewodztwo initWojewodztwo(Kraj currentKraj, Wojewodztwa noweWojewodztwo) {
    Wojewodztwo wojewodztwo = new Wojewodztwo();
    wojewodztwo.setNazwa(noweWojewodztwo.toString());
    wojewodztwo.setKraj(currentKraj);
    return wojewodztwo;
  }

  @SuppressWarnings("deprecation")
  private void initRegulamin() {
    Regulamin regulamin = new Regulamin();
    regulamin.setTresc("Pierwszy testowy regulamin. Mozna lamac zasady!");
    regulamin.setOdKiedy(new Date(2013, 6, 6));
    regulaminService.saveRegulamin(regulamin);
  }


  private void addRoleToDb(Roles rola) {
    rolaService.saveRola(initRole(rola));
    LOGGER.info("added {} role", rola);
  }

  private void addKrajToDb(Kraje kraj) {
    krajService.saveKraj(initKraj(kraj));
    LOGGER.info("added {} kraj", kraj);
  }

  private Rola initRole(Roles rola) {
    Rola newRola = new Rola();
    newRola.setIdRoli(rola.toString());
    newRola.setNazwaRoli(rola.toString());
    return newRola;
  }

  public RolaService getRolaService() {
    return rolaService;
  }

  public void setRolaService(RolaService rolaService) {
    this.rolaService = rolaService;
  }

  public RegulaminService getRegulaminService() {
    return regulaminService;
  }

  public void setRegulaminService(RegulaminService regulaminService) {
    this.regulaminService = regulaminService;
  }

  public KrajService getKrajService() {
    return krajService;
  }

  public void setKrajService(KrajService krajService) {
    this.krajService = krajService;
  }

}
