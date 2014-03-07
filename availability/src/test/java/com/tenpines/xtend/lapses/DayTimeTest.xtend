package com.tenpines.xtend.lapses

import com.tenpines.xtend.model.DayOfWeek
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*

class DayTimeTest {
	
	@Test
	def testDayIsBefore() {
		val today = new LocalDate(2014, 3, 7)
		assertTrue(DayOfWeek.FRIDAY.belongs(today));
		//Cant use the property sintax, xtend assumes it's an extension method and passes the enum class as first argument in the generated code
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertTrue(new DayTime(DayOfWeek.MONDAY, sixteenHours) <= new DayTime(DayOfWeek.TUESDAY, sixteenHours)) 
	}
	
	@Test
	def dayIsntBefore() {
		val today = new LocalDate(2014, 3, 7)
		assertTrue(DayOfWeek.FRIDAY.belongs(today));
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertFalse(new DayTime(DayOfWeek.TUESDAY, sixteenHours) <= new DayTime(DayOfWeek.MONDAY, sixteenHours)) 
	}
	
	@Test
	def sameDayAndBeforeTime() {
		val today = new LocalDate(2014, 3, 7)
		DayOfWeek.setToday(today) 
		assertTrue(DayOfWeek.FRIDAY.belongs(today));
		assertTrue(new DayTime(DayOfWeek.MONDAY, new LocalTime(16, 00)) <= new DayTime(DayOfWeek.MONDAY, new LocalTime(16, 30))) 
	}
	
	@Test
	def testTakingIntoAccountTodayDate() {
		val today = new LocalDate(2014, 3, 4)
		assertTrue(DayOfWeek.TUESDAY.belongs(today));
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertFalse(new DayTime(DayOfWeek.MONDAY, sixteenHours) <= new DayTime(DayOfWeek.WEDNESDAY, sixteenHours)) 
	}
	
	@Test
	def todayIsBefore() {
		val today = new LocalDate(2014, 3, 4)
		assertTrue(DayOfWeek.TUESDAY.belongs(today));
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertTrue(new DayTime(DayOfWeek.TUESDAY, sixteenHours) <= new DayTime(DayOfWeek.WEDNESDAY, sixteenHours)) 
	}
	
	@Test
	def aDayIsntBeforeToday() {
		val today = new LocalDate(2014, 3, 4)
		assertTrue(DayOfWeek.TUESDAY.belongs(today));
		DayOfWeek.setToday(today) 
		val sixteenHours = new LocalTime(16, 00)
		assertFalse(new DayTime(DayOfWeek.MONDAY, sixteenHours) <= new DayTime(DayOfWeek.TUESDAY, sixteenHours)) 
	}
	
}