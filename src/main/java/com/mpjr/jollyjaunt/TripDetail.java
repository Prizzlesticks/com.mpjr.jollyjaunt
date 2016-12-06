package com.mpjr.jollyjaunt;

public class TripDetail {
	private int tripid;
	private String origin;
	private	String destination;
	private String startdate;
	private String enddate;
	public int getTripid() {
		return tripid;
	}
	public String getOrigin() {
		return origin;
	}
	public String getDestination() {
		return destination;
	}
	public String getStartdate() {
		return startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setTripid(int tripid) {
		this.tripid = tripid;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	} 
	
}
