package pl.wroc.pwr.wiz.io.psi.service.utils.helpers;

import java.util.List;

import pl.wroc.pwr.wiz.io.psi.model.Kraj;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;

public class AdresGenerator {


  private static final String EMPTY_SPACE = " ";
  private static final String APPARTMENT_SEPARATOR = "/";
  private static final String MARSZALKOWSKA = "Marszalkowska";
  private static final int NUMBER_OF_DIGITS_IN_POSTAL_CODE = 5;
  private static final String POSTAL_SEPARATOR = "-";

  public String generateRandomPostalCode() {
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i < NUMBER_OF_DIGITS_IN_POSTAL_CODE; i++) {
      builder.append(getRandomDigit());
      if (i == 1) builder.append(POSTAL_SEPARATOR);
    }
    return builder.toString();
  }

  public Wojewodztwo getRandomWojewodztwoByKraj(Kraj kraj) {
    List<Wojewodztwo> wojewodztwa = Wojewodztwo.findWojewodztwoesByKraj(kraj).getResultList();
    int wojewodztwoCount = wojewodztwa.size();

    return wojewodztwa.get(getRandomIndexBySize(wojewodztwoCount));
  }

  public String generateRandomUlicaZNumerem() {
    //@formatter:off
    return new StringBuilder(MARSZALKOWSKA)
                            .append(EMPTY_SPACE)
                            .append(getRandomDigit())
                            .append(getRandomDigit())
                            .append(APPARTMENT_SEPARATOR)
                            .append(getRandomDigit())
                            .toString();
    //@formatter:on
  }

  public String getRandomMiejscowosc() {
    Miejscowosci[] miejsowosci = Miejscowosci.values();

    return miejsowosci[getRandomIndexBySize(miejsowosci.length)].toString();
  }

  private int getRandomDigit() {
    return (int) (Math.random() * 9) + 1;
  }

  private int getRandomIndexBySize(int length) {
    return (int) (Math.random() * length);
  }

}
