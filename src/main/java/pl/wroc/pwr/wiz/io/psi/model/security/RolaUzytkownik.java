package pl.wroc.pwr.wiz.io.psi.model.security;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@Table(name = "rola_uzytkownik")
public class RolaUzytkownik {

  /**
     */
  @ManyToOne
  @JoinColumn(name = "email")
  private Uzytkownik email;

  /**
     */
  @ManyToOne
  @JoinColumn(name = "id_roli")
  private Rola idRoli;
  
  public String getNazwisko() {
    return email.getNazwisko();
  }
}
