package com.tenpines.xtend.model

import com.tenpines.xtend.model.timeLapse.TimeLapse
import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate

class Partner {
	
	val List<Availability> availabilities = new ArrayList
	
	def addAvailability(Availability availability) {
		val anExistingAvailability = availabilitiesFor(availability.dayOfWeek) 
		if(anExistingAvailability == null){
			availabilities.add(availability)
		}else{
			anExistingAvailability.addTimeLapses(availability.timeLapses)
		}
	}
	
	def isAvailableOn(LocalDate aDate, TimeLapse aTimeLapse) {
		availabilities.exists[ anAvailability | anAvailability.isAvailable(aDate,aTimeLapse)]
	}
	
	def availabilitiesFor(LocalDate date) {
		availabilities.findFirst[ anAvailability | anAvailability.isAvailable(date)]
	}
	
	def availabilitiesFor(DayOfWeek day) {
		availabilities.findFirst[ anAvailability | anAvailability.isAvailable(day)]
	}
	
	
	
}