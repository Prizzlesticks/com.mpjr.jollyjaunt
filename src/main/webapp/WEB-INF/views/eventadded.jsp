<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event Added!</title>
</head>
<body>
<h1>Your Event has been Added</h1>
<form action="addEvent" method="post" 
	target="mywindow" 
	onsubmit="window.close('','mywindow','width=600,height=300,menubar=no,resizable=no,scrollbars=no,location=no,toolbar=no,status=no')">
	${destination}
<br>${name}
<br>${date}
<br><a href="${url}">Tickets</a>
<input type="submit" value="Close Window">
</form>
</body>
</html>