<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
#directions-panel {
        margin-top: 10px;
        background-color: #FFEE77;
        padding: 10px;
      }
</style>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Directions service</title>
<style>
#map {
	height: 100%;
}
</style>
</head>
<!--View route on map based on origin and destinations selected  -->
<!-- Link to google maps for full directions/mapping -->
<body style="text-align: left;">
	<h1>View Your Route</h1>
	Your Starting point is ${origin}
	<br> Your First End point is ${destination}
	<div id="map"
		Style="height: 300px; width: 400px; align: right; border: 5px solid black;"></div>

	<script>
		var link = "http://www.google.com/maps/dir/" + "${origin}" + "/"
				+ "${destination}" + "/";

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
				
	</script>

	<h2>For Full Directions and Voice Mapping</h2>
	<script>
		document.write('<a href="' + link + '" target = blank;>click here</a>');
	</script>
	<div id="directions-panel"></div>
	<script>
	//initial map
		function initMap() {
			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 7,
				center : {
					lat : 41.85,
					lng : -87.65
				}
			});
			directionsDisplay.setMap(map);

			calculateAndDisplayRoute(directionsService, directionsDisplay);
		}
		//map of route based on input (using google maps)
		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			waypts = [ "${destination2}" , "${destination3}", "${destination4}", "${destination5}", "${destination6}" ];
			waypoints = [ ]; 
			for (var i = 0; i < wayptsArray.length; i++) {
		          if (waypts[i] != ","){
		            waypoints.push({
		              location: wayptsArray[i].value,
		              stopover: true
		            });
		          }
		        }
			directionsService.route({
				origin : "${origin}",
				destination : "${destination}",
				waypoints: waypoints,
				optimizeWaypoints: true,
				travelMode : 'DRIVING'
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

</body>
</html>