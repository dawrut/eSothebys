package pl.wroc.pwr.wiz.io.psi.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Adres {

  /**
     */
  private String kodPocztowy;

  /**
     */
  private String miejscowosc;

  /**
     */
  private String ulicaZNumerem;

  /**
     */
  @NotNull
  @ManyToOne
  private Kraj kraj;

  /**
     */
  @ManyToOne
  private Wojewodztwo wojewodztwo;

  /**
     */
  // @ManyToOne
  // private Uzytkownik uzytkownik;
}
