package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.beans.factory.annotation.Value;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class CennikDostaw {

    /**
     */
    private String nazwa;

    /**
     */
    @Value("false")
    private Boolean szablon;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cennikDostawy")
    private Set<Aukcja> aukcje = new HashSet<Aukcja>();
}
