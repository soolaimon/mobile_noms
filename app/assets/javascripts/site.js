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
      console.log(data);
    });

  }


      
};
