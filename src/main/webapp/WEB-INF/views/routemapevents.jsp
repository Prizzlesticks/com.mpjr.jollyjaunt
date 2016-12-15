<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Directions service</title>
<style>

header,
section,
aside,
footer {
  margin: 0 1.5% 24px 1.5%;
}
header {
text-align:center;
}

section {
  float: left;
  width: 47%;
}
aside {
  float: right;
 
  height: 300px; width: 400px; align: right; border: 5px solid black
}
footer {
text-align: center;
  clear: both;
  margin-bottom: 0;
}
</style>
</head>
<!--View route on map based on origin and destinations selected  -->
<!--Link to google maps for full directions/mapping -->
<!--View events selected/submitted from the events view page -->
<body style="text-align: left;">
	<header>
	<h1>View Your Route</h1>
	Your Starting point is ${origin}
	<br> Your End point is ${destination}
	</header>

		
	<script>
		var link = "http://www.google.com/maps/dir/" + "${origin}" + "/";

				if ("${destination2}" !== ", "){
					link += "${destination2}" + "/";
				}
				if ("${destination3}" !== ", "){
					link += "${destination3}" + "/";
				}
				if ("${destination4}" !== ", "){
					link += "${destination4}" + "/";
				}
				if ("${destination5}" !== ", "){
					link += "${destination5}" + "/";
				}if ("${destination6}" !== ", "){
					link += "${destination6}" + "/";
				}
				if ("${destination}" !== ", "){
					link += "${destination}" + "/";
				}
				
	</script>

<section>
	<h2>For Full Directions and Voice Mapping</h2>
	<script>
		document.write('<a href="' + link + '" target = blank;>click here</a>');
	</script>
	</section>
	<aside>
	<script>
	
	//initial map
		function initMap() {
			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 7,
				
			});
			directionsDisplay.setMap(map);

			calculateAndDisplayRoute(directionsService, directionsDisplay);
		}
		</script>
		</aside><section>
		<script>
		//map of route based on input (using google maps)
		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			//waypts = [ "${destination2}" , "${destination3}", "${destination4}", "${destination5}", "${destination6}" ];
			var ways= [ ]; 

			if ("${destination2}" !== ", "){
				ways.push({
					location: "${destination2}",
					stopover: true
				});
			}
			if ("${destination3}" !== ", "){
				ways.push({
					location: "${destination3}",
					stopover: true
				});
			}
			if ("${destination4}" !== ", "){
				ways.push({
					location: "${destination4}",
					stopover: true
				});
			}
			if ("${destination5}" !== ", "){
				ways.push({
					location: "${destination5}",
					stopover: true
				});
			}
			if ("${destination6}" !== ", "){
				ways.push({
					location: "${destination6}",
					stopover: true
				});
			}
			directionsService.route({
				
				origin : "${origin}",
				destination : "${destination}",
				waypoints: ways,
				//optimizeWaypoints: false,
				travelMode : 'DRIVING',
				
			}, function(response, status) {
		          if (status === 'OK') {
		            directionsDisplay.setDirections(response);
		            var route = response.routes[0];
		            var summaryPanel = document.getElementById('directions-panel');
		            summaryPanel.innerHTML = '';
		            // For each route, display summary information.
		            for (var i = 0; i < route.legs.length; i++) {
		              var routeSegment = i + 1;
		              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
		                  '</b><br>';
		              summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
		              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
		              summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
		            }
		          } else {
		            window.alert('Directions request failed due to ' + status);
		          }
		        });
		      }
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzbMMCLqhLp1yFuvPmidlbGCMvIgCm4wg&callback=initMap">
		
	</script>
</section>
	<!-- listing events chosen by user from events view page-->
	<br>
<footer>
	<h3>Your Trip Events:</h3>
	<br>
	<table border="1" align="center">
		<tr>
			<th>Event</th>
			<th>City</th>
			<th>Date</th>
		</tr>
		<c:forEach items="${events}" var="event">
			<tr>
				<td>${event.event}</td>
				<td>${event.city}</td>
				<td>${event.date}</td>
			</tr>
		</c:forEach>
	</table>

		<form action="home" method="GET">
			<input type="hidden" name="fullname" value = "${fullname}">
			<input type="hidden" name="email" value = "${email}">
			<input type="submit" value="Return to Account" />
		</form>
			
</footer>
</body>
</html>