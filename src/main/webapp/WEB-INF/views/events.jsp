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
<ul>
<%-- <c:forEach var="event" items="${eventInfo.getEmb().getEvents().get().getName()}" >
<li>${event}</li>
</c:forEach> --%>
<c:forEach var="i" begin="0" end="${eventInfo.getEmb().getEvents().size()-1}">
Event <c:out value="${eventInfo.getEmb().getEvents().get(i).getName()}"></c:out>
<br>
</c:forEach>
</ul>
</body>
</html>