package com.mpjr.jollyjaunt;

public class TripDetail {
	private int tripid;
	private int userid;
	private String title;
    private static String origin;
	private static	String destination;
	private String startdate;
	private String enddate;
	private String arrivaldate;
	//UserDetail UserDetail;


	public TripDetail() {
	;
	}
	
	
	public TripDetail(int tripid, int userid,String title,String origin, String destination, String startdate, String enddate, String arrivaldate ) {
		
		super();
		this.tripid = tripid;
		this.userid=userid;
		this.title=title;
		TripDetail.origin = origin;
		TripDetail.destination = destination;
		this.startdate = startdate;
		this.enddate = enddate;
		this.arrivaldate = arrivaldate;
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

	public static String getOrigin() {
		return origin;
	}

	public static String getDestination() {
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
		TripDetail.origin = origin;
	}

	public void setDestination(String destination) {
		TripDetail.destination = destination;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getArrivaldate() {
		return arrivaldate;
	}


	public void setArrivaldate(String arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	
}
	