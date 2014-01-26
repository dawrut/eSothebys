package pl.wroc.pwr.wiz.io.psi.service.utils.helpers;

import java.util.Date;
import java.util.GregorianCalendar;

public class DateGenerator {


  @SuppressWarnings("static-access")
  public Date createRandomBirthDate() {
    GregorianCalendar calendar = new GregorianCalendar();

    int year = randBetween(1920, 1995);

    calendar.set(calendar.YEAR, year);

    int dayOfYear = randBetween(1, calendar.getActualMaximum(calendar.DAY_OF_YEAR));

    calendar.set(calendar.DAY_OF_YEAR, dayOfYear);

    return calendar.getTime();
  }

  private int randBetween(int start, int end) {
    return start + (int) Math.round(Math.random() * (end - start));
  }

}
