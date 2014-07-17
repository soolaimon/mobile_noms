// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  GMaps.geolocate({
          success: function (position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var url = '/current_location';
            $.ajax({
              url: url,
              type: "post",
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
);
