// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  if (document.cookie.indexOf("agreedLocation") < 0 && $('#city-trucks-map').length){
    alertify.confirm("Ok if we use your location?", function(e) {
      if (e) {
        document.cookie += "agreedLocation";
        getCurrentLocation();

      }else {
        getCurrentLocation();
       }
     });
   }

  frequentLocation();

  loadMap();

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



   $('#find-yourself').click(function(event) {
     getCurrentLocation();
     return false;
   });
  
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
  });
 


  } 


);


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
        // new google.maps.event.trigger(truckMarker, 'click');
      });

    });
  }
};
