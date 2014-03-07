package com.tenpines.xtend.model

import com.tenpines.xtend.lapses.TimeLapse
import java.util.ArrayList
import java.util.Arrays
import java.util.List
import org.joda.time.LocalDate

class Availability {
	
	@Property	
	DayOfWeek dayOfWeek
	
	@Property
	List<TimeLapse> timeLapses = new ArrayList
	
	new(DayOfWeek aDayOfWeek, TimeLapse... someTimeRanges) {
		dayOfWeek = aDayOfWeek
		timeLapses = new ArrayList(Arrays.asList(someTimeRanges))
	}
	
	
	def isAvailable(LocalDate aDate, TimeLapse aTimeLapse) {
		isAvailable(aDate) && hasAvailabilityFor(aTimeLapse)
	}
	
	def isAvailable(Object aDate){
		switch(aDate) {
			LocalDate :	return dayOfWeek.belongs(aDate)
			DayOfWeek : return dayOfWeek.equals(aDate)
			default : throw new UnsupportedOperationException("Unhandled condition")
		}
	}
	
	def addTimeLapses(List<TimeLapse> someLapses){
		this.timeLapses.addAll(someLapses)
	}
		
	def hasAvailabilityFor(TimeLapse lapse) {
		timeLapses.exists[ timeRange | timeRange.includes(lapse) ]
	}
	
}