// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import pl.wroc.pwr.wiz.io.psi.model.SzczegolyObserwacji;
import pl.wroc.pwr.wiz.io.psi.model.TerminPrzypomnienia;

privileged aspect SzczegolyObserwacji_Roo_JavaBean {
    
    public TerminPrzypomnienia SzczegolyObserwacji.getPrzypomnienie() {
        return this.przypomnienie;
    }
    
    public void SzczegolyObserwacji.setPrzypomnienie(TerminPrzypomnienia przypomnienie) {
        this.przypomnienie = przypomnienie;
    }
    
}
