package com.tenpines.xtend.model

import com.tenpines.xtend.model.timeLapse.TimeLapse
import java.util.List
import org.joda.time.LocalDate

class Availability {
	
	LocalDate date;
	List<TimeLapse> timeRanges;
	
	new(LocalDate aDate, List<TimeLapse> someTimeRanges) {
		date = aDate;
		timeRanges = someTimeRanges;
	}
	
	
	def isAvailable(LocalDate aDate, TimeLapse aTimeLapse) {
		date.equals(aDate) && hasAvailabilityFor(aTimeLapse)
	}
	
	def hasAvailabilityFor(TimeLapse lapse) {
		timeRanges.exists[ timeRange | timeRange.includes(lapse) ]
	}
	
}