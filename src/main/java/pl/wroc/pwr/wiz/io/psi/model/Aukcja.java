package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.Min;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.ManyToOne;
import javax.persistence.ManyToMany;

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

    /**
     */
    @Enumerated(EnumType.STRING)
    private RodzajAukcji rodzajAukcji;

    /**
     */
    @Enumerated(EnumType.STRING)
    private DefinicjaJednostkiPrzedmiotu jednostka;

    /**
     */
    private double cenaWywolawcza;

    /**
     */
    @Min(0L)
    private double cenaMinimalna;

    /**
     */
    @Enumerated(EnumType.STRING)
    private TerminWysylki terminWysylki;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aukcja")
    private Set<HistoriaZmianOpisu> zmianyOpisu = new HashSet<HistoriaZmianOpisu>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aukcja")
    private Set<Zdjecie> zdjecia = new HashSet<Zdjecie>();

    /**
     */
    @OneToOne
    private Zdjecie miniatura;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aukcja")
    private Set<NaruszeniaRegulaminu> zgloszeniaNaruszenia = new HashSet<NaruszeniaRegulaminu>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aukcja")
    private Set<Oferta> oferty = new HashSet<Oferta>();

    /**
     */
    @ManyToOne
    private Kategoria kategoria;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "towary")
    private Set<Parametr> parametry = new HashSet<Parametr>();

    /**
     */
    @ManyToOne
    private Adres lokalizacja;

    /**
     */
    @ManyToOne
    private Aukcja cennikDostawy;

    /**
     */
    @ManyToOne
    private Uczestnik sprzedawca;

    /**
     */
    @ManyToOne
    private Uczestnik naruszajacy;

    /**
     */
    @ManyToOne
    private Uczestnik zglaszajacy;
}
