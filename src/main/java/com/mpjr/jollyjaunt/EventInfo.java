package com.mpjr.jollyjaunt;

//class created to drill down/access information from ticketmaster API
public class EventInfo {
	private Embedded _embedded;

	public Embedded getEmb() {
		return _embedded;
	}

	public void setEmb(Embedded emb) {
		this._embedded = emb;
	}
}
