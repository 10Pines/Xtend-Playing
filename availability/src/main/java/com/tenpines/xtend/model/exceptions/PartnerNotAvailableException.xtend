package com.tenpines.xtend.model.exceptions

import java.lang.RuntimeException

class PartnerNotAvailableException extends RuntimeException {
	
	new(String string) {
		super(string)
	}
	
}