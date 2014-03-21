package com.tenpines.xtend.lapses

import com.tenpines.xtend.model.DayOfWeek
import org.joda.time.LocalTime
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class LapseTest {
	
	Availability availableMonday15to18 
	
	@Before
	def void init() {
		val firstLimit = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 0))
		val lastLimit = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 0))
		availableMonday15to18 = new Availability(firstLimit, lastLimit)
	}
	
	@Test
	def void testAnAvailabilityIncludedInOtherIsIncluded() {
		val mondayHalfPastThree = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 30))
		val mondayFiveOClock = new DayTime(DayOfWeek.MONDAY, new LocalTime(17, 0))
		val availableMonday1530to17 = new Availability(mondayHalfPastThree, mondayFiveOClock)
		
		assertTrue(availableMonday15to18.includes(availableMonday1530to17) )
	}
	
	@Test
	def void testAnAvailabilityThatStartsBeforeIsNotIncluded() {
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		val mondayFiveOClock = new DayTime(DayOfWeek.MONDAY, new LocalTime(17, 0))
		val availability1430to17 = new Availability(mondayHalfPastTwo, mondayFiveOClock)
		
		assertFalse( availableMonday15to18.includes(availability1430to17) )
	}
	
	@Test
	def void testAnAvailabilityThatFinishesAfterIsNotIncluded() {
		val mondayHalfPastThree = new DayTime(DayOfWeek.MONDAY, new LocalTime(15, 30))
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		val availabilityMondat15301830 = new Availability(mondayHalfPastThree, mondayHalfPastSix)
		
		assertFalse( availableMonday15to18.includes(availabilityMondat15301830) )
	}

	@Test
	def void testAnAvailabilityThatStartsBeforeAndFinishesLaterIsNotIncluded() {
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		val availability1430to1830 = new Availability(mondayHalfPastTwo, mondayHalfPastSix)
		
		assertFalse( availableMonday15to18.includes(availability1430to1830) )
	}

	@Test
	def void testAnAvailabilityThatFinishesBeforeTheOtherStartsIsNotIncluded() {
		val mondayHalfPastTen = new DayTime(DayOfWeek.MONDAY, new LocalTime(10, 30))
		val mondayHalfPastTwo = new DayTime(DayOfWeek.MONDAY, new LocalTime(14, 30))
		val availabilityMonday1030to1430 = new Availability(mondayHalfPastTen, mondayHalfPastTwo)
		assertFalse( availableMonday15to18.includes(availabilityMonday1030to1430))
	}
	
	@Test
	def void testAnAvailabilityThatStartAndFinishesAfterTheOtherIsNotIncluded() {
		val mondayHalfPastSix = new DayTime(DayOfWeek.MONDAY, new LocalTime(18, 30))
		val mondayHalfPastEight = new DayTime(DayOfWeek.MONDAY, new LocalTime(20, 30))
		val availabilityMontay1830to2030 = new Availability(mondayHalfPastSix, mondayHalfPastEight)
		assertFalse( availableMonday15to18.includes(availabilityMontay1830to2030) )
	}
}