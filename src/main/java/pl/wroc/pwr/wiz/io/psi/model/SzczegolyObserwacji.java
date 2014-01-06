package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SzczegolyObserwacji {

    /**
     */
    @Enumerated(EnumType.STRING)
    private TerminPrzypomnienia przypomnienie;
}
