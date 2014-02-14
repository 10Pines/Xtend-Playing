package com.tenpines.xtend.timeLapse

import com.tenpines.xtend.model.timeLapse.TimeLapse
import org.joda.time.DateTime
import org.joda.time.DateTimeConstants
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*

class TimeLapseTest {
	
	val range = new TimeLapse(new LocalTime(15, 0), new LocalTime(18, 0))
	
	
	@Test
	def void wantedIntervalIsWithinTheGivenRange() {
		val halfPastThree = new LocalTime(15, 30)
		val fiveOClock = new LocalTime(17, 0)
		assertTrue( range.includes(new TimeLapse(halfPastThree, fiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheLeft() {
		val halfPastTwo = new LocalTime(14, 30)
		val fiveOClock = new LocalTime(17, 0)
		assertFalse( range.includes(new TimeLapse(halfPastTwo, fiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheRight() {
		val halfPastThree = new LocalTime(15, 30)
		val halfPastSix = new LocalTime(18, 30)
		assertFalse( range.includes(new TimeLapse(halfPastThree, halfPastSix)) )
	}

	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromBothSides() {
		val halfPastTwo = new LocalTime(14, 30)
		val halfPastSix = new LocalTime(18, 30)
		assertFalse( range.includes(new TimeLapse(halfPastTwo, halfPastSix)) )
	}

	@Test
	def void wantedIntervalIsCompletelyBeforeTheGivenRange() {
		val halfPastTenAM = new LocalTime(10, 30)
		val halfPastTwo = new LocalTime(14, 30)
		assertFalse( range.includes(new TimeLapse(halfPastTenAM, halfPastTwo)) )
	}
	
	@Test
	def void wantedIntervalIsCompletelyAfterTheGivenRange() {
		val halfPastSix = new LocalTime(18, 30)
		val halfPastEight = new LocalTime(20, 30)
		assertFalse( range.includes(new TimeLapse(halfPastSix, halfPastEight)) )
	}
	
}