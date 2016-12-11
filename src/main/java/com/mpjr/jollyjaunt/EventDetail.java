package com.mpjr.jollyjaunt;

//creates event detail fields, instance variables, constructors and getters/setters 
public class EventDetail {

	private int tripid;
	private String events;
	private String city;
	private String date;
	private int eventid;

	public EventDetail() {
		super();
	}

	public EventDetail(int tripid, String events, String city, String date, int eventid) {
		super();
		this.tripid = tripid;
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

	public int getTripid() {
		return tripid;
	}

	public void setTripid(int tripid) {
		this.tripid = tripid;
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
