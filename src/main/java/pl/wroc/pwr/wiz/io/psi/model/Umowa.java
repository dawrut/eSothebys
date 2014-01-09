package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Umowa {

    /**
     */
    private int liczbaSztuk;

    /**
     */
    @Size(max = 2)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "umowa")
    private Set<Komentarz> komentarze = new HashSet<Komentarz>();
}
