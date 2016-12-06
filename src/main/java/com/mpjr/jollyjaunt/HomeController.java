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
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model) {
		

// HEAD 
		//model.addAttribute("serverTime", formattedDate );
		//model.addAttribute("dirCheck", Google.getDir());
//=======
		return "newUser";
//>>>>>>> bcc0ff39c738d7193adba112ff9f149dd9255c3b

		
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String addNewUser(Model model, HttpServletRequest request) {
		UserDetail ud = new UserDetail();
		
		String username = request.getParameter("username");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String email = request.getParameter("email");
		
		ud.setUsername(username);
		ud.setFirstname(firstname);
		ud.setLastname(lastname);
		ud.setCity(city);
		ud.setState(state);
		ud.setEmail(email);
		
		DAO.addUserDetail(ud);
		
		return "";
	//this is not mapped yet to anything and therefore not testable yet
}
}