package com.tenpines.xtend.lapses

import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*
import org.junit.Before
import com.tenpines.xtend.model.DayOfWeek

class LapseTest {
	
	Availability availability 
	
	@Before
	def void init() {
		val firstLimit = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 0))
		val lastLimit = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 0))
		availability = new Availability(firstLimit, lastLimit)
	}
	
	@Test
	def void wantedIntervalIsWithinTheGivenRange() {
		val mondayHalfPastThree = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 30))
		val mondayFiveOClock = new DayTime(DayOfWeek.MONDAY, new LocalTime(17, 0))
		assertTrue( availability.includes(new Availability(mondayHalfPastThree, mondayFiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheLeft() {
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		val mondayFiveOClock = new DayTime(DayOfWeek.MONDAY, new LocalTime(17, 0))
		assertFalse( availability.includes(new Availability(mondayHalfPastTwo, mondayFiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheRight() {
		val mondayHalfPastThree = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 30))
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		assertFalse( availability.includes(new Availability(mondayHalfPastThree, mondayHalfPastSix)) )
	}

	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromBothSides() {
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		assertFalse( availability.includes(new Availability(mondayHalfPastTwo, mondayHalfPastSix)) )
	}

	@Test
	def void wantedIntervalIsCompletelyBeforeTheGivenRange() {
		val mondayHalfPastTen = new DayTime(DayOfWeek.MONDAY, new LocalTime(10, 30))
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		assertFalse( availability.includes(new Availability(mondayHalfPastTen, mondayHalfPastTwo)) )
	}
	
	@Test
	def void wantedIntervalIsCompletelyAfterTheGivenRange() {
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		val mondayHalfPastEight = new DayTime(DayOfWeek.MONDAY, new LocalTime(20, 30))
		assertFalse( availability.includes(new Availability(mondayHalfPastSix, mondayHalfPastEight)) )
	}
}