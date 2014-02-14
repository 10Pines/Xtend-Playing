package com.tenpines.xtend

import org.joda.time.DateTime
import org.joda.time.DateTimeConstants
import org.junit.Test
import static org.junit.Assert.*

class CalculateDayOfWeekTest {
	@Test
	def void testObtainDayOfWeekFromFridayItIsCorrect(){
		val friday =  new DateTime(2014,02,14,1,0,0)
		val int day = friday.getDayOfWeek
		assertEquals(DateTimeConstants.FRIDAY, day)
	}
	
	@Test
	def void testObtainDayOfWeekFromSundayItIsCorrect(){
		val sunday =  new DateTime(2014,02,16,1,0,0)
		val int day = sunday.getDayOfWeek
		assertEquals(DateTimeConstants.SUNDAY, day)
	}
}