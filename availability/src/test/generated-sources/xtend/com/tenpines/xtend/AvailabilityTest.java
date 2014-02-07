package com.tenpines.xtend;

import com.tenpines.xtend.model.Availability;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.joda.time.LocalDate;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class AvailabilityTest {
  private Availability availability;
  
  private final LocalDate availableDate = new Function0<LocalDate>() {
    public LocalDate apply() {
      LocalDate _localDate = new LocalDate(2014, 1, 1);
      return _localDate;
    }
  }.apply();
  
  @Before
  public void init() {
    LocalDate _localDate = new LocalDate(2014, 1, 1);
    final LocalDate januaryFst = _localDate;
    Availability _availability = new Availability(januaryFst);
    this.availability = _availability;
  }
  
  @Test
  public void test1() {
    LocalDate _localDate = new LocalDate();
    boolean _isAvailable = this.availability.isAvailable(_localDate);
    Assert.assertFalse(_isAvailable);
  }
  
  @Test
  public void test2() {
    boolean _isAvailable = this.availability.isAvailable(this.availableDate);
    Assert.assertTrue(_isAvailable);
  }
}
