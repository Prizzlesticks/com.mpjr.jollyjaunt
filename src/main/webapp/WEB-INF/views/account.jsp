<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Account</title>
</head>
<body>
Welcome ${fullname}

Click a trip ID to open a saved trip or click new trip!

Your saved trips:

<table border="1">
	<tr>
		<th>Trip Name</th>
		<th>Origin</th>
		<th>Destination</th>
		<th>Start Date/EndDate</th>
		
	</tr>
<c:forEach items="${triplist}" var="trip">
	<tr>
		<td>${trip.title }</td>
		<td>${trip.origin }</td>
		<td>${trip.destination }</td>
		<td>${trip.startdate:  }/${trip.enddate }</td>
		
	</tr>
</c:forEach>
</table>

<form action="account" method = "GET">
    <input type="submit" value="Start a NEW Trip" />
</form>

</body>
</html>