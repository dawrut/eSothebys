// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import pl.wroc.pwr.wiz.io.psi.model.Odpowiedz;

privileged aspect Odpowiedz_Roo_JavaBean {
    
    public String Odpowiedz.getTresc() {
        return this.tresc;
    }
    
    public void Odpowiedz.setTresc(String tresc) {
        this.tresc = tresc;
    }
    
    public Date Odpowiedz.getDataWystawienia() {
        return this.dataWystawienia;
    }
    
    public void Odpowiedz.setDataWystawienia(Date dataWystawienia) {
        this.dataWystawienia = dataWystawienia;
    }
    
}
