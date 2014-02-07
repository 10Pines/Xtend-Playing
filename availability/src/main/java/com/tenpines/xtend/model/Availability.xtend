package com.tenpines.xtend.model

import org.joda.time.LocalDate
import org.joda.time.LocalTime

class Availability {
	
	LocalDate date;
	LocalTime time;
	
	new(LocalDate aDate, LocalTime aTime) {
		date = aDate;
		time = aTime;
	}
	
	
	def isAvailable(LocalDate aDate, LocalTime aTime) {
		date.equals(aDate) && time.equals(aTime)
	}
	
}