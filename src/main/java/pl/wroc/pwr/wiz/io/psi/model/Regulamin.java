package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Regulamin {

  /**
     */
  @NotNull
  private String tresc;

  /**
     */
  @NotNull
  @Temporal(TemporalType.DATE)
  @DateTimeFormat(style = "M-")
  private Date odKiedy;

  /**
     */
  // @ManyToMany(cascade = CascadeType.ALL)
  // private Set<Uzytkownik> uczestnicy = new HashSet<Uzytkownik>();
}
