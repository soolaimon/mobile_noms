$(document).ready(function() {
  if ($('#hello').length !== 0){ 
    alertify.confirm("Ok if we use your location?", function(e){
      if (e) {
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
      else {

          }
        }
     ); 
    }
  }
);
