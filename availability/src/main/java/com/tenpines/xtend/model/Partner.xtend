package com.tenpines.xtend.model

import com.google.common.collect.Lists
import com.tenpines.xtend.lapses.Availability
import com.tenpines.xtend.lapses.DayTime
import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class Partner {
	
	
	@Property
	List<Availability> availabilities = new ArrayList
	
	new(Availability... someAvailabilities) {
		availabilities = Lists.newArrayList(someAvailabilities)
	}
	
	def isAvailable(LocalDate on, LocalTime from, LocalTime to) {
		val day = DayOfWeek.dayFromJodaIndex(on.getDayOfWeek())
		val searchedAvailability = new Availability(new DayTime(day, from), new DayTime(day, to))
		availabilities.exists[ availability | availability.includes(searchedAvailability) ]
	}
	
}