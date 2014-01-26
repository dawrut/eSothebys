package pl.wroc.pwr.wiz.io.psi.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
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
