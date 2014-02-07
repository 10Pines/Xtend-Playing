package com.tenpines.xtend.model

import java.util.List
import java.util.ArrayList
import org.joda.time.DateTime

class User {
	
	private List<Availability> availabilities = new ArrayList
	
	def addAvailability(Availability availability) {
		availabilities.add(availability)
	}
	
	def isAvailable(Object availability) {
		switch availability {
			Availability : availabilities.contains(availability)
			DateTime : return true
		}
		availabilities.contains(availability)
	}
	
}