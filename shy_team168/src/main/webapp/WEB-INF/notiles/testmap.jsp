<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<head>
<!-- <meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8"> -->
<style>
#map {
	height: 60%;
}
html, body {
	height: 100%; margin: 0; padding: 0;
}</style>
</head>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkK_EWB_e3yusAluX5FYlETpHypg3d8uA&callback=initMap"async defer></script>

<script type="text/javascript">
var marker = [];

function initMap() {
	
	var selectedRegion = "${selectedRegion}";
	var sivalue = "${sivalue}"; 
	alert("selectedRegion : "+selectedRegion+"  sivalue : "+sivalue);
	
	var lat = ${lat};
	var lng = ${lng};
	var zoom = ${zoom};
	alert("lat : "+lat+"  lng : "+lng+"  zoom : "+zoom);
	
	var mapCenter = {lat, lng};
	
	var map = new google.maps.Map(document.getElementById('map'), {center: mapCenter,zoom: zoom});
	
	<c:if test="${GeoSnsnoList != null}">
		<c:forEach var="GeoSnsno" items="${GeoSnsnoList}" varStatus="status">
			<c:if test='${GeoSnsno != "X"}'>
				var myLatLng = new google.maps.LatLng('${GeoSnsno.LATITUDE}', '${GeoSnsno.LONGDITUDE}');
				marker[status.index] = new google.maps.Marker({position: myLatLng, map: map});
				
				marker[status.index].addListener('click', function() {
		           alert("snsno : ${GeoSnsno.FK_SNSNO}");
		           <%-- javascript:location.href='<%= request.getContextPath() %>/place.shy?geoidx=' + this.seq; --%>
		        });
			</c:if>
		</c:forEach>
	</c:if>
	
	// 데이터 지도에 표시하기 : https://developers.google.com/maps/documentation/javascript/importing_data
 	google.maps.event.addDomListener(map, 'click', function() {
    	window.alert('Map was clicked!');
    });
 	
}


function setMarkers(map) {
	
	alert('111');
	
	/*  var locations = [
      ['삼익사이버 아파트', 37.0211403, 127.0971617, 28],
      ['국립축산과학원 축산자원개발부', 36.93309333, 127.10487485, 10]
    ];
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(37, 127.1),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var infowindow = new google.maps.InfoWindow();
    var marker, i;
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
[출처] 구글 맵에 여러개의 위치 표시하기|작성자 약장사

  */

<%-- 	alert("setMarkers(); start!");
	var marker = [];
	window.eqfeed_callback = function(results) {
        alert(results);
		results = ${GeoSnsnoList}
		alert(results);
		for (var i = 0; i < results.features.length; i++) {
	       var myLatLng = new google.maps.LatLng(results.LATITUDE, results.LOGDITUDE);
	          //var coords = results.features[i].geometry.coordinates; 
	        
	        marker[status.index] = new google.maps.Marker({
	           position : myLatLng,
	           
	           map : map
	        });
	
	        marker[status.index].addListener('click', function() {
	           alert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!");
	           javascript:location.href='<%= request.getContextPath() %>/place.shy?geoidx=' + this.seq;
	        });
        }
	} --%>
}
</script>

<body>
<div id="map"></div>
</body>
<!-- </html> -->