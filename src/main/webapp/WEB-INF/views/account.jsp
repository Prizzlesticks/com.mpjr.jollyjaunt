<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- View account information, saved trips and/or create a new trip-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Account</title>
</head>

<body>
	<h1 align="center">Account Information</h1>

	Welcome ${fullname}
	<br><br>
	 

	<table >
		<tr>
			<th>Trip Name</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Arrival Date</th>
			<th>Event Details</th>
		</tr>
		<c:forEach items="${triplist}" var="trip">
			<tr>
				<td>${trip.title}</td>
				<td>${trip.origin}</td>
				<td>${trip.destination}</td>
				<td>${trip.startdate}</td>
				<td>${trip.enddate}</td>
				<td>${trip.arrivaldate}</td>

				<td><form action="eventdetail" method="GET">
					<input type="hidden" name="tripid" value = "${trip.tripid}">
					<input type="hidden" name="fullname" value = "${fullname}">
					<input type="hidden" name="email" value = "${email}">
						<input class="button"  type="submit" value="View" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<form action="account" method="GET">
					<%-- <input type="hidden" name="tripid" value = "${trip.tripid}"> --%>
					<input type="hidden" name="fullname" value = "${fullname}">
					<input type="hidden" name="email" value = "${email}">
		<input class="button1"  type="submit" value="Start a NEW Trip" />
	</form>

	</body>
	
	<style>
body {
	color: white;
	background-image:
		url("https://storage.googleapis.com/wzukusers/user-25852961/images/5851ae2f4a2b7s6TWdhD/BG1_d1450.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid ;
    text-align: left;
    padding: 8px;
}

/* tr {
    background-color: #dddddd;
} */
.button,.button1{

  border: none;
  color:black;
  cursor:pointer;
  margin: 4px 2px;
  font-size:15px;
  padding:10px 24px;
  border-radius:8px;
  background-color:white;
  
  
}
.button1{
background-color:white;

}


	<form action="/" onsubmit="return signOut()" method="get">
		<input type="submit" value="Sign Out">
	</form>
	
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>


</style>
</html>
