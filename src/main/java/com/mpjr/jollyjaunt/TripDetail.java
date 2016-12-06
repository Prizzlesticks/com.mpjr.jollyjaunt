package com.mpjr.jollyjaunt;

public class TripDetail {
	private int tripid;
	private String origin;
	private	String destination;
	private String startdate;
	private String enddate;
	private int userid;
	
	public TripDetail(int tripid, String origin, String destination, String startdate, String enddate, int userid) {
		super();
		this.tripid = tripid;
		this.origin = origin;
		this.destination = destination;
		this.startdate = startdate;
		this.enddate = enddate;
		this.userid = userid;
	}
	
	
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
	
	public int getUserid() {
		return userid;
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
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
}
