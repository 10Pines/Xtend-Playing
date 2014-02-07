package com.tenpines.xtend;

import com.tenpines.xtend.model.Availability;
import com.tenpines.xtend.model.User;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.joda.time.LocalDate;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class AddAvailabilityTest {
  private final User someone = new Function0<User>() {
    public User apply() {
      User _user = new User();
      return _user;
    }
  }.apply();
  
  private final Availability availability = new Function0<Availability>() {
    public Availability apply() {
      LocalDate _localDate = new LocalDate();
      Availability _availability = new Availability(_localDate);
      return _availability;
    }
  }.apply();
  
  @Test
  public void test1() {
    this.someone.addAvailability(this.availability);
    boolean _isAvailable = this.someone.isAvailable(this.availability);
    Assert.assertTrue(_isAvailable);
  }
  
  @Test
  public void test2() {
    boolean _isAvailable = this.someone.isAvailable(this.availability);
    Assert.assertFalse(_isAvailable);
  }
  
  @Test
  public void test3() {
    LocalDate _localDate = new LocalDate(2012, 12, 1);
    final LocalDate date = _localDate;
    this.someone.addAvailability(this.availability);
    boolean _isAvailable = this.someone.isAvailable(date);
    Assert.assertTrue(_isAvailable);
  }
}
