package com.tenpines.xtend.model

import com.tenpines.xtend.model.exceptions.PartnerNotAvailableException
import org.joda.time.LocalDate
import org.joda.time.LocalTime
import java.util.List
import com.google.common.collect.Lists

class Assignment {
	@Property LocalDate date
	@Property LocalTime startTime
	@Property LocalTime endTime
	Partner partner
	
	def assign(Partner partner){
		if (! this.canBeCoveredBy(partner)){
			throw new PartnerNotAvailableException("Partner not available on: «date» («startTime» to: «endTime»)")
		}
		this.partner = partner
	}
	
	def getPartner(){
		partner
	}
	
	def canBeCoveredBy(Partner partner) {
		partner.isAvailable(date,startTime,endTime)
	}
	
	def List<Partner> whoCoversYou(List<Partner> partners) {
		Lists.newArrayList(partners.filter[partner | this.canBeCoveredBy(partner)])
	}
		
}