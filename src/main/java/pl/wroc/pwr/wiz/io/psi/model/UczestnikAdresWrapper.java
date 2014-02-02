package pl.wroc.pwr.wiz.io.psi.model;

import java.util.Date;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UczestnikAdresWrapper {

  /**
     */
  @NotNull
  @ManyToOne
  private Adres adres;

  /**
     */
  @NotNull
  @ManyToOne
  private Uzytkownik uzytkownik;


  public String getKodPocztowy() {
    return adres.getKodPocztowy();
  }

  public void setKodPocztowy(String kodPocztowy) {
    adres.setKodPocztowy(kodPocztowy);
  }

  public String getMiejscowosc() {
    return adres.getMiejscowosc();
  }

  public void setMiejscowosc(String miejscowosc) {
    adres.setMiejscowosc(miejscowosc);
  }

  public String getUlicaZNumerem() {
    return adres.getUlicaZNumerem();
  }

  public void setUlicaZNumerem(String ulicaZNumerem) {
    adres.setUlicaZNumerem(ulicaZNumerem);
  }

  public Kraj getKraj() {
    return adres.getKraj();
  }

  public void setKraj(Kraj kraj) {
    adres.setKraj(kraj);
  }

  public String getWojewodztwo() {
    return adres.getWojewodztwo().getNazwa();
  }

  public void setWojewodztwo(Wojewodztwo wojewodztwo) {
    adres.setWojewodztwo(wojewodztwo);
  }

  public String getImie() {
    return uzytkownik.getImie();
  }

  public void setImie(String imie) {
    uzytkownik.setImie(imie);
  }

  public String getNazwisko() {
    return uzytkownik.getNazwisko();
  }

  public void setNazwisko(String nazwisko) {
    uzytkownik.setNazwisko(nazwisko);
  }

  public String getFirma() {
    return uzytkownik.getFirma();
  }

  public void setFirma(String firma) {
    uzytkownik.setFirma(firma);
  }

  public String getPesel() {
    return uzytkownik.getPesel();
  }

  public void setPesel(String pesel) {
    uzytkownik.setPesel(pesel);
  }

  public String getLogin() {
    return uzytkownik.getLogin();
  }

  public void setLogin(String login) {
    uzytkownik.setLogin(login);
  }

  public String getTelefon() {
    return uzytkownik.getTelefon();
  }

  public void setTelefon(String telefon) {
    uzytkownik.setTelefon(telefon);
  }

  public String getDrugiTelefon() {
    return uzytkownik.getDrugiTelefon();
  }

  public void setDrugiTelefon(String drugiTelefon) {
    uzytkownik.setDrugiTelefon(drugiTelefon);
  }

  public Date getDataUrodzenia() {
    return uzytkownik.getDataUrodzenia();
  }

  public void setDataUrodzenia(Date dataUrodzenia) {
    uzytkownik.setDataUrodzenia(dataUrodzenia);
  }

  public Date getDataUtworzenia() {
    return uzytkownik.getDataUtworzenia();
  }

  public void setDataUtworzenia(Date dataUtworzenia) {
    uzytkownik.setDataUtworzenia(dataUtworzenia);
  }
}
