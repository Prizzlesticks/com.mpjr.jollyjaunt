package com.mpjr.jollyjaunt;

public class UserDetail {
	private int userid;
	private String fullname;
	private	String email;
	
	public UserDetail() {
		;
	}
	
	public UserDetail( int userid, String fullname, String email) {
		super();
		this.userid = userid;
		this.fullname = fullname;
		this.email = email;
		}

	public int getUserid() {
		return userid;
	}

	public  String getFullname() {
		return fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
	