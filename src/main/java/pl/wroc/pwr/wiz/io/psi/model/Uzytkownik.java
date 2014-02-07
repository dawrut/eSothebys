package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findUzytkowniksByEmailEquals"})
@Cacheable(value = {"user"})
public class Uzytkownik {

  /**
     */
  @NotNull
  @Column(unique = true)
  private String email;

  /**
     */
  @NotNull
  private String haslo;

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
  @NotNull
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

  /**
     */
  @ManyToOne
  private Adres adresZamieszkania;

  /**
     */
  @NotNull
  @ManyToOne
  private WniosekRejestracyjny wniosekRejestracyjny;

  /**
     */
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "uzytkownik")
  private Set<WniosekZmianyImieniaINazwiska> wnioskiZmianyDanych =
      new HashSet<WniosekZmianyImieniaINazwiska>();

  /**
     */
  @ManyToOne
  private KontoFakturowe kontoFakturowe;

  /**
     */
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "zawieszajacy")
  private Set<ZawieszenieKonta> zawieszenieKontaUzytkownika = new HashSet<ZawieszenieKonta>();

  /**
     */
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "uzytkownik")
  private Set<ZawieszenieKonta> zawieszenieUzytkownika = new HashSet<ZawieszenieKonta>();

  /**
     */
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "uzytkownik")
  private Set<ListAktywacyjny> listyAktywacyjne = new HashSet<ListAktywacyjny>();

  /**
     */
  // @ManyToMany(cascade = CascadeType.ALL, mappedBy = "uczestnicy")
  // private Set<Regulamin> regulaminy = new HashSet<Regulamin>();
  public void setHaslo(String haslo) {
    this.haslo = haslo;
  }

  @Override
  public String toString() {
    return imie + " " + nazwisko;
  }
}
