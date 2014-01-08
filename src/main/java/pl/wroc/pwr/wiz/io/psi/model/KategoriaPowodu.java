package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class KategoriaPowodu {

    /**
     */
    @NotNull
    private String nazwa;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kategoria")
    private Set<PowodZgloszenia> powody = new HashSet<PowodZgloszenia>();
}
