package com.tenpines.xtend.lapses

class Availability {
	
	@Property
	private DayTime beggining;

	@Property
	private DayTime end;
	
	new(DayTime from, DayTime to) {
		this.beggining = from
		this.end = to
	}
	
	def includes(Availability range) {
		(this.beggining <= range.beggining) && (range.end <= this.end)
	}

}