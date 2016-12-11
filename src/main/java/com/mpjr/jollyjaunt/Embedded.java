package com.mpjr.jollyjaunt;

import java.util.List;

//class created to access name of events from ticketmaster API
public class Embedded {
	private List<Name> events;

	public List<Name> getEvents() {
		return events;
	}

	public void setEvents(List<Name> events) {
		this.events = events;
	}

}
