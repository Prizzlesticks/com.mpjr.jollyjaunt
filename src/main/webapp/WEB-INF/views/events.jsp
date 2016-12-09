<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Events</title>
</head>
<body>
<h1>Events</h1>
<form name="eventform" action="routemapevents" onsubmit="return " method="get">
<%-- get local date works ${eventInfo.getEmb().getEvents().get(0).getDates().getStart().getLocalDate()} --%>
<c:forEach var="i" begin="0" end="${eventInfo.getEmb().getEvents().size()-1}">
<input type="checkbox" name="event" value="${eventInfo.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo.getEmb().getEvents().get(i).getUrl()}" target=blank>
${eventInfo.getEmb().getEvents().get(i).getName()}</a>

<br>
Date: ${eventInfo.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
<input type="hidden" name="origin">
<input type="hidden" name="destination">
<br>
</c:forEach>
<input type="submit" value="Add events to trip">
</form>
<script>
function getOriginDestination() {
	document.forms["eventform"]["origin"].value = ${origin};
	document.forms["eventform"]["destination"].value = ${destination};
}
</script>
</body>
</html>