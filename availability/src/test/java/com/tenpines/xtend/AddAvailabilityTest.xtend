package com.tenpines.xtend

import org.junit.Test
import static org.junit.Assert.*
import com.tenpines.xtend.model.User
import com.tenpines.xtend.model.Availability
import org.joda.time.DateTime

class AddAvailabilityTest {

	val someone = new User
	val availability = new Availability

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
		val date = new DateTime(2012, 12, 1, 0, 0)
		someone.addAvailability(availability)
		assertTrue(someone.isAvailable(date))
	}
	
}