package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Aukcja {

    /**
     */
    @NotNull
    private String tytul;

    /**
     */
    @NotNull
    private String opisPrzedmiotu;

    /**
     */
    private int liczbaPrzedmiotow;

    /**
     */
    private double cenaKupTeraz;

    /**
     */
    private String dodatkoweInformacjeODostawiePlatnosci;

    /**
     */
    private Boolean kosztPrzesylkiPokrywaKupujacy;

    /**
     */
    private Boolean wysylkaZaGranice;

    /**
     */
    private Boolean fakturaVAT;

    /**
     */
    private int numberKonta1;

    /**
     */
    private int numberKonta2;

    /**
     */
    private Boolean szablon;

    /**
     */
    private int liczbaOdwiedzin;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date terminRozpoczecia;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date terminOstatnichOdwiedzin;
}
