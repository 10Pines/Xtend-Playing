package com.tenpines.xtend.model;

import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class Availability {
  private LocalDate date;
  
  public Availability(final LocalDate aDate) {
    this.date = aDate;
  }
  
  public boolean isAvailable(final LocalDate aDate) {
    boolean _equals = this.date.equals(aDate);
    return _equals;
  }
}
