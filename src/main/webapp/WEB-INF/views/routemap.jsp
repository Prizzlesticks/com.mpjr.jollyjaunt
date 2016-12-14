<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
        float: left;
        width: 70%;
        height: 100%;
      }
      #right-panel {
        margin: 20px;
        border-width: 2px;
        width: 20%;
        height: 400px;
        float: left;
        text-align: left;
        padding-top: 0;
      }
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
	<div id= Right-Panel;>Your Starting point is ${origin}
	<br> Your End point is ${destination}</div>
	<div id="map"
		Style="height: 300px; width: 400px; align: right; border: 5px solid black;"></div>

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
				center: {
					lat: 41.85, 
					lng: -87.65
				}
				
			});
			directionsDisplay.setMap(map);

			calculateAndDisplayRoute(directionsService, directionsDisplay);
		}
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
	
			<form action="home" method="GET">
					<input type="hidden" name="fullname" value = "${fullname}">
					<input type="hidden" name="email" value = "${email}">
					<input type="submit" value="Return to Account" />
			</form>
</body>
</html>