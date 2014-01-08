package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.NotNull;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Uczestnik {

    /**
     */
    private String imie;

    /**
     */
    private String nazwisko;

    /**
     */
    private String firma;

    /**
     */
    private String pesel;

    /**
     */
    @Column(unique = true)
    private String login;

    /**
     */
    private String telefon;

    /**
     */
    private String drugiTelefon;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataUrodzenia;

    /**
     */
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataUtworzenia;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataOstatniegoLogowania;

    /**
     */
    @Enumerated(EnumType.STRING)
    private StanKonta stanKonta;

    /**
     */
    @Value("false")
    private Boolean czyWykonalAkcje;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date odKiedyZawieszone;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date akceptacjaZmianRegulaminu;

    /**
     */
    @Enumerated(EnumType.STRING)
    private SposobAktywacji sposobAktywacji;

    /**
     */
    private int kodAktywacyjny;

    /**
     */
    private Boolean zamowioneZestawienieTransakcji;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataRozpoczeciaZamknieciaKonta;

    /**
     */
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date dataZamknieciaKonta;

    /**
     */
    private String powodZamknieciaKonta;
}
