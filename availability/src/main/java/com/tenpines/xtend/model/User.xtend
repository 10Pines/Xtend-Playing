package com.tenpines.xtend.model

import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate

class User {
	
	private List<Availability> availabilities = new ArrayList
	
	def addAvailability(Availability availability) {
		availabilities.add(availability)
	}
	
	def isAvailable(Object availability) {
		switch availability {
			Availability : availabilities.contains(availability)
			LocalDate : return true
			default: return false
		}
		availabilities.contains(availability)
	}
	
}