package com.mpjr.jollyjaunt;

//class created to access name of event, information from ticketmaster API
public class Name {
	private String name;
	private String url;
	private Dates dates;
	private Embed _embedded;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Dates getDates() {
		return dates;
	}

	public void setDates(Dates dates) {
		this.dates = dates;
	}

	public Embed get_embedded() {
		return _embedded;
	}

	public void set_embedded(Embed _embedded) {
		this._embedded = _embedded;
	}

}