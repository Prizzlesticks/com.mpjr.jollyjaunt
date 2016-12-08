package com.mpjr.jollyjaunt;

public class UserDetail {
	private int userid;
	private String username;
	private String firstname;
	private	String lastname;
	private String city;
	private String state;
	private	String email;
	
	public UserDetail() {
		;
	}
	
	public UserDetail( int userid, String username, String firstname, String lastname, String city, String state,
			String email) {
		super();
		this.userid = userid;
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.city = city;
		this.state = state;
		this.email = email;
		
	}
	
	public int getUserid() {
		return userid;
	}
	public String getUsername() {
		return username;
	}
	public String getFirstname() {
		return firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public String getCity() {
		return city;
	}
	public String getState() {
		return state;
	}
	public String getEmail() {
		return email;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setState(String state) {
		this.state = state;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
