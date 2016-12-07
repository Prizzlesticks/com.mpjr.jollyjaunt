<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        width: 600;
        height: 450;
        border:0;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>
    Your Starting point is ${origin} <br>
    Your End point is ${destination}
    <div id="map" Style= "height:450px; width:600px; align:right; border:5px solid black;"></div>
     
    <script> 
        var link = "http://www.google.com/maps/dir/" + "${origin}" + "/" + "${destination}";
    </script>
    For Full Directions and Voice Mapping <script>document.write('<a href="' + link + '" target = blank;>click here</a>');</script>
    <script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);

 //       var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
 //       };
 //       document.getElementById('start').getParameter('form2', 'origin');
 //       document.getElementById('end').getParameter('form2', 'destination');
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        directionsService.route({
        	origin: "${origin}",
            destination: "${destination}",
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
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