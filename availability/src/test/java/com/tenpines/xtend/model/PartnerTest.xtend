package com.tenpines.xtend.model

import com.tenpines.xtend.lapses.Availability
import com.tenpines.xtend.lapses.DayTime
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class PartnerTest {

	Partner partner
	
	@Before
	def void init() {
		DayOfWeek.setToday(new LocalDate(2014, 3 , 7))
		val availabilities = # [
			new Availability(new DayTime(DayOfWeek.MONDAY, new LocalTime(9, 30)), new DayTime(DayOfWeek.WEDNESDAY, new LocalTime(15, 0)))
		]
		partner = new Partner(availabilities)
	}

	@Test
	def void isAvailableIfIsIncludedInARange() {
		val aMonday = new LocalDate(2014,02,10)
		assertTrue( partner.isAvailable(aMonday, new LocalTime(21, 30), new LocalTime(23, 59)))
	}
	
	@Test
	def void isNotAvailableIfIsntIncludedInAnyRange() {
		val aSunday = new LocalDate(2014,02,9)
		assertFalse( partner.isAvailable(aSunday, new LocalTime(21, 30), new LocalTime(23, 59)))
	}
	
	@Test
	def void isNotAvailableIfOverlapsAnyoneAtLeft() {
		val aMonday = new LocalDate(2014,02,10)
		assertFalse( partner.isAvailable(aMonday, new LocalTime(7, 30), new LocalTime(23, 59)))
	}
	
	@Test
	def void isNotAvailableIfOverlapsAnyoneAtRight() {
		val aWednesday = new LocalDate(2014,02,12)
		assertFalse( partner.isAvailable(aWednesday, new LocalTime(7, 30), new LocalTime(23, 59)))
	}
	
}
