package com.tenpines.xtend

import com.tenpines.xtend.model.Availability
import com.tenpines.xtend.model.timeLapse.TimeLapse
import java.util.List
import org.joda.time.LocalDate
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.joda.time.LocalTime

class AvailabilityTest {

	Availability availability
	
	List<TimeLapse> ranges
	
	
	@Before
	def void init() {
		val januaryFst = new LocalDate(2014, 1, 1)
		ranges = # [
			new TimeLapse(new LocalTime(18,00), new LocalTime(19, 30)),
			new TimeLapse(new LocalTime(22,00), new LocalTime(23, 30))
		]
		availability = new Availability(januaryFst, ranges)
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
		assertTrue( availability.isAvailable(new LocalDate(2014, 1, 1), new TimeLapse(new LocalTime(22,00), new LocalTime(22, 30))) )
	}
}
