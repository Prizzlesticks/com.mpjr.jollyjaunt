<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Trip Information</title>
<link rel="stylesheet" href= "resources/tripinfo.css">
</head>
<!--View of form to input trip information, option to go to events page if selected  -->
<body>
	<h1>Let's plan your trip! </h1>
	 <b>Todays Date: ${date}</b>
<script>
 function validateform() {
 	var ttl = document.forms["form2"]["title"].value;
 	var sc = document.forms["form2"]["cityStart"].value;
 	var ss = document.forms["form2"]["stateStart"].value;
 	var ec = document.forms["form2"]["cityEnd"].value;
 	var es = document.forms["form2"]["stateEnd"].value;
 	var ec2 = document.forms["form2"]["cityEnd2"].value;
	var es2 = document.forms["form2"]["stateEnd2"].value;
 	var ec3 = document.forms["form2"]["cityEnd3"].value;
 	var es3 = document.forms["form2"]["stateEnd3"].value;
	var ec4 = document.forms["form2"]["cityEnd4"].value;
	var es4 = document.forms["form2"]["stateEnd4"].value;
 	var ec5 = document.forms["form2"]["cityEnd5"].value;
 	var es5 = document.forms["form2"]["stateEnd5"].value;
 	var ec6 = document.forms["form2"]["cityEnd6"].value;
 	var es6 = document.forms["form2"]["stateEnd6"].value;
 	var choice = document.forms["form2"]["choice"].value;
 	var genre = document.forms["form2"]["genre"].value;
	
	
 	var ys = document.forms["form2"]["year_start"];
 	var ms = document.forms["form2"]["month_start"];
 	var ds = document.forms["form2"]["day_start"];

 	var ye = document.forms["form2"]["year_end"];
 	var me = document.forms["form2"]["month_end"];
	var de = document.forms["form2"]["day_end"];

 	var ya = document.forms["form2"]["year_arrive"];
 	var ma = document.forms["form2"]["month_arrive"];
	var da = document.forms["form2"]["day_arrive"];
	
// 	Date startdate = new Date;
// 	Date arrivaldate = new Date;
// 	Date enddate = new Date;
	
//  	Date startdate = date.UTC(ms + "-" + ds + "-" + ys);
//  	Date arrivaldate = date.UTC(ma + "-" + da + "-" + ya);
//  	Date enddate = date.UTC(me + "-" + de + "-" + ye);
 	
 	var valid = true;
 	var  letters = /^[A-Za-z]+$/;  
 	var message="";
 	 
 	if (ttl === "") {
 		message +="Enter a Trip Title. \n";
 		valid = false;
 	}
     if (document.forms["form2"]["cityStart"].value === "") {
     	message +="Enter trip location starting city. \n";
     	valid = false;
   		 } else if (!(document.forms["form2"]["cityStart"].value.match(letters))) {
    		message +="Enter trip location starting city. \n";
    		valid = false;
     } 
     if (ss === "")   {
     	message +="Enter trip location starting state. \n";
     	valid = false;
        	 }  else if (!(ss.value.match(letters))) {
        	message +="Enter trip location starting state. \n";
        	valid = false;
     }
     if (ec === "") {
         message +="Enter trip location starting city. \n";
         valid = false;
        	 } else if (!(ec.value.match(letters))) {
         	message +="Enter trip location starting city. \n";
         	valid = false;
     } 
     if (es === "")   {
         message +="Enter trip location starting state. \n";
         valid = false;
         }  else if (!(es.value.match(letters))) {
             message +="Enter trip location starting state. \n";
             valid = false;
     }
     if (ec2 === "") {
         ;
         } else if (!(ec2.value.match(letters))) {
            message +="Enter trip location starting city. \n";
            valid = false;
     } 
     if (es2 === "")   {
             ;
         }  else if (!(es2.value.match(letters))) {
             message +="Enter trip location starting state. \n";
             valid = false;
     }
     if (ec3 === "") {
         ;
         } else if (!(ec3.value.match(letters))) {
           message +="Enter trip location starting city. \n";
           valid = false;
     } 
     if (es3 === "")   {
         ;
         }  else if (!(es3.value.match(letters))) {
            message +="Enter trip location starting state. \n";
            valid = false;
     }
     if (ec4 === "") {
         ;
         } else if (!(ec4.value.match(letters))) {
            message +="Enter trip location starting city. \n";
            valid = false;
     } 
     if (es4 === "")   {
         ;
         }  else if (!(es4.value.match(letters))) {
             message +="Enter trip location starting state. \n";
             valid = false;
     }
     if (ec5 === "") {
         ;
         } else if (!(ec5.value.match(letters))) {
            message +="Enter trip location starting city. \n";
            valid = false;
     } 
     if (es5 === "")   {
         ;
         }  else if (!(es5.value.match(letters))) {
             message +="Enter trip location starting state. \n";
             valid = false;
     }
     if (ec6 === "") {
         ;
     } else if (!(ec6.value.match(letters))) {
        message +="Enter trip location starting city. \n";
        valid = false;
     } 
     if (es6 === "")   {
         ;
         }  else if (!(es6.value.match(letters))) {
            message +="Enter trip location starting state. \n";
            valid = false;
     }
//  			if (startdate < "${date}") {
//  				message += "Please choose a date later than today. \n";
//  				valid = false;
//  			}
//  			if (enddate < startdate) {
//  				message += "Please choose a date later than today. \n";
//  				valid = false;
//  			}
//  			if (arrivaldate > enddate) {
//  				message += "Please choose a date later than today. \n";
//  				valid = false;
//  			}
			if (choice === "choose") {
 				message += "Please choose an option for Event Search. \n";
 				valid = false;
 			}
 			if (genre === "nada") {
 				message += "Please choose an event type or No event. \n";
 				valid = false;
 			} else if (genre === "none") {
				message += "Please choose an event type or No event. \n";
 				valid = false;
 			}
 			
        	if(!valid){
        		//document.getElementById("errorlog").innerHTML = "" + message + "";
        		alert(message);
        	} 
        	return valid;
		}
		
 </script> 
	<div id="errorlog" class="errorlog"></div>       
<script>
		
		document.write(startdate);
		</script>
	<form name="form2" action="tripInfo" onsubmit="return validateform()" method="POST">

		<br>Trip Name: <input type="text" name="title"> <br>
		
		<h2>Starting and Ending Locations</h2>
			<br>Starting City: 
			<br>City  <input type="text" name="cityStart"> 
			<br>State <input type="text" name="stateStart"> <br> 
			
			<br>Ending City: 
			<br>City <input type="text" name="cityEnd"> 
			<br>State <input type="text" name="stateEnd"> <br>
			
			<h2>Additional Stops You Would Like to Make</h2>
			<br>Stop 1: <br>City<input type="text" name="cityEnd2">
			<br>State<input type="text" name="stateEnd2"> <br> 
			
			<br>Stop 2: 
			<br>City <input type="text" name="cityEnd3"> 
			<br>State<input type="text" name="stateEnd3"> <br> 
			
			<br>Stop 3: 
			<br>City<input type="text" name="cityEnd4"> 
			<br>State<input type="text" name="stateEnd4"> <br> 
			
			<br>Stop 4: 
			<br>City<input type="text" name="cityEnd5"> 
			<br>State<input type="text" name="stateEnd5"> <br> 
			
			<br>Stop 5: 
			<br>City<input type="text" name="cityEnd6"> 
			<br>State<input type="text" name="stateEnd6"> <br> 
			
	<br>Start Date : Year 
		<select id="year_start" name="year_start">
			<option value=2016>2016</option>
			<option value=2017>2017</option>
			<option value=2018>2018</option>
		</select> 
	 Month 
	 	<select id="month_start" name="month_start">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
		</select> 
	Day 
		<select id="day_start" name="day_start">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
			<option value=13>13</option>
			<option value=14>14</option>
			<option value=15>15</option>
			<option value=16>16</option>
			<option value=17>17</option>
			<option value=18>18</option>
			<option value=19>19</option>
			<option value=20>20</option>
			<option value=21>21</option>
			<option value=22>22</option>
			<option value=23>23</option>
			<option value=24>24</option>
			<option value=25>25</option>
			<option value=26>26</option>
			<option value=27>27</option>
			<option value=28>28</option>
			<option value=29>29</option>
			<option value=30>30</option>
			<option value=31>31</option>
		</select> <br> <br> 
	End Date: Year 
		<select id="year_end" name="year_end">
			<option value=2016>2016</option>
			<option value=2017>2017</option>
			<option value=2018>2018</option>
		</select> 
	Month 
		<select id="month_end" name="month_end">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
		</select> 
	Day 
		<select id="day_end" name="day_end">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
			<option value=13>13</option>
			<option value=14>14</option>
			<option value=15>15</option>
			<option value=16>16</option>
			<option value=17>17</option>
			<option value=18>18</option>
			<option value=19>19</option>
			<option value=20>20</option>
			<option value=21>21</option>
			<option value=22>22</option>
			<option value=23>23</option>
			<option value=24>24</option>
			<option value=25>25</option>
			<option value=26>26</option>
			<option value=27>27</option>
			<option value=28>28</option>
			<option value=29>29</option>
			<option value=30>30</option>
			<option value=31>31</option>
		</select> 
		<br> 
		<!-- If yes is selected and submit pressed, goes to events view by pressing continue-->
		<br>
		<br>Look up events at your destination(s) during your trip? <br>
			<input type="radio" name="choice" value="choose" checked> Choose Yes or No <br>
			<input type="radio" name="choice" value="yes">Yes <br>
			<input type="radio" name="choice" value="no">No 
		<br> 
		<br>
	What date do you want to begin searching for events? 
	<br> Year
		<select id="year_arrive" name="year_arrive">
			<option value=2016>2016</option>
			<option value=2017>2017</option>
			<option value=2018>2018</option>
		</select> 
	Month 
		<select id="month_arrive" name="month_arrive">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
		</select>
	Day 
		<select id="day_arrive" name="day_arrive">
			<option value=01>1</option>
			<option value=02>2</option>
			<option value=03>3</option>
			<option value=04>4</option>
			<option value=05>5</option>
			<option value=06>6</option>
			<option value=07>7</option>
			<option value=08>8</option>
			<option value=09>9</option>
			<option value=10>10</option>
			<option value=11>11</option>
			<option value=12>12</option>
			<option value=13>13</option>
			<option value=14>14</option>
			<option value=15>15</option>
			<option value=16>16</option>
			<option value=17>17</option>
			<option value=18>18</option>
			<option value=19>19</option>
			<option value=20>20</option>
			<option value=21>21</option>
			<option value=22>22</option>
			<option value=23>23</option>
			<option value=24>24</option>
			<option value=25>25</option>
			<option value=26>26</option>
			<option value=27>27</option>
			<option value=28>28</option>
			<option value=29>29</option>
			<option value=30>30</option>
			<option value=31>31</option>
		</select>
		<br>
		<br>Genre<select id="genre" name="genre">
		
			<option value= "nada"> Please Select a Type of Event
			<option value="none"> No events Please
			<option value="arts & theatre">Arts and Theater
			<option value="music">Music
			<option value="sports">Sports
			<option value="family">Family
			<option value="all">Doesn't Matter
			
		</select> 
		<br> <br> 
			<input type="submit" value="Continue"> 

</form>

	<form action="home" method="GET">
		<input type="hidden" name="fullname" value = "${fullname}">
		<input type="hidden" name="email" value = "${email}">
		<input type="submit" value="Return to Account" />
	</form>
			

    	
</body>
</html>