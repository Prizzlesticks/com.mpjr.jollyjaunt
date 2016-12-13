<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Events</title>
</head>
<!--View the event information based on city/dates user selected -->
<!--The information displayed here is parsed from Ticketmaster API -->
<!--For each event displayed, ability to add event to events table in db -->
<!--The name of each event is a link to ticketmaster to purchase the tix  -->

<body>
	<h1>Events</h1>

	<form name="eventform" action="routemapevents" onsubmit="return "
		method="get">
		<%-- get local date works ${eventInfo.getEmb().getEvents().get(0).getDates().getStart().getLocalDate()} --%>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo.getEmb().getEvents().size()-1}">
${destination}: 
<br>
			<input type="checkbox" name="event"
				value="${eventInfo.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo2.getEmb().getEvents().size()-1}">
${destination2}: 
<br>
			<input type="checkbox" name="event"
				value="${eventInfo2.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo2.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo2.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo2.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo2.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo3.getEmb().getEvents().size()-1}">
${destination3}: 
<br>
			<input type="checkbox" name="event"
				value="${eventInfo3.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo3.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo3.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo3.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo3.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo4.getEmb().getEvents().size()-1}">
${destination4}:
<br>
			<input type="checkbox" name="event"
				value="${eventInfo4.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo4.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo4.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo4.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo4.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo5.getEmb().getEvents().size()-1}">
${destination5}:
<br>
			<input type="checkbox" name="event"
				value="${eventInfo5.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo5.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo5.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo5.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo5.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<c:forEach var="i" begin="0"
			end="${eventInfo6.getEmb().getEvents().size()-1}">
${destination6}:
<br>
			<input type="checkbox" name="event"
				value="${eventInfo6.getEmb().getEvents().get(i).getName()}">Event: 
<a href="${eventInfo6.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo6.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo6.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo6.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>
		</c:forEach>
		
		<input type="hidden" name="origin" value="${origin}"> 
		<input type="hidden" name="destination" value="${destination}">
		<input type="hidden" name="destination2" value="${destination2}">
		<input type="hidden" name="destination3" value="${destination3}">
		<input type="hidden" name="destination4" value="${destination4}">
		<input type="hidden" name="destination5" value="${destination5}">
		<input type="hidden" name="destination6" value="${destination6}"> 
		<input type="submit" value="Add events to trip">
	</form>
	
	<script>
		function getOriginDestination() {
			document.forms["eventform"]["origin"].value = $
			{
				origin
			}
			;
			document.forms["eventform"]["destination"].value = $
			{
				destination
			}
			;
		}
	</script>
</body>
</html>