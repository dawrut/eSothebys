package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Kategoria {

    /**
     */
    @NotNull
    private String nazwa;

    /**
     */
    @Value("false")
    private Boolean aukcjeJednoprzedmiotowe;

    /**
     */
    @Value("true")
    private Boolean dostepnaPlatoscKarta;

    /**
     */
    @Value("true")
    private Boolean dostepnaPlatoscPrzezPayU;
}
