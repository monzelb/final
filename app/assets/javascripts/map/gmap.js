// $(window).load(function() {
//   loadScript();
// });

// var map;

// function initialize() {

//   var mapstyle = [
//             {
//               "featureType": "administrative.locality",
//               "elementType": "labels.icon",
//               "stylers": [
//                 { "invert_lightness": true },
//                 { "color": "#e40952" },
//                 { "visibility": "on" }
//               ]
//             },
//            {
//               "featureType": "water",
//               "elementType": "geometry.fill",
//               "stylers": [
//                 { "visibility": "on" },
//                 { "hue": "#5eff00" },
//                 { "color": "#282744" },
//                 { "weight": 0.1 },
//                 { "saturation": -56 },
//                 { "lightness": 22 },
//                 { "gamma": 3.91 }
//               ]
//             }
//         ]
        
//   var mapOptions = {
//           center: new google.maps.LatLng(37.757097, -122.421966),
//           zoom: 17,
//           mapTypeId: google.maps.MapTypeId.NORMAL,
//           mapTypeControlOptions: {
//             style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
//             mapTypeIds: [google.maps.MapTypeId.ROADMAP, "map_style"]
//           }
          
//         };
//         // initializing map
        
//         var styledMap = new google.maps.StyledMapType(mapstyle, {name: "styled map"});
//         map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
//         map.mapTypes.set("map_style", styledMap);
//         map.setMapTypeId("map_style");



//    // geocoding 
//       var geocoding  = new google.maps.Geocoder();
//       $("#submit_button_geocoding").click(function(){
//         codeAddress(geocoding);
//       });
//       $("#submit_button_reverse").click(function(){
//         codeLatLng(geocoding);
//       });
      
   
// }


// function loadScript() {
//   console.log("map loading ...");
//   var script = document.createElement('script');
//   script.type = 'text/javascript';
//   //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o&sensor=false&libraries=drawing'
//   script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o&libraries=drawing&callback=initialize';
//   document.body.appendChild(script);
// }