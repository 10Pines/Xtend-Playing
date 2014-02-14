package com.tenpines.xtend.model

import com.tenpines.xtend.model.timeLapse.TimeLapse
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import org.junit.Test

import static org.junit.Assert.*

class PartnerTest {
	
	
	@Test
	def testPartenerWithAvailabilityForOneDayIsAvailable(){
		val partner = new Partner
		val lapse= new TimeLapse(new LocalTime(8,00), new LocalTime(19, 30))
		val availabilityOnMonday = new Availability(DayOfWeek.MONDAY, lapse)
		
		partner.addAvailability(availabilityOnMonday)
		val aMonday = new LocalDate(2014,02,10)
		val lapseOnMonday = new TimeLapse(new LocalTime(10,00),new LocalTime(12,00))
		assertTrue(partner.isAvailableOn(aMonday, lapseOnMonday))
	}
	
	@Test
	def testPartenerWithoutAvailabilityForOneDayIsNotAvailable(){
		val partner = new Partner
		val aMonday = new LocalDate(2014,02,10)
		val lapseOnMonday = new TimeLapse(new LocalTime(10,00),new LocalTime(12,00))
		assertFalse(partner.isAvailableOn(aMonday,lapseOnMonday))
	}
	
	@Test
	def testAddingASecondAvailabilityToAPartnerReultsInOnlyOneAvailabilityWithAllTheLapses(){
		val partner = new Partner
		val aFriday = new LocalDate(2014,02,14)
		val firstTimeLapse = new TimeLapse(new LocalTime(10,00),new LocalTime(12,00))
		val secondTimeLapse = new TimeLapse(new LocalTime(15,00),new LocalTime(20,00))
		val firstAvailability = new Availability(DayOfWeek.FRIDAY, firstTimeLapse)
		val secondAvailability = new Availability(DayOfWeek.FRIDAY, secondTimeLapse)
		
		partner.addAvailability(firstAvailability);
		partner.addAvailability(secondAvailability);
		
		val fridayAvailability = partner.availabilitiesFor(aFriday)
		assertEquals(2, fridayAvailability.timeLapses.size)
		assertEquals(#[firstTimeLapse, secondTimeLapse], fridayAvailability.timeLapses)
	}
}