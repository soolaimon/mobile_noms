
 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  loadMap();

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
  });
  $(document).on('click', '.geolocate-truck', function() {
    var $geocodeBtn = $(this);
    alertify.confirm("The browser is going to get your location, ok?", function (e) {
      if (e) {
        GMaps.geolocate({
          success: function (position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var url = '/trucks/' + $geocodeBtn.data('truck') + '/locations/' + $geocodeBtn.data('location');
            $.ajax({
              url: url,
              type: "put",
              data: { location: {latitude: latitude, longitude: longitude} },
              dataType: "json",
              success: function(data) {
                alertify.success("Location updated successfully!");
                console.log('success');
                console.log(data);
              },
              error: function(a,b,c) {
                console.log('fail');
                console.log(a);
                console.log(b);
              }
            });
          },
          error: function(error){
            alertify.error("Update failed. Try again.");
          },
          not_supported: function() {
            alertify.alert("Your browser doesn't support geolocation. You'll need to update manually.");
          }
        });
      }
    });
    return false;
  });
});

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
