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
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String register(Model model, HttpServletRequest request) {
	
	model.addAttribute("firstname",request.getParameter("firstname"));
	model.addAttribute("lastname", request.getParameter("lastname"));
	model.addAttribute("email", request.getParameter("email"));
	model.addAttribute("username", request.getParameter("username"));
	
		
		return "tripInfo";
	}
	
}
