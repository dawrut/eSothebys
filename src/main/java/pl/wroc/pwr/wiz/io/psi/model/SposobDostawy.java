package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SposobDostawy {

    /**
     */
    @NotNull
    private String nazwa;

    /**
     */
    @Value("false")
    private Boolean edytowalny;

    /**
     */
    private int czasDostawy;

    /**
     */
    @NotNull
    @Enumerated(EnumType.STRING)
    private RodzajPlatnosci rodzajPlatnosci;
}
