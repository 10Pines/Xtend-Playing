package com.tenpines.xtend

import com.tenpines.xtend.model.Availability
import com.tenpines.xtend.model.User
import org.joda.time.LocalDate
import org.junit.Test

import static org.junit.Assert.*
import org.joda.time.LocalTime

class AddAvailabilityTest {

	val someone = new User
	val availability = new Availability( new LocalDate, new LocalTime )

	@Test
	def void test1() {
		someone.addAvailability(availability)
		assertTrue(someone.isAvailable(availability))
	}	

	@Test
	def void test2() {
		assertFalse(someone.isAvailable(availability))
	}	
	
	@Test
	def void test3() {
		val date = new LocalDate(2012, 12, 1)
		someone.addAvailability(availability)
		assertTrue(someone.isAvailable(date))
	}
	
}