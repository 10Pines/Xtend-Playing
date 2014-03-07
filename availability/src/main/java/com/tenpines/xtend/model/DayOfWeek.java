package com.tenpines.xtend.model;

import org.joda.time.LocalDate;

public enum DayOfWeek {
	MONDAY(1),
	TUESDAY(2),
	WEDNESDAY(3),
	THURSDAY(4),
	FRIDAY(5),
	SATURDAY(6),
	SUNDAY(7);

	private static LocalDate now = LocalDate.now();
	private int index;
	
	private DayOfWeek(int index){
		this.index=index;
	}
	

	public int getIndex() {
		return index;
	}

	public boolean operator_lessThan(DayOfWeek week) {
		int todaysIndex = dayFromJodaIndex(now.getDayOfWeek()).getIndex();
		if (todaysIndex > index && todaysIndex <= week.getIndex()) {
			return false;
		}
		return this.index < week.getIndex();
	}

	public static DayOfWeek dayFromJodaIndex(int jodaIndex) {
		for( DayOfWeek day : DayOfWeek.values()){
			if(day.getIndex()==jodaIndex){
				return day;
			}
		}
		return null;
	}
	
	public static void setToday(LocalDate aDate) {
		now = aDate;
	}


	public boolean belongs(LocalDate aDate) {
		DayOfWeek dayOfWeek = DayOfWeek.dayFromJodaIndex(aDate.getDayOfWeek());
		return this.equals(dayOfWeek);
	}

}




