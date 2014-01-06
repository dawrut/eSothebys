package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UstawieniaSprzedazy {

    /**
     */
    private int numerKonta1;

    /**
     */
    private Boolean widocznyNumerKonta1;

    /**
     */
    private int numerKonta2;

    /**
     */
    private Boolean widocznyNumerKonta2;

    /**
     */
    private String wiadomoscDlaKupujacych;

    /**
     */
    @Enumerated(EnumType.STRING)
    private Kolor kolorZnakuWodnego;

    /**
     */
    private int lokalizacjaZnakuWodnego;

    /**
     */
    private int przezroczystoscZnakuWodnego;

    /**
     */
    @Value("false")
    private Boolean domyslnieZnakWodny;
}
