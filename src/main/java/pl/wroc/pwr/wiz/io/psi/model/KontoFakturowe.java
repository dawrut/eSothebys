package pl.wroc.pwr.wiz.io.psi.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class KontoFakturowe {

  /**
     */
  @NotNull
  private String nip;

  /**
     */
  private String nazwaDoFaktury;

  /**
     */
  @ManyToOne
  private Uzytkownik uzytkownik;
}
