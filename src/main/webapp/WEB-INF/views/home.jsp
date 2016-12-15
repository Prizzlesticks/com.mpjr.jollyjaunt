<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="resources/homelooks.css">
<meta name="google-signin-client_id"
	content="38140008096-c2ja3pde0uk539sv4j3j0cmuvfmsoamr.apps.googleusercontent.com">
</head>
<!-- View the home page, with google login/OAuth-->
<body>


	<h1 align="center">Welcome to Jolly Jaunt!</h1>

	<h2>Please Log In</h2>


	
<table align=center  >
 <tr><th colspan=2 align=center >
      <font size=5>Login</font>
</tr>
<tr>
    <td>Google Signin</td>
	<td> <div class="g-signin2" data-onsuccess="onSignIn"> </div> </td>
	</tr>
	<tr>
	<td> Google Signout</td>
	<td> <a href="#" onclick="signOut();">Sign out</a> </td>
	<!-- <a href="#" onclick="signOut();">Sign out</a> -->
	</table>
	<br><br><br>
	<p align="center">Log in and then click continue</p>
	<form name="variable" action="home">

		<input type="hidden" name="fullname" /> <input type="hidden"
			name="email" /> <br> 
			<div class="wrapper" align="center">
			<input class="button" type="submit" value="Continue" />
			</div>
			

		<input type="hidden" name="fullname" /> 
		<input type="hidden" name="email" /> 
		<br> <input type="submit" value="Continue" />

	</form>
	
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>

	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			//console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			document.forms["variable"]["fullname"].value = profile.getName();
			//console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail());
			document.forms["variable"]["email"].value = profile.getEmail();
			if (auth2.isSignedIn.get()) {
				var profile = auth2.currentUser.get().getBasicProfile();
				// console.log('ID: ' + profile.getId());
				console.log('Full Name: ' + profile.getName());
				document.forms["variable"]["fullname"].value = profile
						.getName();
				// document.forms["variable"]["fullname"] = profile.getName(); 
				//console.log('Given Name: ' + profile.getGivenName());
				//console.log('Family Name: ' + profile.getFamilyName());
				//console.log('Image URL: ' + profile.getImageUrl());
				console.log('Email: ' + profile.getEmail());
				document.forms["variable"]["fullname"].value = profile
						.getEmail();
			}
		}
	</script>

</body>
<style>
table{
    background-color:#E6E6FA;
  border:1px;
  width:100%
  cellpadding:4;
  cellspacing:2 ;

}
td{
  text-align:left;
  padding:10px
}


.button{
 background-color:#E6E6FA;
  border: none;
  color:black;
  cursor:pointer;
  margin: 4px 2px;
  font-size:15px;
  padding:10px 24px;
  border-radius:8px;
  
  
}
body{
  background-image: url("http://webneel.com/daily/sites/default/files/images/daily/03-2013/8-forest-road-landscape-photography.jpg");
   background-size:100%;
 }



</style>

</html>