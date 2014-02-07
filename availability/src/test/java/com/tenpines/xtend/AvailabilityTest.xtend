package com.tenpines.xtend

import com.tenpines.xtend.model.Availability
import org.joda.time.LocalDate
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class AvailabilityTest {

	Availability availability
	val availableDate = new LocalDate(2014, 1, 1)

	@Before
	def void init() {
		val januaryFst = new LocalDate(2014, 1, 1)
		availability = new Availability(januaryFst)
	}

	@Test
	def void test1() {
		assertFalse(availability.isAvailable(new LocalDate))
	}

	@Test
	def void test2() {
		assertTrue(availability.isAvailable(availableDate))
	}
}
