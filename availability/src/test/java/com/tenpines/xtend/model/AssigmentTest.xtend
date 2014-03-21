package com.tenpines.xtend.model

import com.tenpines.xtend.lapses.Availability
import com.tenpines.xtend.lapses.DayTime
import com.tenpines.xtend.model.exceptions.PartnerNotAvailableException
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*

class AssigmentTest {
	@Test
	def testAssignAvailablePartnerIsAssigned(){
		val partner = createAvailableParnerOnMonday()
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 17)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		assignment.assign(partner)
		
		assertEquals(partner, assignment.partner)
	}
	
	@Test
	def testCannotAssignUnavailablePartner(){
		val partner = createAvailableParnerOnMonday()
		
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
		val partner = createAvailableParnerOnMonday()
		
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
	
	@Test
	def	testAssignmentCanBeCoveredByAvailablePartners(){
		val availablePartner = this.createAvailableParnerOnMonday
		val unAvailablePartner = new Partner
		
		val assignment = new Assignment
		assignment.date = new LocalDate(2014, 3, 17)
		assignment.startTime = new LocalTime(10,00)
		assignment.endTime = new LocalTime(18,00)
		
		assertEquals(#[availablePartner] , assignment.whoCoverYou(#[availablePartner, unAvailablePartner]))
	}
	
	
	def createAvailableParnerOnMonday() {
		val from = new DayTime(DayOfWeek.MONDAY, new LocalTime(8, 00))
		val to = new DayTime(DayOfWeek.MONDAY, new LocalTime(22, 00))
		val availability = new Availability(from, to)
		
		new Partner(availability)
	}
	
}