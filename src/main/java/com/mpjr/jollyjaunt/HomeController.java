package com.mpjr.jollyjaunt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
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

//handles requests for the application home page. 
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String register(Model model) {

		return "home";

	}

	// handles requests for the application account page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String addNewUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession();
		session.setAttribute("fullname", fullname);
		session.setAttribute("email", email);
		// pull user information from db, retrieve userid if email on file
		if ((DAO.getUserId(email) != 0)) {

			int userid = (DAO.getUserId(email));
			
			session.setAttribute("userid", userid);

			model.addAttribute("userid", userid);
			model.addAttribute("email", email);
			model.addAttribute("fullname", fullname);

			// if userid/email in db, show all trips assoc. with user in account
			// view

			List<TripDetail> trips = DAO.getAllTrips(userid);
			model.addAttribute("triplist", trips);

			return "account";

		} else {
			UserDetail user = new UserDetail();
			user.setFullname(fullname);
			// if no user/email in db, get the info from parameters & set user
			// details
			// add user info (full name, email) to database and generate user id

			user.setEmail(email);
			int userid = DAO.addUserDetail(user);

			model.addAttribute("userid", userid);
			model.addAttribute("email", email);
			model.addAttribute("fullname", fullname);
			
			session.setAttribute("userid", userid);
			String useridstring = Integer.toString(userid);
			// this will show no saved trips, just trip table

			return "account";

		}
	}

	// handles requests for the trip info page (where user inputs trip info)
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(Model model, HttpServletRequest request) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute(formattedDate);
		
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		
		model.addAttribute("fullname", fullname);
		model.addAttribute("email", email);
		
		return "tripInfo";
	}

	// handles requests for the application routemap page which shows
	// route based on destinations selected (can be multiple destinations)
	@RequestMapping(value = "/tripInfo", method = RequestMethod.POST)
	public String addtripDetail(Model model, HttpServletRequest request) {
		// takes in user input of trip info (title, origin, dest,dates,etc)
		HttpSession session = request.getSession();
		String userid = session.getAttribute("userid").toString();
		String fullname = session.getAttribute("fullname").toString();
		String email = session.getAttribute("email").toString();
		
		model.addAttribute("fullname",fullname);
		model.addAttribute("email",email);
		
		String title = request.getParameter("title");
		String cityStart = request.getParameter("cityStart");
		String stateStart = request.getParameter("stateStart");
		String cityEnd = request.getParameter("cityEnd");
		String cityEnd2 = request.getParameter("cityEnd2");
		String cityEnd3 = request.getParameter("cityEnd3");
		String cityEnd4 = request.getParameter("cityEnd4");
		String cityEnd5 = request.getParameter("cityEnd5");
		String cityEnd6 = request.getParameter("cityEnd6");
		String stateEnd = request.getParameter("stateEnd");
		String stateEnd2 = request.getParameter("stateEnd2");
		String stateEnd3 = request.getParameter("stateEnd3");
		String stateEnd4 = request.getParameter("stateEnd4");
		String stateEnd5 = request.getParameter("stateEnd5");
		String stateEnd6 = request.getParameter("stateEnd6");
		String origin = cityStart + ", " + stateStart;
		String destination = cityEnd + ", " + stateEnd;
		String destination2 = cityEnd2 + ", " + stateEnd2;
		String destination3 = cityEnd3 + ", " + stateEnd3;
		String destination4 = cityEnd4 + ", " + stateEnd4;
		String destination5 = cityEnd5 + ", " + stateEnd5;
		String destination6 = cityEnd6 + ", " + stateEnd6;

		cityEnd = cityEnd.toLowerCase();
		cityEnd2 = cityEnd2.toLowerCase();
		cityEnd3 = cityEnd3.toLowerCase();
		cityEnd4 = cityEnd4.toLowerCase();
		cityEnd5 = cityEnd5.toLowerCase();
		cityEnd6 = cityEnd6.toLowerCase();

		// checks for multiple name cities
		if (cityEnd.contains(" ")) {
			String[] parts = cityEnd.split(" ");
			String part2 = parts[1].trim();
			cityEnd = parts[0] + "%20" + part2;
		}
		if (cityEnd2.contains(" ")) {
			String[] parts = cityEnd2.split(" ");
			String part2 = parts[1].trim();
			cityEnd2 = parts[0] + "%20" + part2;
		}
		if (cityEnd3.contains(" ")) {
			String[] parts = cityEnd3.split(" ");
			String part2 = parts[1].trim();
			cityEnd3 = parts[0] + "%20" + part2;
		}
		if (cityEnd4.contains(" ")) {
			String[] parts = cityEnd4.split(" ");
			String part2 = parts[1].trim();
			cityEnd4 = parts[0] + "%20" + part2;
		}
		if (cityEnd5.contains(" ")) {
			String[] parts = cityEnd5.split(" ");
			String part2 = parts[1].trim();
			cityEnd5 = parts[0] + "%20" + part2;
		}
		if (cityEnd6.contains(" ")) {
			String[] parts = cityEnd6.split(" ");
			String part2 = parts[1].trim();
			cityEnd6 = parts[0] + "%20" + part2;
		}

		String sy = request.getParameter("year_start");
		String sm = request.getParameter("month_start");
		String sd = request.getParameter("day_start");

		String ey = request.getParameter("year_end");
		String em = request.getParameter("month_end");
		String ed = request.getParameter("day_end");

		String ya = request.getParameter("year_arrive");
		String ma = request.getParameter("month_arrive");
		String da = request.getParameter("day_arrive");

		String startdate = sy + "-" + sm + "-" + sd;
		String arrivaldate = ya + "-" + ma + "-" + da;
		String enddate = ey + "-" + em + "-" + ed;

		// creates new trip detail specific to this trip's user input & sets it
		TripDetail td = new TripDetail();

		int id1 = Integer.parseInt(userid);
		td.setUserid(id1);
		td.setTitle(title);
		td.setOrigin(origin);
		td.setDestination(destination);
		td.setStartdate(startdate);
		td.setEnddate(enddate);
		td.setArrivaldate(arrivaldate);

		// adds trip detail info to database table trip_detail
		int tripid = DAO.addTripDetail(td);
		session.setAttribute("tripid", tripid);

		model.addAttribute("title", title);
		model.addAttribute("origin", origin);
		model.addAttribute("destination", destination);
		model.addAttribute("destination2", destination2);
		model.addAttribute("destination3", destination3);
		model.addAttribute("destination4", destination4);
		model.addAttribute("destination5", destination5);
		model.addAttribute("destination6", destination6);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("arrivaldate", arrivaldate);
		

		// option to choose events, if yes, goes to events page which shows
		// events listed in destination choices (through ticketmaster API)
		if (request.getParameter("choice").equals("yes")) {

			String genre = request.getParameter("genre");
			if (genre.equals(" ")){
				;
			} else if (genre.equals("none")) {
				;
			}		
			else {
				model.addAttribute("genre");
			}

			// provide events based on city selected, show events from arrival
			// date through end date
			String url = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
			String url2 = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd2 + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
			String url3 = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd3 + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
			String url4 = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd4 + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
			String url5 = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd5 + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";
			String url6 = "https://app.ticketmaster.com/discovery/v2/events.json?city=" + cityEnd6 + "&classificationName="+genre+"&startDateTime="
					+ arrivaldate + "T15:00:00Z&endDateTime=" + enddate
					+ "T15:00:00Z&apikey=UA08AxXZd7TGbabcIQ4jEMVFE6BiLQ1d";

			URL urlObj;
			EventInfo eventInfo = null;
			EventInfo eventInfo2 = null;
			EventInfo eventInfo3 = null;
			EventInfo eventInfo4 = null;
			EventInfo eventInfo5 = null;
			EventInfo eventInfo6 = null;
			if (cityEnd != null) {
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

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo = gson.fromJson(response.toString(), EventInfo.class);
						
					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}

			if (cityEnd2 != null) {
				try {
					urlObj = new URL(url2);

					HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
					con.setRequestMethod("GET");

					int code = con.getResponseCode();

					if (code == 200) {
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						in.close();

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo2 = gson.fromJson(response.toString(), EventInfo.class);

					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}

			if (cityEnd3 != null) {

				try {
					urlObj = new URL(url3);

					HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
					con.setRequestMethod("GET");

					int code = con.getResponseCode();

					if (code == 200) {
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						in.close();

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo3 = gson.fromJson(response.toString(), EventInfo.class);

					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}
			if (cityEnd4 != null) {

				try {
					urlObj = new URL(url4);

					HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
					con.setRequestMethod("GET");

					int code = con.getResponseCode();

					if (code == 200) {
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						in.close();

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo4 = gson.fromJson(response.toString(), EventInfo.class);

					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}
			
			if (cityEnd5 != null) {

				try {
					urlObj = new URL(url5);

					HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
					con.setRequestMethod("GET");

					int code = con.getResponseCode();

					if (code == 200) {
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						in.close();

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo5 = gson.fromJson(response.toString(), EventInfo.class);

					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}
			
			if (cityEnd6 != null) {

				try {
					urlObj = new URL(url6);

					HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
					con.setRequestMethod("GET");

					int code = con.getResponseCode();

					if (code == 200) {
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						in.close();

						// parse json data from ticketmaster API
						Gson gson = new Gson();
						eventInfo6 = gson.fromJson(response.toString(), EventInfo.class);

					} else {

					}

				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					System.out.println("Enter the valid city");
				}
			}

			model.addAttribute("eventInfo", eventInfo);
			model.addAttribute("eventInfo2", eventInfo2);
			model.addAttribute("eventInfo3", eventInfo3);
			model.addAttribute("eventInfo4", eventInfo4);
			model.addAttribute("eventInfo5", eventInfo5);
			model.addAttribute("eventInfo6", eventInfo6);
			
			return "events";
		} else {
			
			return "routemap";
			// if user does not want to select events, go to routemap view
			// and display map of route based on destinations selected
		}
	}

	
	// handles requests for eventadded application page
	@RequestMapping(value = "/eventadded", method = RequestMethod.POST)
	public String addEvent(Model model, HttpServletRequest request) {
		
		String tripid = request.getSession().getAttribute("tripid").toString();
		int id = Integer.parseInt(tripid);
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		String url = request.getParameter("url");
		String city = request.getParameter("city");
		
		EventDetail event = new EventDetail();
//		event.setCity(request.getParameter("destination"));
		event.setTripid(id);
		event.setCity(city);
		event.setDate(date);
		event.setEvent(name);
		
		DAO.addEventDetail(event);

		model.addAttribute("city", city);
		model.addAttribute("name", name);
		model.addAttribute("date", date);
		model.addAttribute("url", url);
		return "eventadded";
	}
	
	
	// handles requests for routemapevents application page
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String getMapSummary(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int tripid = Integer.parseInt(session.getAttribute("tripid").toString());
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		
		String fullname = session.getAttribute("fullname").toString();
		String email = session.getAttribute("email").toString();
	
		model.addAttribute("fullname", fullname);
		model.addAttribute("email", email);

		List<EventDetail> events = DAO.getTripEvents(tripid);
		
		String destination2 = request.getParameter("destination2");
		String destination3 = request.getParameter("destination3");
		String destination4 = request.getParameter("destination4");
		String destination5 = request.getParameter("destination5");
		String destination6 = request.getParameter("destination6");

		model.addAttribute("events", events);
		model.addAttribute("destination", destination);
		model.addAttribute("origin", origin);
		model.addAttribute("destination2", destination2);
		model.addAttribute("destination3", destination3);
		model.addAttribute("destination4", destination4);
		model.addAttribute("destination5", destination5);
		model.addAttribute("destination6", destination6);

		return "routemapevents";
		// shows the route map as well as any events chosen by user
	}

	// handles requests for eventdetail page
	@RequestMapping(value = "/eventdetail", method = RequestMethod.GET)
	public String getEventDetails(Model model, HttpServletRequest request) {
		// displays name, city, date for each event of trip
		
		int id2 = Integer.parseInt(request.getParameter("tripid"));
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
	
		model.addAttribute("fullname", fullname);
		model.addAttribute("email", email);
		
		List<EventDetail> events = DAO.getTripEvents(id2);
		model.addAttribute("eventlist", events);
		

		return "eventdetail";

	}

}