package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Parametr {

    /**
     */
    @NotNull
    private String nazwa;

    /**
     */
    @Enumerated(EnumType.STRING)
    private Parametr typ;

    /**
     */
    @NotNull
    private String jednostka;

    /**
     */
    @Value("false")
    private Boolean obligatoryjny;
}
