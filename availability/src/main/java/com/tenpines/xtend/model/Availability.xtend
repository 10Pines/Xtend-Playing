package com.tenpines.xtend.model

import org.joda.time.LocalDate

class Availability {
	
	LocalDate date;
	
	new(LocalDate aDate) {
		date = aDate;
	}
	
	
	def isAvailable(LocalDate aDate) {
		date.equals(aDate)
	}
	
}