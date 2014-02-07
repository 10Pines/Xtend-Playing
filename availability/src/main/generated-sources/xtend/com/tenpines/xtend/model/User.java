package com.tenpines.xtend.model;

import com.tenpines.xtend.model.Availability;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class User {
  private List<Availability> availabilities = new Function0<List<Availability>>() {
    public List<Availability> apply() {
      ArrayList<Availability> _arrayList = new ArrayList<Availability>();
      return _arrayList;
    }
  }.apply();
  
  public boolean addAvailability(final Availability availability) {
    boolean _add = this.availabilities.add(availability);
    return _add;
  }
  
  public boolean isAvailable(final Object availability) {
    boolean _xblockexpression = false;
    {
      boolean _matched = false;
      if (!_matched) {
        if (availability instanceof Availability) {
          _matched=true;
          this.availabilities.contains(availability);
        }
      }
      if (!_matched) {
        if (availability instanceof LocalDate) {
          _matched=true;
          return true;
        }
      }
      boolean _contains = this.availabilities.contains(availability);
      _xblockexpression = (_contains);
    }
    return _xblockexpression;
  }
}
