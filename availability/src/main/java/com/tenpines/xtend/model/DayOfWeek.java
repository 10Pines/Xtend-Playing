package com.tenpines.xtend.model;

import com.tenpines.xtend.model.DayOfWeek;

public enum DayOfWeek {
	MONDAY(1),
	TUESDAY(2),
	WEDNESDAY(3),
	THURSDAY(4),
	FRIDAY(5),
	SATURDAY(6),
	SUNDAY(7);

	private int index;
	
	private DayOfWeek(int index){
		this.index=index;
	}
	
	public static DayOfWeek dayFromJodaIndex(int jodaIndex) {
		for( DayOfWeek day : DayOfWeek.values()){
			if(day.getIndex()==jodaIndex){
				return day;
			}
		}
		return null;
	}

	public int getIndex() {
		return index;
	}

	public boolean operator_lessThan(DayOfWeek week) {
		return this.index < week.getIndex();
	}
	
}




