<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- View the event detail of each trip from account page-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Event Details</title>
<link rel="stylesheet" href= "resources/eventdetails.css">
</head>
<body>
	<h1>Event Details</h1>
	<table border="1">
		<tr>
			<th>Event</th>
			<th>City</th>
			<th>Date</th>
		</tr>
		<c:forEach items="${eventlist}" var="event">
			<tr>
				<td>${event.event}</td>
				<td>${event.city}</td>
				<td>${event.date}</td>
			</tr>
		</c:forEach>
	</table>

	<form action="home" method="GET">
					<%-- <input type="hidden" name="tripid" value = "${tripid}"> --%>
					<input type="hidden" name="fullname" value = "${fullname}">
					<input type="hidden" name="email" value = "${email}">
						<input type="submit" value="Go Back" />
					</form>
	
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
</body>
</html>