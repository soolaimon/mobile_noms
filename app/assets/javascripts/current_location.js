


var getCurrentLocation = function(){
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
          fullMap();

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
};