package com.mpjr.jollyjaunt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String register(Model model) {
		return "home";
	}

//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String createUser(Model model, HttpServletRequest request) {
//		UserDetail user = new UserDetail(); 
//		model.addAttribute(user);
//		return "account";
//	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model, HttpServletRequest request,HttpServletResponse response) {

		UserDetail user = new UserDetail();
		//get the info from parameters & set user details
		String email = user.getEmail();
		String name = user.getFirstname();
		
		int userid = DAO.addUserDetail(user);
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");

		model.addAttribute("userid", userid);
		model.addAttribute("email", email);
		model.addAttribute("name", name);	
		
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);

		//going to return account first
		return "tripInfo";
	}
	
	@RequestMapping(value = "/Google1", method = RequestMethod.GET)
	public String buildMap(Model model) {
		return "googleview";
}

	@RequestMapping(value = "/tripInfo", method = RequestMethod.POST)
	public String addtripDetil(Model model, HttpServletRequest request) {
		
		//int userid =Integer.parseInt( request.getParameter("userid"));
		
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
		
		TripDetail td = new TripDetail(0,enddate, origin, destination, startdate, 0);
		
		
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
	



	@RequestMapping(value = "/tripInfo", method = RequestMethod.GET)
	public String getDir(Model model, HttpServletRequest request) {
		model.addAttribute("origin", request.getParameter("origin"));
		model.addAttribute("destination", request.getParameter("destination"));
		return "googlelimited";
	}

	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String getEvents(Model model/* , @RequestParam("city") String city */) {

		URL urlObj;
		// city = "detroit";
		String url = "https://app.ticketmaster.com/discovery/v2/events.json?city=detroit&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
		EventInfo eventInfo = null;
		//String name = "";

		try {
			urlObj = new URL(url);

			HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
			con.setRequestMethod("GET");

			int code = con.getResponseCode();

			if (code == 200) {
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
					// System.out.println(inputLine);
				}
				in.close();

				// parse json

				Gson gson = new Gson();
				eventInfo = gson.fromJson(response.toString(), EventInfo.class);
				// for (int i=0; i<eventInfo.getEmb().getEvents().size(); i++) {
				// name = name + eventInfo.getEmb().getEvents().get(i).getName()
				// + "<br>";
				// }
			} else {

			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("eventInfo", eventInfo);
		// model.addAttribute("name", name);
		return "events";
	}


}