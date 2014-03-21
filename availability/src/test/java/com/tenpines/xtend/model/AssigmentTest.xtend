package com.tenpines.xtend.model

import org.junit.Test
import static org.junit.Assert.*
import com.tenpines.xtend.lapses.Availability
import com.tenpines.xtend.lapses.DayTime
import org.joda.time.LocalTime
import org.joda.time.LocalDate
import com.tenpines.xtend.model.exceptions.PartnerNotAvailableException

class AssigmentTest {
	@Test
	def testAssignAvailablePartnerIsAssigned(){
		val from = new DayTime(DayOfWeek.MONDAY, new LocalTime(8, 00))
		val to = new DayTime(DayOfWeek.MONDAY, new LocalTime(22, 00))
		val availability = new Availability(from, to)

		val partner = new Partner(availability)
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 17)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		assignment.assign(partner)
		
		assertEquals(partner, assignment.partner)
	}
	
	@Test
	def testCannotAssignUnavailablePartner(){
		val from = new DayTime(DayOfWeek.MONDAY, new LocalTime(8, 00))
		val to = new DayTime(DayOfWeek.MONDAY, new LocalTime(22, 00))
		val availability = new Availability(from, to)

		val partner = new Partner(availability)
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 18)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		try{
			assignment.assign(partner)
			fail("the partner must not be available!")
		}catch (PartnerNotAvailableException e){
			assertNull(assignment.partner)
		}
	}
	
	@Test
	def testAssignmentCanBeCoveredByAnAvailablePartner(){
		val from = new DayTime(DayOfWeek.MONDAY, new LocalTime(8, 00))
		val to = new DayTime(DayOfWeek.MONDAY, new LocalTime(22, 00))
		val availability = new Availability(from, to)

		val partner = new Partner(availability)
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 17)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		assertTrue(assignment.canBeCoveredBy(partner))
	}
	
	@Test
	def testAssignmentCanNotBeCoveredByAnUnavailablePartner(){
		
		val partner = new Partner()
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 18)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		assertFalse(assignment.canBeCoveredBy(partner))
	}
	
}