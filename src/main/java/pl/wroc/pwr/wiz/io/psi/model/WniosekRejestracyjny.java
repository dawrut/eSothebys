package pl.wroc.pwr.wiz.io.psi.model;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findWniosekRejestracyjnysByEmailEquals" })
public class WniosekRejestracyjny {

    /**
     */
    @NotNull
    private String haslo;

    @Transient
    private String retypedPassword;

    /**
     */
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataUrodzenia;

    /**
     */
    @NotNull
    @Column(unique = true)
    private String email;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataZlozenia;

    /**
     */
    @ManyToOne
    private Uzytkownik uzytkownik;

    public void setHaslo(String haslo) throws NoSuchAlgorithmException {
        // TODO: NAPRAWIC SHA256
        // ShaHashingUtil hasher = new ShaHashingUtil();
        this.haslo = haslo; // hasher.hashPassword(haslo);
    }

    public void setRetypedPassword(String retypedPassword) {
        this.retypedPassword = retypedPassword;
    }

    public String getRetypedPassword() {
        return retypedPassword;
    }
}
