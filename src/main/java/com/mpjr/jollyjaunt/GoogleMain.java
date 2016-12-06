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


public class GoogleMain {

	public static String GetDirections() {
		String Origin = "";
		String Destination = "";
		String url = "https://maps.googleapis.com/maps/api/directions/json?origin=" + Origin + "&destination=" + Destination + "&key=AIzaSyCzbMMCLqhLp1yFuvPmidlbGCMvIgCm4wg";
		String printMe = " ";
		System.out.println(url);
	 
	URL urlObj;
	
		try {
			urlObj = new URL(url);
			
			HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
			con.setRequestMethod("GET");
			
			int code = con.getResponseCode();
			
			if(code == 200) {
				BufferedReader in = new BufferedReader(
						new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
					
				}
				in.close();
				
				Gson gson = new Gson();
				Directions direction = gson.fromJson(response.toString(), Directions.class);
				
				String route = Directions.getDuration();
				//List<String> duration = route();
				printMe = route;
				
				
			} else {
				
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return printMe;
		
	}
}
