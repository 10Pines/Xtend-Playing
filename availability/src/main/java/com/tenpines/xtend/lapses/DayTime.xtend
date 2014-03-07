package com.tenpines.xtend.lapses

import com.tenpines.xtend.model.DayOfWeek
import org.joda.time.LocalTime

class DayTime {
	
	private DayOfWeek dayOfWeek
	private LocalTime time
		
	new(DayOfWeek aDayOfWeek, LocalTime someTime) {
		dayOfWeek = aDayOfWeek
		time = someTime
	}
	
	def operator_lessEqualsThan(DayTime someTime) {
		dayOfWeek < someTime.dayOfWeek  || ( dayOfWeek.equals(someTime.dayOfWeek) && time <= someTime.time )
	}
	
}