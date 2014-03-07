package com.tenpines.xtend.lapses

import org.joda.time.LocalTime

class TimeLapse {
	
	@Property
	private LocalTime beggining;

	@Property
	private LocalTime end;
	
	new(LocalTime from, LocalTime to) {
		this.beggining = from
		this.end = to
	}
	
	def includes(TimeLapse range) {
		(range.beggining >= this.beggining) && (this.end >= range.end)
	}

}