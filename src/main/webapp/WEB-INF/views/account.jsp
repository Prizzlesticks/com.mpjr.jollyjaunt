<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Account</title>
</head>
<body>
Welcome ${fullname}

Click a trip ID to open a saved trip or click new trip!

Your trips (variable coming)

<form action="account" method = "GET">
    <input type="submit" value="Start a NEW Trip" />
</form>

</body>
</html>