// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import java.util.Set;
import pl.wroc.pwr.wiz.io.psi.model.Aukcja;
import pl.wroc.pwr.wiz.io.psi.model.NaruszeniaRegulaminu;
import pl.wroc.pwr.wiz.io.psi.model.SposobAktywacji;
import pl.wroc.pwr.wiz.io.psi.model.StanKonta;
import pl.wroc.pwr.wiz.io.psi.model.Uczestnik;

privileged aspect Uczestnik_Roo_JavaBean {
    
    public String Uczestnik.getImie() {
        return this.imie;
    }
    
    public void Uczestnik.setImie(String imie) {
        this.imie = imie;
    }
    
    public String Uczestnik.getNazwisko() {
        return this.nazwisko;
    }
    
    public void Uczestnik.setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }
    
    public String Uczestnik.getFirma() {
        return this.firma;
    }
    
    public void Uczestnik.setFirma(String firma) {
        this.firma = firma;
    }
    
    public String Uczestnik.getPesel() {
        return this.pesel;
    }
    
    public void Uczestnik.setPesel(String pesel) {
        this.pesel = pesel;
    }
    
    public String Uczestnik.getLogin() {
        return this.login;
    }
    
    public void Uczestnik.setLogin(String login) {
        this.login = login;
    }
    
    public String Uczestnik.getTelefon() {
        return this.telefon;
    }
    
    public void Uczestnik.setTelefon(String telefon) {
        this.telefon = telefon;
    }
    
    public String Uczestnik.getDrugiTelefon() {
        return this.drugiTelefon;
    }
    
    public void Uczestnik.setDrugiTelefon(String drugiTelefon) {
        this.drugiTelefon = drugiTelefon;
    }
    
    public Date Uczestnik.getDataUrodzenia() {
        return this.dataUrodzenia;
    }
    
    public void Uczestnik.setDataUrodzenia(Date dataUrodzenia) {
        this.dataUrodzenia = dataUrodzenia;
    }
    
    public Date Uczestnik.getDataUtworzenia() {
        return this.dataUtworzenia;
    }
    
    public void Uczestnik.setDataUtworzenia(Date dataUtworzenia) {
        this.dataUtworzenia = dataUtworzenia;
    }
    
    public Date Uczestnik.getDataOstatniegoLogowania() {
        return this.dataOstatniegoLogowania;
    }
    
    public void Uczestnik.setDataOstatniegoLogowania(Date dataOstatniegoLogowania) {
        this.dataOstatniegoLogowania = dataOstatniegoLogowania;
    }
    
    public StanKonta Uczestnik.getStanKonta() {
        return this.stanKonta;
    }
    
    public void Uczestnik.setStanKonta(StanKonta stanKonta) {
        this.stanKonta = stanKonta;
    }
    
    public Boolean Uczestnik.getCzyWykonalAkcje() {
        return this.czyWykonalAkcje;
    }
    
    public void Uczestnik.setCzyWykonalAkcje(Boolean czyWykonalAkcje) {
        this.czyWykonalAkcje = czyWykonalAkcje;
    }
    
    public Date Uczestnik.getOdKiedyZawieszone() {
        return this.odKiedyZawieszone;
    }
    
    public void Uczestnik.setOdKiedyZawieszone(Date odKiedyZawieszone) {
        this.odKiedyZawieszone = odKiedyZawieszone;
    }
    
    public Date Uczestnik.getAkceptacjaZmianRegulaminu() {
        return this.akceptacjaZmianRegulaminu;
    }
    
    public void Uczestnik.setAkceptacjaZmianRegulaminu(Date akceptacjaZmianRegulaminu) {
        this.akceptacjaZmianRegulaminu = akceptacjaZmianRegulaminu;
    }
    
    public SposobAktywacji Uczestnik.getSposobAktywacji() {
        return this.sposobAktywacji;
    }
    
    public void Uczestnik.setSposobAktywacji(SposobAktywacji sposobAktywacji) {
        this.sposobAktywacji = sposobAktywacji;
    }
    
    public int Uczestnik.getKodAktywacyjny() {
        return this.kodAktywacyjny;
    }
    
    public void Uczestnik.setKodAktywacyjny(int kodAktywacyjny) {
        this.kodAktywacyjny = kodAktywacyjny;
    }
    
    public Boolean Uczestnik.getZamowioneZestawienieTransakcji() {
        return this.zamowioneZestawienieTransakcji;
    }
    
    public void Uczestnik.setZamowioneZestawienieTransakcji(Boolean zamowioneZestawienieTransakcji) {
        this.zamowioneZestawienieTransakcji = zamowioneZestawienieTransakcji;
    }
    
    public Date Uczestnik.getDataRozpoczeciaZamknieciaKonta() {
        return this.dataRozpoczeciaZamknieciaKonta;
    }
    
    public void Uczestnik.setDataRozpoczeciaZamknieciaKonta(Date dataRozpoczeciaZamknieciaKonta) {
        this.dataRozpoczeciaZamknieciaKonta = dataRozpoczeciaZamknieciaKonta;
    }
    
    public Date Uczestnik.getDataZamknieciaKonta() {
        return this.dataZamknieciaKonta;
    }
    
    public void Uczestnik.setDataZamknieciaKonta(Date dataZamknieciaKonta) {
        this.dataZamknieciaKonta = dataZamknieciaKonta;
    }
    
    public String Uczestnik.getPowodZamknieciaKonta() {
        return this.powodZamknieciaKonta;
    }
    
    public void Uczestnik.setPowodZamknieciaKonta(String powodZamknieciaKonta) {
        this.powodZamknieciaKonta = powodZamknieciaKonta;
    }
    
    public Set<Aukcja> Uczestnik.getObserwowaneAukcje() {
        return this.obserwowaneAukcje;
    }
    
    public void Uczestnik.setObserwowaneAukcje(Set<Aukcja> obserwowaneAukcje) {
        this.obserwowaneAukcje = obserwowaneAukcje;
    }
    
    public Set<Aukcja> Uczestnik.getWystawioneAukcje() {
        return this.wystawioneAukcje;
    }
    
    public void Uczestnik.setWystawioneAukcje(Set<Aukcja> wystawioneAukcje) {
        this.wystawioneAukcje = wystawioneAukcje;
    }
    
    public Set<NaruszeniaRegulaminu> Uczestnik.getOtrzymaneUpomnienia() {
        return this.otrzymaneUpomnienia;
    }
    
    public void Uczestnik.setOtrzymaneUpomnienia(Set<NaruszeniaRegulaminu> otrzymaneUpomnienia) {
        this.otrzymaneUpomnienia = otrzymaneUpomnienia;
    }
    
    public Set<NaruszeniaRegulaminu> Uczestnik.getZgloszoneUpomnienia() {
        return this.zgloszoneUpomnienia;
    }
    
    public void Uczestnik.setZgloszoneUpomnienia(Set<NaruszeniaRegulaminu> zgloszoneUpomnienia) {
        this.zgloszoneUpomnienia = zgloszoneUpomnienia;
    }
    
}
