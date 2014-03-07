package com.tenpines.xtend.lapses

import com.tenpines.xtend.model.DayOfWeek
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*

class DayTimeTest {
	
	@Test
	def test1() {
		val sixteenHours = new LocalTime(16, 00)
		assertTrue(new DayTime(DayOfWeek.MONDAY, sixteenHours) <= new DayTime(DayOfWeek.TUESDAY, sixteenHours)) 
	}
	
	@Test
	def test2() {
		val sixteenHours = new LocalTime(16, 00)
		assertFalse(new DayTime(DayOfWeek.TUESDAY, sixteenHours) <= new DayTime(DayOfWeek.MONDAY, sixteenHours)) 
	}
	
	@Test
	def test3() {
		assertTrue(new DayTime(DayOfWeek.MONDAY, new LocalTime(16, 00)) <= new DayTime(DayOfWeek.MONDAY, new LocalTime(16, 30))) 
	}
	
	
}