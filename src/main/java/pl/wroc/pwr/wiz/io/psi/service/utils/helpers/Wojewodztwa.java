package pl.wroc.pwr.wiz.io.psi.service.utils.helpers;

public enum Wojewodztwa {
  //@formatter:off
  Dolnoslaskie(Kraje.POLSKA),
  Mazowieckie(Kraje.POLSKA),
  Branderburgia(Kraje.NIEMCY),
  Bawaria(Kraje.NIEMCY),
  Kastylia(Kraje.HIPSZANIA),
  California(Kraje.USA),
  Nowy_Jork(Kraje.USA);
  //@formatter:on

  private final Kraje kraj;

  Wojewodztwa(Kraje kraj) {
    this.kraj = kraj;
  }

  public Kraje getKraj() {
    return this.kraj;
  }

}
