package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findWniosekZmianyImieniaINazwiskasByUzytkownik"})
public class WniosekZmianyImieniaINazwiska {

  /**
     */
  @NotNull
  private String imie;

  /**
     */
  @NotNull
  private String nazwisko;

  /**
     */
  @NotNull
  @Temporal(TemporalType.DATE)
  @DateTimeFormat(style = "M-")
  private Date dataZlozenia;

  /**
     */
  @NotNull
  @Enumerated
  private PowodZmianyDanych powod;

  /**
     */
  @NotNull
  @ManyToOne
  private Uzytkownik uzytkownik;

}
