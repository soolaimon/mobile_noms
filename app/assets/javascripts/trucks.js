
 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  loadMap();

  $('.form-group select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
  });


});

var loadMap = function () {

  $truckMap = $('#truck-map');

  if ($truckMap.length) {
    $.getJSON('/trucks/'+ $truckMap.data('truck') +'/locations/' + $truckMap.data('location') +'.json', function(location) {
      var location = location.location;
      var gmap = new GMaps({
        div: '#truck-map',
        lat: location.latitude,
        lng: location.longitude
      });

      gmap.addMarker({
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: {
          content: '<p>' + location.address + '</p>'
        }

      });

    });
  }
};
