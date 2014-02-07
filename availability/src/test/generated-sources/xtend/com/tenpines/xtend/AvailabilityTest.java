package com.tenpines.xtend;

import com.tenpines.xtend.model.Availability;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.joda.time.DateTime;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class AvailabilityTest {
  private Availability availability = new Function0<Availability>() {
    public Availability apply() {
      Availability _availability = new Availability();
      return _availability;
    }
  }.apply();
  
  @Test
  public void test1() {
    DateTime _dateTime = new DateTime();
    boolean _isAvailable = this.availability.isAvailable(_dateTime);
    Assert.assertFalse(_isAvailable);
  }
}
