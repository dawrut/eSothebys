package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Oferta {

    /**
     */
    @NotNull
    private int liczbaSztuk;

    /**
     */
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date terminZlozenia;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date terminOdrzucenia;

    /**
     */
    private String powodOdrzucenia;

    /**
     */
    @ManyToOne
    private Aukcja aukcja;

    /**
     */
    @ManyToOne
    private Uczestnik kupujacy;
}
