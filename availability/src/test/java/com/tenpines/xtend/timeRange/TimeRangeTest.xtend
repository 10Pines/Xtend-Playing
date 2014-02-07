package com.tenpines.xtend.timeRange

import com.tenpines.xtend.model.timeRange.TimeRange
import org.joda.time.LocalTime
import org.junit.Test
import static org.junit.Assert.*

class TimeRangeTest {
	
	TimeRange range = new TimeRange(new LocalTime(15, 0), new LocalTime(18, 0))
	
	@Test
	def void wantedIntervalIsWithinTheGivenRange() {
		val halfPastThree = new LocalTime(15, 30)
		val fiveOClock = new LocalTime(17, 0)
		assertTrue( range.includes(new TimeRange(halfPastThree, fiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheLeft() {
		val halfPastTwo = new LocalTime(14, 30)
		val fiveOClock = new LocalTime(17, 0)
		assertFalse( range.includes(new TimeRange(halfPastTwo, fiveOClock)) )
	}
	
	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromTheRight() {
		val halfPastThree = new LocalTime(15, 30)
		val halfPastSix = new LocalTime(18, 30)
		assertFalse( range.includes(new TimeRange(halfPastThree, halfPastSix)) )
	}

	@Test
	def void wantedIntervalIsOutsideTheGivenRangeFromBothSides() {
		val halfPastTwo = new LocalTime(14, 30)
		val halfPastSix = new LocalTime(18, 30)
		assertFalse( range.includes(new TimeRange(halfPastTwo, halfPastSix)) )
	}

	@Test
	def void wantedIntervalIsCompletelyBeforeTheGivenRange() {
		val halfPastTenAM = new LocalTime(10, 30)
		val halfPastTwo = new LocalTime(14, 30)
		assertFalse( range.includes(new TimeRange(halfPastTenAM, halfPastTwo)) )
	}
	
	@Test
	def void wantedIntervalIsCompletelyAfterTheGivenRange() {
		val halfPastSix = new LocalTime(18, 30)
		val halfPastEight = new LocalTime(20, 30)
		assertFalse( range.includes(new TimeRange(halfPastSix, halfPastEight)) )
	}
}