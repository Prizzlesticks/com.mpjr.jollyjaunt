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
	<h1>Account Information</h1>

	Welcome ${fullname} Click a trip ID to open a saved trip or click new
	trip to create a trip! Your saved trips:

	<table border="1">
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
						<input type="submit" value="View" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<form action="account" method="GET">
		<input type="submit" value="Start a NEW Trip" />
	</form>
	
	

</body>
</html>