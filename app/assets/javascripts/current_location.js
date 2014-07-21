function createCookie(name, value, days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    var expires = "; expires=" + date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c = c.substring(1);
      if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
  }
  return "";
}

$(document).ready(function() {
  console.log('COOKIE: ' + getCookie('use_location'));
  console.log('HELLO: ' + $('#hello').length);
  if (getCookie('use_location') !== 'true') {
    alertify.confirm("Ok if we use your location?", function(e) {
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
                createCookie('use_location', true, 1);
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
      } else {
        // TODO: Add functionality for when they click the "No" button.
      }
    });
  }
});
