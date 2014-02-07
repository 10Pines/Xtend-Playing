package com.tenpines.xtend

import static org.junit.Assert.*
import org.junit.Test
import org.joda.time.DateTime
import com.tenpines.xtend.model.Availability

class AvailabilityTest {
	
	Availability availability = new Availability
	
	@Test
	def void test1() {
		assertFalse(availability.isAvailable(new DateTime))
	}
}