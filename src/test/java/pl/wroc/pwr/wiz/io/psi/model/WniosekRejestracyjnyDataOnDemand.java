package pl.wroc.pwr.wiz.io.psi.model;

import java.security.NoSuchAlgorithmException;

import org.springframework.roo.addon.dod.RooDataOnDemand;

@RooDataOnDemand(entity = WniosekRejestracyjny.class)
public class WniosekRejestracyjnyDataOnDemand {
  public void setHaslo(WniosekRejestracyjny obj, int index) {
    String haslo = "haslo_" + index;
    try {
      obj.setHaslo(haslo);
    } catch (NoSuchAlgorithmException e) {
      System.out.println("ERROR IN TEST");
    }
  }
}
