
 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/



var loadMap = function () {

  $truckMap = $('#truck-map');

  if ($truckMap.length) {
    $.getJSON('/trucks/'+ $truckMap.data('truck') +'/locations/' + $truckMap.data('location') +'.json', function(location) {
      console.log("LOCATION: " + location.location.address);
      var location = location.location;

      var gmap = new GMaps({
        div: '#truck-map',
        lat: location.latitude,
        lng: location.longitude
      });

      var marker = gmap.addMarker({
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: {
          content: '<p>' + location.address + '</p>'
        }

      });

      new google.maps.event.trigger(marker, 'click');
    });
  }
};

var frequentLocation = function () {
  $('#fl').click(function() {

    $('#address-field').val($('#fl-select').val());
       
    return false;
  });
};















