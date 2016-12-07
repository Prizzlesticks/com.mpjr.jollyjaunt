<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Trip Information</title>
</head>
<body>
<h1>Let's plan your trip!</h1>

<form name="form2" action="events" onsubmit="return validate()" method="get">
<br>Starting Point: <input type="text" name="origin">
<br>Destination:<input type="text" name="destination">
<br>Start Date:<input type="text" name="startdate">
<br>End Date:<input type="text" name="enddate">

<br><input type="submit" value="Submit Registration">

</form>
<script>
function validate() {
	var sp = document.forms["form2"]["origin"].value;
    var d = document.forms["form2"]["destination"].value;
    var sd = document.forms["form2"]["startdate"].value;
    var ed = document.forms["form2"]["enddate"].value;
    
    if (sp == "") {
        alert("Enter trip location starting point");
        return false;
        } else if (d == "") {
    	alert("Enter a destination");
    	return false;
    	} else if (sd == "") {
    	alert("Enter trip start date");
    	return false;
    	} else if (ed == "") {
    	alert("Enter trip end date");
    	return false;
    	}
   }
</script>

</body>
</html>