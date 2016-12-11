package com.mpjr.jollyjaunt;

//creates user detail fields, instance variables, constructors and getters/setters 
public class UserDetail {
	private static int userid;
	private String fullname;
	private String email;

	public UserDetail() {
		;
	}

	public UserDetail(int userid, String fullname, String email) {
		super();
		UserDetail.userid = userid;
		this.fullname = fullname;
		this.email = email;
	}

	public static int getUserid() {
		return userid;
	}

	public String getFullname() {
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
