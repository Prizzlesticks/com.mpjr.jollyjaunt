<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Trip Information</title>
<link rel="stylesheet" href= "resources/tripinfo.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(function() {
	    $("#datepicker1").datepicker();
	    $("#datepicker2").datepicker();
	    $("#datepicker3").datepicker();
	    $("#datepicker4").datepicker();
	    $("#datepicker5").datepicker();
	    $("#datepicker6").datepicker();
	    $("#datepicker7").datepicker();
	    $("#datepicker8").datepicker();
	});
</script>
<script>
var today = new Date();
// 	var dd = today.getDate();
// 	var mm = today.getMonth()+1; //January is 0!

// 	var yyyy = today.getFullYear();
// 	if(dd<10){
// 	    dd='0'+dd
// 	} 
// 	if(mm<10){
// 	    mm='0'+mm
// 	} 
// 	var today = dd+'/'+mm+'/'+yyyy;
// 	document.getElementById("DATE").value = today;
</script>
</head>
<!--View of form to input trip information, option to go to events page if selected  -->
<body>
	<h1>Let's plan your trip! </h1>
	 <b>Todays Date: ${date}</b>
<script>
 function validateform() {
	 var valid = true;
	 	var  letters = /^[A-Za-z]+$/;  
	 	var message="";
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
 	var startd;
 	var endd;
 	var arrivald1;
 	var arrivald2;
 	var arrivald3;
 	var arrivald4;
 	var arrivald5;
 	var arrivald6;
 	var startdayStr = document.forms["form2"]["startd"].value;
 	if ((startdayStr !== "") && (startdayStr !== null)) {
		startd = new Date(startdayStr);
 	} else {
 		message += "Please enter a Start Date. \n";
 		valid = false;
 	}
 	var enddayStr = document.forms["form2"]["endd"].value;
 	if ((enddayStr !== "") && (enddayStr !== null)) {
		endd = new Date(enddayStr);
 	} else {
 		message += "Please enter an End Date. \n";
 		valid = false;
 	}
 	var arrivaldayStr1 = document.forms["form2"]["arrivald1"].value;
 	if ((arrivaldayStr1 !== "") && (arrivaldayStr1 !== null)) {
		arrivald1 = new Date(arrivaldayStr1);
 	} else {
 		message += "Please enter an Arrival Date for your End City. \n";
 		valid = false;
 	}
 	var arrivaldayStr2 = document.forms["form2"]["arrivald2"].value;
 	if ((arrivaldayStr2 !== "") && (arrivaldayStr2 !== null)) {
		startd = new Date(arrivaldayStr2);
 	}
 	var arrivaldayStr3 = document.forms["form2"]["arrivald3"].value;
 	if ((arrivaldayStr3 !== "") && (arrivaldayStr3 !== null)) {
		startd = new Date(arrivaldayStr3);
 	}
 	var arrivaldayStr4 = document.forms["form2"]["arrivald4"].value;
 	if ((arrivaldayStr4 !== "") && (arrivaldayStr4 !== null)) {
		startd = new Date(arrivaldayStr4);
 	}
 	var arrivaldayStr5 = document.forms["form2"]["arrivald5"].value;
 	if ((arrivaldayStr5 !== "") && (arrivaldayStr5 !== null)) {
		startd = new Date(arrivaldayStr5);
 	}
 	var arrivaldayStr6 = document.forms["form2"]["arrivald6"].value;
 	if ((arrivaldayStr6 !== "") && (arrivaldayStr6 !== null)) {
		startd = new Date(arrivaldayStr6);
 	}
	today1 = new Date();
 		 
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
         message +="Enter trip location ending city. \n";
         valid = false;
        	 } else if (!(ec.value.match(letters))) {
         	message +="Enter trip location ending city. \n";
         	valid = false;
     } 
     if (es === "")   {
         message +="Enter trip location ending state. \n";
         valid = false;
         }  else if (!(es.value.match(letters))) {
             message +="Enter trip location ending state. \n";
             valid = false;
     }
     if (ec2 === "") {
         ;
         } else if (!(ec2.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 1 City) \n";
            valid = false;
     } 
     if (es2 === "")   {
             ;
         }  else if (!(es2.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 1 State) \n";
             valid = false;
     }
     if (ec3 === "") {
         ;
         } else if (!(ec3.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 2 City) \n";
           valid = false;
     } 
     if (es3 === "")   {
         ;
         }  else if (!(es3.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 2 State) \n";
            valid = false;
     }
     if (ec4 === "") {
         ;
         } else if (!(ec4.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 3 City) \n";
            valid = false;
     } 
     if (es4 === "")   {
         ;
         }  else if (!(es4.value.match(letters))) {
        	 message +="Enter trip a valid trip way point.(Stop 3 State) \n";
             valid = false;
     }
     if (ec5 === "") {
         ;
         } else if (!(ec5.value.match(letters))) {
            message +="Enter trip a valid trip way point.(Stop 4 City) \n";
            valid = false;
     } 
     if (es5 === "")   {
         ;
         }  else if (!(es5.value.match(letters))) {
             message +="Enter trip a valid trip way point.(Stop 4 State) \n";
             valid = false;
     }
     if (ec6 === "") {
         ;
     } else if (!(ec6.value.match(letters))) {
        message +="Enter trip a valid trip way point.(Stop 5 City) \n";
        valid = false;
     } 
     if (es6 === "")   {
         ;
         }  else if (!(es6.value.match(letters))) {
            message +="Enter trip a valid trip way point.(Stop 5 State) \n";
            valid = false;
     }
 			if (startd < today1) {
 				message += "Please choose a Start Date later than today. \n";
 				valid = false;
 			}
 			if (endd < startd) {
 				message += "Please choose an End Date later than the Start Date. \n";
 				valid = false;
 			}
 			if (arrivald1 > endd) {
 				message += "Please choose an Arrival Date for your End City before your End Date. \n";
 				valid = false;
 			} else if (arrivald1 < startd) {
 				message += "Please choose an Arrival Date for your End City later than the Start Date. \n";
 				valid = false;
 			} 
 			if ((arrivald6 == "") || (arrivald6 == null)) {
 				;
 			} else if ((arrivald5 !== "") || (arrivald5 !== null) && (arrivald6 < arrivald5)) {
 				
 				message += "Please choose an Arrival Date for Stop 5 later than the Stop 4. \n";
 				valid = false;
 			}
 			if ((arrivald5 == "") || (arrivald5 == null)) {
 				;
 			} else if ((arrivald4 !== "") || (arrivald4 !== null) && (arrivald5 < arrivald4)) {
 				
 				message += "Please choose an Arrival Date for Stop 4 later than the Stop 3. \n";
 				valid = false;
 			}
 			if ((arrivald4 == "") || (arrivald4 == null)) {
 				;
 			} else if ((arrivald3 !== "") || (arrivald3 !== null) && (arrivald4 < arrivald3)) {
 				
 				message += "Please choose an Arrival Date for Stop 3 later than the Stop 2. \n";
 				valid = false;
 			}
 			if ((arrivald3 == "") || (arrivald3 == null)) {
 				;
 			} else if ((arrivald2 !== "") || (arrivald2 !== null) && (arrivald3 < arrivald2)) {
 				
 				message += "Please choose an Arrival Date for Stop 2 later than the Stop 1. \n";
 				valid = false;
 			}
 			if ((arrivald2 == "") || (arrivald2 == null)) {
 				;
 			} else if ((arrivald1 !== "") || (arrivald1 !== null) && (arrivald2 < arrivald1)) {
 				
 				message += "Please choose an Arrival Date for Stop 1 later than the End City Arrival Date. \n";
 				valid = false;
 			}
 		    if (arrivald1 < startd) {
 				message += "Please choose an Arrival Date for your End City after yoru Start Date. \n";
 				valid = false;
 			} else if (arrivald1 > endd) {
 				message += "Please choose an Arrival Date for your End City before your End Date. \n";
 				valid = false;
 			}
        	if(!valid){
        		alert(message);
        	} 
        	return valid;
		}
		
	    </script>       
	
	<form name="form2" action="tripInfo" onsubmit="return validateform()" method="POST">

		<br>Trip Name: <input type="text" name="title"> <br>
		
		<h2>Starting and Ending Locations</h2>
		Start Date: <input type="text" id="datepicker1" name="startd" value="" /><br>
			<br>Starting City: 
			<br>City:  <input type="text" name="cityStart"> 
			<br>State: <input type="text" name="stateStart"> <br>
			
			<br>Ending City: 
			<br>City: <input type="text" name="cityEnd"> 
			<br>State: <input type="text" name="stateEnd"> <br>
			<br>Arrival Date: <input type="text" id="datepicker2" name="arrivald1" value="" /> <br>
			
			<br>End Date: <input type="text" id="datepicker3" name="endd" value="" /> 
			<br>
			<h2>Additional Stops You Would Like to Make</h2>
			<br>Stop 1: <br>City<input type="text" name="cityEnd2">
			<br>State:<input type="text" name="stateEnd2"> 
			<br>Arrival Date: <input type="text" id="datepicker2" name="arrivald2" value="" /> <br>
			
			<br>Stop 2: 
			<br>City: <input type="text" name="cityEnd3"> 
			<br>State:<input type="text" name="stateEnd3"> 
			<br>Arrival Date: <input type="text" id="datepicker4" name="arrivald3" value="" /> <br> 
			
			<br>Stop 3: 
			<br>City:<input type="text" name="cityEnd4"> 
			<br>State:<input type="text" name="stateEnd4"> 
			<br>Arrival Date: <input type="text" id="datepicker5" name="arrivald4" value="" /> <br> 
			
			<br>Stop 4: 
			<br>City:<input type="text" name="cityEnd5"> 
			<br>State:<input type="text" name="stateEnd5"> 
			<br>Arrival Date: <input type="text" id="datepicker6" name="arrivald5" value="" /> <br> 
			
			<br>Stop 5: 
			<br>City:<input type="text" name="cityEnd6"> 
			<br>State:<input type="text" name="stateEnd6"> 
			<br>Arrival Date: <input type="text" id="datepicker7" name="arrivald6" value="" /><br> 

		<br> 
		<!-- If yes is selected and submit pressed, goes to events view by pressing continue-->
		<br>Look up events at your destination(s) during your trip? <br>
			<input type="radio" name="choice" value="choose" checked> Choose Yes or No <br>
			<input type="radio" name="choice" value="yes">Yes <br>
			<input type="radio" name="choice" value="no">No 
		<br>
		<br>
		<br>Genre<select id="genre" name="genre">
		
			<option value= "nada"> Please Select a Type of Event
			<option value="none"> No events Please
			<option value="arts & theatre">Arts and Theater  
			<option value="music">Music
			<option value="sports">Sports
			<option value="family">Family
			<option value="none">Doesn't Matter
			
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