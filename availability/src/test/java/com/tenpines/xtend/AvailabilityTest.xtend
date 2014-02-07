package com.tenpines.xtend

import com.tenpines.xtend.model.Availability
import org.joda.time.LocalDate
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.joda.time.LocalTime

class AvailabilityTest {

	Availability availability
	val availableDate = new LocalDate(2014, 1, 1)
	val availableTime = new LocalTime (15, 30)

	@Before
	def void init() {
		availability = new Availability(availableDate, availableTime)
	}

	@Test
	def void test1() {
		assertFalse(availability.isAvailable(new LocalDate, new LocalTime))
	}

	@Test
	def void test2() {
		assertTrue(availability.isAvailable(availableDate, availableTime))
	}
}
