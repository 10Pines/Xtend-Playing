package com.tenpines.xtend.lapses

import com.tenpines.xtend.model.DayOfWeek
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*
import org.joda.time.DateTime

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
	
	@Test
	def test4() {
		val today = new DateTime(2014, 3, 4, 15, 0)
		assertEquals(DayOfWeek.TUESDAY, DayOfWeek.dayFromJodaIndex(today.getDayOfWeek));
		//Cant use the property sintax, xtend assumes it's an extension method and passes the enum class as first argument in the generated code
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertFalse(new DayTime(DayOfWeek.MONDAY, sixteenHours) <= new DayTime(DayOfWeek.WEDNESDAY, sixteenHours)) 
	}
	
}