package pl.wroc.pwr.wiz.io.psi.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findWojewodztwoesByKraj"})
public class Wojewodztwo {

  /**
     */
  @NotNull
  private String nazwa;

  /**
     */
  @NotNull
  @ManyToOne
  private Kraj kraj;
}
