package pl.wroc.pwr.wiz.io.psi.model.security;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findRolasByNazwaRoliLike"})
@Table(name = "rola")
public class Rola {

  /**
     */
  @NotNull
  @Size(min = 8, max = 20)
  @Column(unique = true, name = "id_roli")
  private String idRoli;

  /**
     */
  @NotNull
  @Size(min = 5, max = 40)
  @Pattern(regexp = "^ROLE_[A-Z]*")
  @Column(name = "nazwa_roli")
  private String nazwaRoli;
}
