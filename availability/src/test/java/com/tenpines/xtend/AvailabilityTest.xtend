package com.tenpines.xtend

import com.tenpines.xtend.model.Availability
import com.tenpines.xtend.model.DayOfWeek
import com.tenpines.xtend.model.timeLapse.TimeLapse
import java.util.List
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class AvailabilityTest {

	Availability availability
	
	List<TimeLapse> ranges
	
	
	@Before
	def void init() {
		val monday = DayOfWeek.MONDAY
		ranges = # [
			new TimeLapse(new LocalTime(18,00), new LocalTime(19, 30)),
			new TimeLapse(new LocalTime(22,00), new LocalTime(23, 30))
		]
		availability = new Availability(monday, ranges)
	}

	@Test
	def void isNotAvailableIfDayIsTheSameAndTimeLapseIsntIncludedInAnyRange() {
		assertFalse( availability.isAvailable(new LocalDate(2014, 1, 1), new TimeLapse(new LocalTime(20,00), new LocalTime(20, 30))) )
	}
	
	@Test
	def void isNotAvailableIfDayIsNotTheSameAndTimeLapseIsIncludedInAnyRange() {
		assertFalse( availability.isAvailable(new LocalDate(2014, 1, 2), new TimeLapse(new LocalTime(22,00), new LocalTime(22, 30))) )
	}

	@Test
	def void isAvailableIfDayIsTheSameAndTimeLapseIsIncludedInAnyRange() {
		val monday = new LocalDate(2014, 02, 10)
		val lapse = new TimeLapse(new LocalTime(22,00), new LocalTime(22, 30))
		assertTrue( availability.isAvailable(monday, lapse) )
	}
}
