<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Event Details</title>
</head>
<body>
<!-- View the event detail of each trip from account page-->
<h1>Event Detail</h1>
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
<a href = "account">Go Back</a>

</body>
</html>