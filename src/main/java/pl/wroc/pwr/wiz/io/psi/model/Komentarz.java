package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.beans.factory.annotation.Value;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Komentarz {

    /**
     */
    @Enumerated(EnumType.STRING)
    private RodzajKomentarza rodzaj;

    /**
     */
    @NotNull
    private String tresc;

    /**
     */
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataWystawienia;

    /**
     */
    @Value("false")
    private Boolean uniewazniony;

    /**
     */
    @ManyToOne
    private Uczestnik wystawiajacy;

    /**
     */
    @Size(max = 2)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "komentarz")
    private Set<WniosekOUniewaznienie> wnioskiOUniewaznienie = new HashSet<WniosekOUniewaznienie>();

    /**
     */
    @OneToOne
    @JoinColumn(name = "komentarz")
    private Ocena ocena;

    /**
     */
    @ManyToOne
    private Umowa umowa;

    /**
     */
    @ManyToOne
    private GraficznaOcenaSprzedazy graficznaOcena;
}
