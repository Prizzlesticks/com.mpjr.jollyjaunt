package com.mpjr.jollyjaunt;

//class created to access duration information from Google API
public class Directions {

	static String duration = "";

	public static String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		Directions.duration = duration;
	}

}
