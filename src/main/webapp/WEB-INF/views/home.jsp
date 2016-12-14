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
	<h1>Welcome to Jolly Jaunt!</h1>

	<h2>Please Log In</h2>

	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<a href="#" onclick="signOut();">Sign out</a> Please log in and then
	click below to access your account:
	<form name="variable" action="home">
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
</html>