// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  
  fullMap();
  
});

var fullMap = function () {

  var $cityTrucksMap = $('#city-trucks-map');
  var url = "/site.json" ;
  if ($cityTrucksMap.length) {
    $.getJSON(url, function (data) {

      var currentLat = data.current_location.latitude;
      var currentLng = data.current_location.longitude;


      var gmap = new GMaps({
        div: '#city-trucks-map',
        lat: currentLat,
        lng: currentLng,
        zoom: 15 
      });

      var purpleImage = 'http://maps.google.com/mapfiles/ms/icons/purple-dot.png';
      var personMarker = gmap.addMarker({
        lat: currentLat,
        lng: currentLng,
        infoWindow: {
          content: '<p>You</p>'
        }
      });

      personMarker.setIcon(purpleImage);

      $(data.trucks).each(function(index, truck){
        var infoWindow = new google.maps.InfoWindow({
          content: '<a href="trucks/' + truck.id + '">' + truck.name + '</a></h6>' + 
                   '<p>' + truck.address + '</p>'
        });


        var truckMarker = gmap.addMarker({
          lat: truck.latitude,
          lng: truck.longitude,
          title: truck.name,
          infoWindow: infoWindow
        });
        new google.maps.event.trigger(truckMarker, 'click');
      });

    });
  }
};
