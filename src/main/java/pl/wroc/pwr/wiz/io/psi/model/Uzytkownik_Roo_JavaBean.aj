// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import java.util.Set;
import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.KontoFakturowe;
import pl.wroc.pwr.wiz.io.psi.model.ListAktywacyjny;
import pl.wroc.pwr.wiz.io.psi.model.SposobAktywacji;
import pl.wroc.pwr.wiz.io.psi.model.StanKonta;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiska;
import pl.wroc.pwr.wiz.io.psi.model.ZawieszenieKonta;

privileged aspect Uzytkownik_Roo_JavaBean {
    
    public String Uzytkownik.getEmail() {
        return this.email;
    }
    
    public void Uzytkownik.setEmail(String email) {
        this.email = email;
    }
    
    public String Uzytkownik.getHaslo() {
        return this.haslo;
    }
    
    public String Uzytkownik.getImie() {
        return this.imie;
    }
    
    public void Uzytkownik.setImie(String imie) {
        this.imie = imie;
    }
    
    public String Uzytkownik.getNazwisko() {
        return this.nazwisko;
    }
    
    public void Uzytkownik.setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }
    
    public String Uzytkownik.getFirma() {
        return this.firma;
    }
    
    public void Uzytkownik.setFirma(String firma) {
        this.firma = firma;
    }
    
    public String Uzytkownik.getPesel() {
        return this.pesel;
    }
    
    public void Uzytkownik.setPesel(String pesel) {
        this.pesel = pesel;
    }
    
    public String Uzytkownik.getLogin() {
        return this.login;
    }
    
    public void Uzytkownik.setLogin(String login) {
        this.login = login;
    }
    
    public String Uzytkownik.getTelefon() {
        return this.telefon;
    }
    
    public void Uzytkownik.setTelefon(String telefon) {
        this.telefon = telefon;
    }
    
    public String Uzytkownik.getDrugiTelefon() {
        return this.drugiTelefon;
    }
    
    public void Uzytkownik.setDrugiTelefon(String drugiTelefon) {
        this.drugiTelefon = drugiTelefon;
    }
    
    public Date Uzytkownik.getDataUrodzenia() {
        return this.dataUrodzenia;
    }
    
    public void Uzytkownik.setDataUrodzenia(Date dataUrodzenia) {
        this.dataUrodzenia = dataUrodzenia;
    }
    
    public Date Uzytkownik.getDataUtworzenia() {
        return this.dataUtworzenia;
    }
    
    public void Uzytkownik.setDataUtworzenia(Date dataUtworzenia) {
        this.dataUtworzenia = dataUtworzenia;
    }
    
    public Date Uzytkownik.getDataOstatniegoLogowania() {
        return this.dataOstatniegoLogowania;
    }
    
    public void Uzytkownik.setDataOstatniegoLogowania(Date dataOstatniegoLogowania) {
        this.dataOstatniegoLogowania = dataOstatniegoLogowania;
    }
    
    public StanKonta Uzytkownik.getStanKonta() {
        return this.stanKonta;
    }
    
    public void Uzytkownik.setStanKonta(StanKonta stanKonta) {
        this.stanKonta = stanKonta;
    }
    
    public Boolean Uzytkownik.getCzyWykonalAkcje() {
        return this.czyWykonalAkcje;
    }
    
    public void Uzytkownik.setCzyWykonalAkcje(Boolean czyWykonalAkcje) {
        this.czyWykonalAkcje = czyWykonalAkcje;
    }
    
    public Date Uzytkownik.getOdKiedyZawieszone() {
        return this.odKiedyZawieszone;
    }
    
    public void Uzytkownik.setOdKiedyZawieszone(Date odKiedyZawieszone) {
        this.odKiedyZawieszone = odKiedyZawieszone;
    }
    
    public Date Uzytkownik.getAkceptacjaZmianRegulaminu() {
        return this.akceptacjaZmianRegulaminu;
    }
    
    public void Uzytkownik.setAkceptacjaZmianRegulaminu(Date akceptacjaZmianRegulaminu) {
        this.akceptacjaZmianRegulaminu = akceptacjaZmianRegulaminu;
    }
    
    public SposobAktywacji Uzytkownik.getSposobAktywacji() {
        return this.sposobAktywacji;
    }
    
    public void Uzytkownik.setSposobAktywacji(SposobAktywacji sposobAktywacji) {
        this.sposobAktywacji = sposobAktywacji;
    }
    
    public int Uzytkownik.getKodAktywacyjny() {
        return this.kodAktywacyjny;
    }
    
    public void Uzytkownik.setKodAktywacyjny(int kodAktywacyjny) {
        this.kodAktywacyjny = kodAktywacyjny;
    }
    
    public Boolean Uzytkownik.getZamowioneZestawienieTransakcji() {
        return this.zamowioneZestawienieTransakcji;
    }
    
    public void Uzytkownik.setZamowioneZestawienieTransakcji(Boolean zamowioneZestawienieTransakcji) {
        this.zamowioneZestawienieTransakcji = zamowioneZestawienieTransakcji;
    }
    
    public Date Uzytkownik.getDataRozpoczeciaZamknieciaKonta() {
        return this.dataRozpoczeciaZamknieciaKonta;
    }
    
    public void Uzytkownik.setDataRozpoczeciaZamknieciaKonta(Date dataRozpoczeciaZamknieciaKonta) {
        this.dataRozpoczeciaZamknieciaKonta = dataRozpoczeciaZamknieciaKonta;
    }
    
    public Date Uzytkownik.getDataZamknieciaKonta() {
        return this.dataZamknieciaKonta;
    }
    
    public void Uzytkownik.setDataZamknieciaKonta(Date dataZamknieciaKonta) {
        this.dataZamknieciaKonta = dataZamknieciaKonta;
    }
    
    public String Uzytkownik.getPowodZamknieciaKonta() {
        return this.powodZamknieciaKonta;
    }
    
    public void Uzytkownik.setPowodZamknieciaKonta(String powodZamknieciaKonta) {
        this.powodZamknieciaKonta = powodZamknieciaKonta;
    }
    
    public Adres Uzytkownik.getAdresZamieszkania() {
        return this.adresZamieszkania;
    }
    
    public void Uzytkownik.setAdresZamieszkania(Adres adresZamieszkania) {
        this.adresZamieszkania = adresZamieszkania;
    }
    
    public WniosekRejestracyjny Uzytkownik.getWniosekRejestracyjny() {
        return this.wniosekRejestracyjny;
    }
    
    public void Uzytkownik.setWniosekRejestracyjny(WniosekRejestracyjny wniosekRejestracyjny) {
        this.wniosekRejestracyjny = wniosekRejestracyjny;
    }
    
    public Set<WniosekZmianyImieniaINazwiska> Uzytkownik.getWnioskiZmianyDanych() {
        return this.wnioskiZmianyDanych;
    }
    
    public void Uzytkownik.setWnioskiZmianyDanych(Set<WniosekZmianyImieniaINazwiska> wnioskiZmianyDanych) {
        this.wnioskiZmianyDanych = wnioskiZmianyDanych;
    }
    
    public KontoFakturowe Uzytkownik.getKontoFakturowe() {
        return this.kontoFakturowe;
    }
    
    public void Uzytkownik.setKontoFakturowe(KontoFakturowe kontoFakturowe) {
        this.kontoFakturowe = kontoFakturowe;
    }
    
    public Set<ZawieszenieKonta> Uzytkownik.getZawieszenieKontaUzytkownika() {
        return this.zawieszenieKontaUzytkownika;
    }
    
    public void Uzytkownik.setZawieszenieKontaUzytkownika(Set<ZawieszenieKonta> zawieszenieKontaUzytkownika) {
        this.zawieszenieKontaUzytkownika = zawieszenieKontaUzytkownika;
    }
    
    public Set<ZawieszenieKonta> Uzytkownik.getZawieszenieUzytkownika() {
        return this.zawieszenieUzytkownika;
    }
    
    public void Uzytkownik.setZawieszenieUzytkownika(Set<ZawieszenieKonta> zawieszenieUzytkownika) {
        this.zawieszenieUzytkownika = zawieszenieUzytkownika;
    }
    
    public Set<ListAktywacyjny> Uzytkownik.getListyAktywacyjne() {
        return this.listyAktywacyjne;
    }
    
    public void Uzytkownik.setListyAktywacyjne(Set<ListAktywacyjny> listyAktywacyjne) {
        this.listyAktywacyjne = listyAktywacyjne;
    }
    
}
