package com.mpjr.jollyjaunt;

public class TripDetail {
	private int tripid;
	private int userid;
	private String title;
    private String origin;
	private	String destination;
	private String startdate;
	private String enddate;
	//UserDetail UserDetail;
	
	public TripDetail() {
	;
	}
	
	
	public TripDetail(int tripid, int userid,String title,String origin, String destination, String startdate, String enddate ) {
		
		super();
		this.tripid = tripid;
		this.userid=userid;
		this.origin = origin;
		this.destination = destination;
		this.startdate = startdate;
		this.enddate = enddate;
			}

	public int getTripid() {
		return tripid;
	}

	public int getUserid() {
		return userid;
	}

	public String getTitle() {
		return title;
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

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setTitle(String title) {
		this.title = title;
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
	