package com.mpjr.jollyjaunt;

public class EventDetail {
	
	private int trip_id;
	private String events;
	private String city;
	private String date;
	private int eventid;
	
	
	public EventDetail() {
		super();
	
	}



	public EventDetail(int trip_id, String events, String city, String date, int eventid) {
		super();
		this.trip_id = trip_id;
		this.events = events;
		this.city = city;
		this.date = date;
		this.eventid = eventid;
	}
	
	
	
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int eventid) {
		this.eventid = eventid;
	}
	public int getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
	}
	public String getEvents() {
		return events;
	}
	public void setEvents(String events) {
		this.events = events;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	

}
