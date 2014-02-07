package com.tenpines.xtend.model.timeRange

import org.joda.time.LocalTime

class TimeRange {
	
	@Property
	private LocalTime from;

	@Property
	private LocalTime to;
	
	new(LocalTime from, LocalTime to) {
		this.from = from
		this.to = to
	}
	
	def includes(TimeRange range) {
		(range.from >= this.from) && (this.to >= range.to)
	}

}