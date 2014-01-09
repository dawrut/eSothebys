package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Adres {

    /**
     */
    private String kodPocztowy;

    /**
     */
    private String miejscowosc;

    /**
     */
    private String ulicaZNumerem;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lokalizacja")
    private Set<Aukcja> aukcje = new HashSet<Aukcja>();

    /**
     */
    @ManyToOne
    private Kraj kraj;
}
