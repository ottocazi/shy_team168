<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>googlemap v3 </title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>   
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCpqeGEfswdtP2VPArIjCJ7_ycPxqvq640"></script>
</head>
<SCRIPT LANGUAGE="JavaScript">

var contentArray = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var map;
var geocoder;
 
// infowindow contents 배열
 contentArray[0] = "Kay";
 contentArray[1] = "uhoons blog";
 contentArray[2] = "www.uhoon.co.kr";
 contentArray[3] = "www.uhoon.co.kr ";
 contentArray[4] = "www.uhoon.co.kr";
 contentArray[5] = "www.goodkiss.co.kr";
 contentArray[6] = "GG";
 contentArray[7] = "www.goodkiss.co.kr";
 contentArray[8] = "II";
 contentArray[9] = "www.goodkiss.co.kr";
 
// marker icon 배열
 iConArray[0] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[1] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[2] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[3] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[4] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[5] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[6] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[7] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[8] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 iConArray[9] = "http://google-maps-icons.googlecode.com/files/walking-tour.png";
 
// 위경도 배열
var markerArray = [ new google.maps.LatLng(40.3938,-3.7077)
, new google.maps.LatLng(40.45038,-3.69803)
, new google.maps.LatLng(40.45848,-3.69477)
, new google.maps.LatLng(40.40672,-3.68327)
, new google.maps.LatLng(40.43672,-3.62093)
, new google.maps.LatLng(40.46725,-3.67443)
, new google.maps.LatLng(40.43794,-3.67228)
, new google.maps.LatLng(40.46212,-3.69166)
, new google.maps.LatLng(40.41926,-3.70445)
, new google.maps.LatLng(40.42533,-3.6844)
];
 
function initialize() {
    geocoder = new google.maps.Geocoder();
 
    var mapOptions = {
        zoom: 11,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(40.4167754,-3.7037901999999576)
    };
 
    map = new google.maps.Map(document.getElementById('map'),mapOptions);
 
    var populationOptions = {
        strokeColor: '#000000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#808080',
        fillOpacity: 0.5,
        map: map,
        center: new google.maps.LatLng(40.4167754,-3.7037901999999576) ,
        radius: $("#radius").val()*1000
    };
    cityCircle = new google.maps.Circle(populationOptions);
}
 
// 주소 검색
function showAddress() {
    var address = $("#address").val();
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            var lat = results[0].geometry.location.lat();
            var lng = results[0].geometry.location.lng();
 
            $("#latitude").val(lat);
            $("#longitude").val(lng);
 
            var populationOptions = {
                strokeColor: '#000000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#808080',
                fillOpacity: 0.5,
                map: map,
                center: new google.maps.LatLng(lat,lng) ,
                radius: $("#radius").val()*1000
            };
            if (cityCircle)
            {
                cityCircle.setMap(null);
            }
            cityCircle = new google.maps.Circle(populationOptions);
 
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}
 
// 드롭 마커 보기
function viewMarker() {
    for (var i = 0; i < markerArray.length; i++) {
        setTimeout(function() {
            addMarker();
        }, i * 300);
    }
 
    var marker = new google.maps.Marker ({
            position: new google.maps.LatLng(40.4167754,-3.7037901999999576),
            map: map,
            draggable: true
        }); 
 
    google.maps.event.addListener(marker, "dragend", function(event) {
        var point = marker.getPosition();
        $("#latitude").val(point.lat());
        $("#longitude").val(point.lng());
 
        var populationOptions = {
            strokeColor: '#000000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#808080',
            fillOpacity: 0.5,
            map: map,
            center: new google.maps.LatLng($("#latitude").val(),$("#longitude").val()) ,
            radius: $("#radius").val()*1000
        };
        if (cityCircle)
        {
            cityCircle.setMap(null);
        }
        cityCircle = new google.maps.Circle(populationOptions);
    });
}
 
// 마커 추가
function addMarker() {
 
    var marker = new google.maps.Marker({
        position: markerArray[iterator],
        map: map,
        draggable: false,
        icon: iConArray[iterator],
        animation: google.maps.Animation.DROP
    });
    markers.push(marker);
 
    var infowindow = new google.maps.InfoWindow({
      content: contentArray[iterator]
    });
 
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
    });
    iterator++;
}
 
// 중심 이동
function fnLocation(lat, lng) {
    myLocation = new google.maps.LatLng(lat, lng);
    map.setCenter(myLocation);
}
 
//google.maps.event.addDomListener(window, 'load', initialize);
 
$( window ).load(function() {
    initialize();
    viewMarker();
});
 
</SCRIPT>
<body>
radius : <select id="radius" >
    <option value="10" selected="selected">10Km</option>
    <option value="5">5Km</option>
</select>
latitude : <input type="text" id="latitude" value="40.4167754"/>
longitude: <input type="text" id="longitude" value="-3.7037901999999576"/>
<div id="map" style="width:760px;height:400px;margin-top:20px;"></div>
<label style="margin:3px 0 0 0;" for="address">address</label>
<input type="text" id="address" name="address" style="margin:3px 0 0 5px;" value=""/>
<input type="button" value="search" onclick="Javascript:showAddress();" />
</body>
</html>