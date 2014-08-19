function getUserLocation() {
  if (window.navigator.geolocation) {
    window.navigator.geolocation.getCurrentPosition(sendCoordinates);
  } // else creates form
}

function sendCoordinates(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  $.ajax({
    url: '/',
    method: 'post',
    data: {latitude: latitude, longitude: longitude},
    dataType: 'json',
    success: function(data) {
      buildMap(data);
    }
  })
}

function buildMap(data) {
  var handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(
      createMarkersForMap(data)
      );
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}

function createMarkersForMap(data) {
  var userLocation = data.center;
  var taxiMarkers = data.markers;
  var markers = []
  var user = {
    "lat": userLocation.latitude,
    "lng": userLocation.longitude,
    "picture": {
      "url": "http://maps.google.com/mapfiles/arrow.png",
      "width":  36,
      "height": 36
    },
    "infowindow": "You are Here!"
  }

  markers.push(user);

  for (var i = 0; i < taxiMarkers.length; i++) {
    var intersection = {
      "lat": taxiMarkers[i][0].latitude,
      "lng": taxiMarkers[i][0].longitude,
      "picture": {
        "url": "http://maps.google.com/mapfiles/kml/paddle/"+ (i+1) +"-lv.png",
        "width":  36,
        "height": 36
      },
      "infowindow": "There are about " + Math.round(taxiMarkers[i][1]/60) + " empty cabs per minute here."
    }
    markers.push(intersection);
  }
  return markers;
}

$(function() {
  getUserLocation();
})
