package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class DaneDoWysylki {

    /**
     */
    @NotNull
    private String imie;

    /**
     */
    @NotNull
    private String nazwisko;

    /**
     */
    @NotNull
    private String firma;
}
