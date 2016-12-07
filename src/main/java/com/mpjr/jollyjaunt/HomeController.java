package com.mpjr.jollyjaunt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("firstname", firstname);
		model.addAttribute("lastname", lastname);
		model.addAttribute("city", city);
		model.addAttribute("state", state);
		model.addAttribute("email", email);

		return "tripInfo";
	}
	
	@RequestMapping(value = "/Google1", method = RequestMethod.GET)
	public String buildMap(Model model) {
		return "googleview";
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