// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import java.util.Set;
import pl.wroc.pwr.wiz.io.psi.model.Regulamin;
import pl.wroc.pwr.wiz.io.psi.model.Uczestnik;

privileged aspect Regulamin_Roo_JavaBean {
    
    public String Regulamin.getTresc() {
        return this.tresc;
    }
    
    public void Regulamin.setTresc(String tresc) {
        this.tresc = tresc;
    }
    
    public Date Regulamin.getOdKiedy() {
        return this.odKiedy;
    }
    
    public void Regulamin.setOdKiedy(Date odKiedy) {
        this.odKiedy = odKiedy;
    }
    
    public Set<Uczestnik> Regulamin.getUczestnicy() {
        return this.uczestnicy;
    }
    
    public void Regulamin.setUczestnicy(Set<Uczestnik> uczestnicy) {
        this.uczestnicy = uczestnicy;
    }
    
}
