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

      var current_location = data.current_location;

      var gmap = new GMaps({
        div: '#city-trucks-map',
        lat: current_location.latitude,
        lng: current_location.longitude
      });


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
