// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import pl.wroc.pwr.wiz.io.psi.model.PowodZmianyDanych;
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiska;

privileged aspect WniosekZmianyImieniaINazwiska_Roo_JavaBean {
    
    public String WniosekZmianyImieniaINazwiska.getImie() {
        return this.imie;
    }
    
    public void WniosekZmianyImieniaINazwiska.setImie(String imie) {
        this.imie = imie;
    }
    
    public String WniosekZmianyImieniaINazwiska.getNazwisko() {
        return this.nazwisko;
    }
    
    public void WniosekZmianyImieniaINazwiska.setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }
    
    public Date WniosekZmianyImieniaINazwiska.getDataZlozenia() {
        return this.dataZlozenia;
    }
    
    public void WniosekZmianyImieniaINazwiska.setDataZlozenia(Date dataZlozenia) {
        this.dataZlozenia = dataZlozenia;
    }
    
    public PowodZmianyDanych WniosekZmianyImieniaINazwiska.getPowod() {
        return this.powod;
    }
    
    public void WniosekZmianyImieniaINazwiska.setPowod(PowodZmianyDanych powod) {
        this.powod = powod;
    }
    
    public Uzytkownik WniosekZmianyImieniaINazwiska.getUzytkownik() {
        return this.uzytkownik;
    }
    
    public void WniosekZmianyImieniaINazwiska.setUzytkownik(Uzytkownik uzytkownik) {
        this.uzytkownik = uzytkownik;
    }
    
}
