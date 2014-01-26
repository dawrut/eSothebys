package pl.wroc.pwr.wiz.io.psi.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.validation.constraints.NotNull;

import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import pl.wroc.pwr.wiz.io.psi.service.utils.ShaHashingUtil;

import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class WniosekRejestracyjny {

  /**
     */
  @NotNull
  private String haslo;

  /**
     */
  @NotNull
  @Temporal(TemporalType.DATE)
  @DateTimeFormat(style = "M-")
  private Date dataUrodzenia;

  /**
     */
  @NotNull
  private String email;

  /**
     */
  @NotNull
  @Temporal(TemporalType.DATE)
  @DateTimeFormat(style = "M-")
  private Date dataZlozenia;

  /**
     */
  @ManyToOne
  private Uzytkownik uzytkownik;

  public void setHaslo(String haslo) throws NoSuchAlgorithmException {
    ShaHashingUtil hasher = new ShaHashingUtil();
    this.haslo = hasher.hashPassword(haslo);
  }
}
