package com.mpjr.jollyjaunt;

import java.util.List;

//class created to access venue objects from ticketmaster API
public class Embed {
	private List<Venue> venues;

	public List<Venue> getVenues() {
		return venues;
	}

	public void setVenues(List<Venue> venues) {
		this.venues = venues;
	}
}
