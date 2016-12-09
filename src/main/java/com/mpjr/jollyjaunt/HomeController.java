package com.mpjr.jollyjaunt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

//import javax.servlet.http.Cookie;
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
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		
		
		if (!(DAO.getUserId(email) == 0) ) {
			//pull user information from db
			String userid = Integer.toString(DAO.getUserId(email));
			
			List<TripDetail> trips = DAO.getAllTrips(userid);
			model.addAttribute("triplist", trips);
			
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			model.addAttribute("userid", userid);
			model.addAttribute("email", email);	
			model.addAttribute("fullname", fullname);
			
			return "account";
			
		} else { 
		UserDetail user = new UserDetail();
		user.setFullname(fullname);
		//get the info from parameters & set user details
		//String email = user.getEmail();
		
		user.setEmail(email);
		int userid = DAO.addUserDetail(user);
		
		model.addAttribute("userid", userid);
		model.addAttribute("email", email);	
		model.addAttribute("fullname", fullname);
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		String useridstring = Integer.toString(userid);
		
		List<TripDetail> trips = DAO.getAllTrips(useridstring);
		model.addAttribute("triplist", trips);
		
		//going to return account first
		return "account";
		
		
		}
	}
	
	@RequestMapping(value = "/Google1", method = RequestMethod.GET)
	public String buildMap(Model model) {
		return "googleview";
}
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(Model model) {
		return "tripInfo";
}

	@RequestMapping(value = "/tripInfo", method = RequestMethod.GET)
	public String addtripDetail(Model model, HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String cityStart = request.getParameter("cityStart");
		String stateStart = request.getParameter("stateStart");
		String cityEnd = request.getParameter("cityEnd");
		String stateEnd = request.getParameter("stateEnd");
		String arrivaldate = request.getParameter("arrivaldate");
		String origin = cityStart+", "+stateStart;
		String destination = cityEnd + ", " + stateEnd;
		String sy=request.getParameter("year_start");
		String sm=request.getParameter("month_start");
		String sd=request.getParameter("day_start");
		
		String ey=request.getParameter("year_end");
		String em=request.getParameter("month_end");
		String ed=request.getParameter("day_end");
		
		String startdate=sy+"-"+sm+"-"+sd;
		String enddate=ey+"-"+em+"-"+ed;
		

		TripDetail td = new TripDetail();

		String userid = request.getSession().getAttribute("userid").toString();
		int id1 = Integer.parseInt(userid);
		td.setUserid(id1);
		td.setTitle(title);
		td.setOrigin(origin);
		td.setDestination(destination);
		td.setStartdate(startdate);
		td.setEnddate(enddate);
		td.setArrivaldate(arrivaldate);
		
		DAO.addTripDetail(td);		
		
		model.addAttribute("title", title);
		model.addAttribute("origin", origin);
		model.addAttribute("destination",destination);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate",enddate);
		
		if (request.getParameter("choice").equals("yes")) {

		
		//String url = "https://app.ticketmaster.com/discovery/v2/events.json?city=chicago&startDateTime=2016-12-20T15:00:00Z&endDateTime=2017-01-01T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
	
		

		String url = "https://app.ticketmaster.com/discovery/v2/events.json?city="+ cityEnd +"&startDateTime="+ arrivaldate +"T15:00:00Z&endDateTime="+ enddate +"T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";

		
		//city toLowerCase
		//String city = "detroit";
		//String dateStart = "2016-12-10";
		//String dateEnd = "2016-12-15";
		URL urlObj;
		EventInfo eventInfo = null;
			
		try {
			urlObj = new URL(url);
			
			HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
			con.setRequestMethod("GET");
			
			int code = con.getResponseCode();
			
			if (code == 200) {
				BufferedReader in = new BufferedReader(
						new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
					//System.out.println(inputLine);
				}
				in.close();
				
				//parse json
				
				Gson gson = new Gson();
				eventInfo = gson.fromJson(response.toString(), EventInfo.class);
//				for (int i=0; i<eventInfo.getEmb().getEvents().size(); i++) {
//				name = name + eventInfo.getEmb().getEvents().get(i).getName() + "<br>";
//				}
			} else {
				
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("eventInfo", eventInfo);
		//model.addAttribute("name", name);
		return "events";
		} else {
			return "routemap";
		}
}
	
	@RequestMapping(value = "/routemapevents", method = RequestMethod.GET)
	public String getDir(Model model, HttpServletRequest request) {
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String[] events = request.getParameterValues("event");
		
		model.addAttribute("events", events);
		model.addAttribute("destination", destination);
		model.addAttribute("origin", origin);
		
		return "routemapevents";
	}
	
}