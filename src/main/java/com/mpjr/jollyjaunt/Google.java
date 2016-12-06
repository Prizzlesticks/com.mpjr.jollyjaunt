package com.mpjr.jollyjaunt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import com.google.gson.Gson;
import com.mpjr.jollyjaunt.HomeController;


public class Google {
	
	
	public static String getDir() {
		String Origin = "Detroit";
		String Destination = "Chicago";
	String url = "https://maps.googleapis.com/maps/api/directions/json?origin=Detroit&destination=Chicago&key=AIzaSyCzbMMCLqhLp1yFuvPmidlbGCMvIgCm4wg";	
	List<String> direction;
	String duration = " ";
	
URL urlObj; 

	try {
		urlObj = new URL(url);
		System.out.println(url);
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
		con.setRequestMethod("GET");
		
		int code = con.getResponseCode();
		System.out.println(code);
		if(code == 200) {
			BufferedReader in = new BufferedReader(
					new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
				System.out.println("so far so good");
			}
			in.close();
			
			Gson gson = new Gson();
			GoogleTop gTop = gson.fromJson(response.toString(), GoogleTop.class);
			System.out.println(gTop);
			dur dur1 = gTop.getRoutes().getLegs().getTemp().get("text");
			duration = dur1.toString();
			
			System.out.println(duration);
			
		} else {
			
		}
	} catch (MalformedURLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	return duration;
	
}

}