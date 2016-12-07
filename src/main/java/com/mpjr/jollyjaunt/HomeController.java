package com.mpjr.jollyjaunt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String register(Model model) {
		return "home";
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model, HttpServletRequest request,HttpServletResponse response) {
		
		
		String username = request.getParameter("username");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String email = request.getParameter("email");
		
		 
		Cookie c =new Cookie("UserNameCookie",email);
		c.setMaxAge(60*60*24);
		response.addCookie(c);
		
		UserDetail ud = new UserDetail(0, firstname, lastname, city, state, email, username);
		
		ud.setUsername(username);
		ud.setFirstname(firstname);
		ud.setLastname(lastname);
		ud.setCity(city);
		ud.setState(state);
		ud.setEmail(email);
		
		DAO.addUserDetail(ud);
		
		model.addAttribute("username", username);
		model.addAttribute("firstname",firstname);
		model.addAttribute("lastname", lastname);
		model.addAttribute("city", city);
		model.addAttribute("state", state);
		model.addAttribute("email", email);
		
		return "tripInfo";
	
}
	@RequestMapping(value = "/tripInfo", method = RequestMethod.POST)
	public String addtripDetil(Model model, HttpServletRequest request) {
		
		//int userid =Integer.parseInt( request.getParameter("userid"));
		
		Cookie[] Email=request.getCookies();
		
		
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String sy=request.getParameter("year_start");
		String sm=request.getParameter("month_start");
		String sd=request.getParameter("day_start");
		
		String ey=request.getParameter("year_end");
		String em=request.getParameter("month_end");
		String ed=request.getParameter("day_end");
		
		String startdate=sy+"-"+sm+"-"+sd;
		String enddate=ey+"-"+em+"-"+ed;;
		
		TripDetail td = new TripDetail(0,0, origin, destination, startdate, enddate);
		
		
		UserDetail i	;
		 
		//td.setUserid(DAO.getUserId(i));
		td.setOrigin(origin);
		td.setDestination(destination);
		td.setStartdate(startdate);
		td.setEnddate(enddate);
		DAO. addTripDetail(td);		
		
		
		/*model.addAttribute("origin", origin);
		model.addAttribute("destination",destination);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate",enddate);*/
		
		
		return "home";
	
}
	
}