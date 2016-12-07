<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Welcome to Jolly Jaunt!   
</h1>

<h2>
	Registration
</h2>
<form name="form1" action="home" onsubmit="return validateAll()" method="get">
<br>First Name: <input type="text" name="firstname">
<br>Last Name:<input type="text" name="lastname">
<br>City:<input type="text" name="city">
<br>State:<input type="text" name="state">
<br>Email:<input type="email" name="email">
<br>UserName:<input type="text" name="username">
<br>Password:<input type="password" name="password">
<br>Re-enter Password:<input type="password" name="passwordVal">
<br><input type="submit" value="Submit Registration">

</form>
<script>
function validateAll(){
	return validate() && validatePassword();
}

function validate() {
    var fn = document.forms["form1"]["firstname"].value;
    var ln = document.forms["form1"]["lastname"].value;
    var em = document.forms["form1"]["email"].value;
    var un = document.forms["form1"]["username"].value;
    var psw = document.forms["form1"]["password"].value;
	var pswVal = document.forms["form1"]["passwordVal"].value;
	var cy = document.forms["form1"]["city"].value;
	var st = document.forms["form1"]["state"].value;
    if (fn == "") {
        alert("First Name must be filled out");
        return false;
    } else if (ln == "") {
    	alert("Last Name must be filled out");
    	return false;
   	} else if (em == "") {
    	alert("Email must be filled out");
    	return false;
    } else if (un == "") {
    	alert("Username must be filled out");
    	return false;
    } else if (cy == "") {
    	alert("City must be filled out");
    	return false;
    } else if (st == "") {
    	alert("State must be filled out");
    	return false;
    	}else if (psw == "" || pswVal == "") {
    alert("Please enter password");
      	return false;
    }else if (psw != pswVal) {
    	alert("Please re-enter password");
	return false;
	} else if (validateName(fn) == false || validateName(ln)==false)
		alert("Please enter valid name");
    return false;
}

function validateName(name) {
	var re = [a-zA-Z];
	return re.test(name);
}
 
function validatePassword()
{
  var password1 = document.form1.password.value;
    //has at least 8 char
  if (password1 === null || password1.length < 8) {
    alert("Password must be at least 8 characters");
    return false;
  }
  
  //has at least 1 uppercase
  if (password1.toLowerCase() === password1) {
    alert("Password must contain at least one uppercase letter");
    return false;
  }
}

 

</script>
  



</body>
</html>
