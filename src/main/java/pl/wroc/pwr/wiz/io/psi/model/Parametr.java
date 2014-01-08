package pl.wroc.pwr.wiz.io.psi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import org.springframework.beans.factory.annotation.Value;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

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

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "parametry")
    private Set<Aukcja> towary = new HashSet<Aukcja>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "parametry")
    private Set<Kategoria> kategorie = new HashSet<Kategoria>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "parametr")
    private Set<Wartosc> mozliweWartosci = new HashSet<Wartosc>();
}
