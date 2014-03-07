package com.tenpines.xtend.model

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import com.tenpines.xtend.lapses.DayTime
import com.tenpines.xtend.lapses.Availability

class Partner {
	
	
	@Property
	List<Availability> availabilities = new ArrayList
	
	new(Availability... someAvailabilities) {
		availabilities = new ArrayList(Arrays.asList(someAvailabilities))
	}
	
	def isAvailable(LocalDate on, LocalTime from, LocalTime to) {
		val day = DayOfWeek.dayFromJodaIndex(on.getDayOfWeek())
		val searchedAvailability = new Availability(new DayTime(day, from), new DayTime(day, to))
		availabilities.exists[ availability | availability.includes(searchedAvailability) ]
	}
	
}