package com.mpjr.jollyjaunt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
	
	
	/*
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model) {
		
		return "newUser";
		
	}*/
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model, HttpServletRequest request) {
		
		
		String username = request.getParameter("username");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String email = request.getParameter("email");
		
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
}