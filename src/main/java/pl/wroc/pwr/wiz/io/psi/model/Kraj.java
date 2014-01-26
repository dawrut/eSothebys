package pl.wroc.pwr.wiz.io.psi.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findKrajsByNazwaLike"})
public class Kraj {

  /**
     */
  @Column(unique = true)
  @NotNull
  private String nazwa;

  /**
     */
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "kraj")
  private Set<Wojewodztwo> wojewodztwa = new HashSet<Wojewodztwo>();

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "kraj")
  private Set<Adres> adresy = new HashSet<Adres>();

}
