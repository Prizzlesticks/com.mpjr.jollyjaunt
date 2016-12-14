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
	
<c:if test="${eventInfo2.getEmb().getEvents().size() > 0}">	
<c:if test="${destination2 != ', '}">
<h2>${destination2}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo2.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo2.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo2.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo2.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo2.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination2}">
<input type=hidden name="name" value="${eventInfo2.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo2.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo2.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
		</c:if>
</c:if>

<c:if test="${eventInfo3.getEmb().getEvents().size() > 0}">
<c:if test="${destination3 != ', '}">
<h2>${destination3}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo3.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo3.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo3.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo3.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination3}">
<input type=hidden name="name" value="${eventInfo3.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo3.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo3.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
		</c:if>
</c:if>

<c:if test="${eventInfo4.getEmb().getEvents().size() > 0}">
<c:if test="${destination4 != ', '}">
<h2>${destination4}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo4.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo4.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo4.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo4.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo4.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination4}">
<input type=hidden name="name" value="${eventInfo4.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo4.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo4.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
		</c:if>
</c:if>

<c:if test="${eventInfo5.getEmb().getEvents().size() > 0}">
<c:if test="${destination5 != ', '}">
<h2>${destination5}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo5.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo5.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo5.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo5.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo5.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination5}">
<input type=hidden name="name" value="${eventInfo5.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo5.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo5.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
		</c:if>
</c:if>

<c:if test="${eventInfo6.getEmb().getEvents().size() > 0}">
<c:if test="${destination6 != ', '}">
<h2>${destination6}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo6.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo6.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo6.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo6.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo6.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination6}">
<input type=hidden name="name" value="${eventInfo6.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo6.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo6.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
		</c:if>
</c:if>

<c:if test="${destination != ', '}">
<h2>${destination}:</h2>
		<c:forEach var="i" begin="0" end="${eventInfo.getEmb().getEvents().size()-1}">
<form action="eventadded" method="post" 
	target="mywindow" 
	onsubmit="window.open('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
<br>
Event: 
<a href="${eventInfo.getEmb().getEvents().get(i).getUrl()}" target=blank>
				${eventInfo.getEmb().getEvents().get(i).getName()}</a>

			<br>
Date: ${eventInfo.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}
<br>
Venue: ${eventInfo.getEmb().getEvents().get(i).get_embedded().getVenues().get(0).getName()}
<br>

<input type=hidden name="city" value="${destination}">
<input type=hidden name="name" value="${eventInfo.getEmb().getEvents().get(i).getName()}">
<input type=hidden name="date" value="${eventInfo.getEmb().getEvents().get(i).getDates().getStart().getLocalDate()}">
<input type=hidden name="url" value="${eventInfo.getEmb().getEvents().get(i).getUrl()}">
<input type="submit" value="Add Event">
<br><br>
</form>
		</c:forEach>
	</c:if>

		
	<form action="events" method="get">
		<input type="hidden" name="origin" value="${origin}"> 
		<input type="hidden" name="destination" value="${destination}">
		<input type="hidden" name="destination2" value="${destination2}">
		<input type="hidden" name="destination3" value="${destination3}">
		<input type="hidden" name="destination4" value="${destination4}">
		<input type="hidden" name="destination5" value="${destination5}">
		<input type="hidden" name="destination6" value="${destination6}"> 
		<input type="submit" value="Continue">
	</form>
	
	<form action="home" method="GET">
		<input type="hidden" name="fullname" value = "${fullname}">
		<input type="hidden" name="email" value = "${email}">
		<input type="submit" value="Return to Account" />
	</form>
	
</body>
</html>