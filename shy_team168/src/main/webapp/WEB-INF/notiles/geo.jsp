<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
<script
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"></script>
 
<style>
#map {
   width: 700px;
   height: 840px;
   position: relative;
   margin-top: -80.0%;
   margin-bottom: 100%;
   vertical-align: middle;
}

div.JH_infowindow {
   width: 173px;
   height: 203px;
}

img.JH_infowidow_gallary {
   width: 100%;
   height: 70%;
}

#map-canvas img[src*="gstatic.com/"], #map-canvas img[src*="googleapis.com/"]
   {
   max-width: none;
}
</style>

<script type="text/javascript">
   var search_lat;
   var search_lon;
   
   var map;
   var marker = [];
   
   var seq_lodge = [];
   var name = [];
   var type_lodge = [];
   var type_building = [];
   var lat = [];
   var lon = [];
   var total_price = [];
   /* 
   var elevator = [];
   var wifi = [];
   var air_controller = [];
   var heating = [];
   var washing_machine = [];
   var hair_dryer = [];
   var tv = [];
   var essential_item = [];
    */
   $(document).ready(function() {
      
      var search_content = "${search_content}";
      
      $.ajax({
         url : "https://maps.googleapis.com/maps/api/geocode/json",
         dataType : "JSON",
         method : "GET",
         data : {
            address : (search_content == null || search_content == "") ? "당산역" : search_content,
            key : "AIzaSyCuM1N_3sAadL1l71rS0hBLGivpJ589HqQ"
         },
         success : function(data) {
            if (data.status == "OK") {
               $.map(data.results, function(item) {
                  search_lat = item.geometry.location.lat;
                  search_lon = item.geometry.location.lng;
               });
            }
         }
      });
   });
   
   // 맵 초기화해서 센터에 둘 부분
   function initialize() {
      var mapCanvas = document.getElementById('map');/* 
      var autocomplete = new google.maps.places.Autocomplete(input);
       */
      var Position_center = new google.maps.LatLng(search_lat, search_lon);
      
      var mapOptions = {
         center : Position_center,
         zoom : 15,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      
      map = new google.maps.Map(mapCanvas, mapOptions);
   
      map.addListener('dragend', function() {
          window.setTimeout(function() {
             var pageNo = "1";
             
             changedCenter(search_content, numOfPeople, startDate, endDate, pageNo);
         }, 1000 / 2);
      });
      
      setMarkers(map, lat, lon);
   }
   
   google.maps.event.addDomListener(window, 'load', initialize);
   
   var infowindow = new google.maps.InfoWindow();

   // 마커 부분
   function setMarkers(map, lat, lon) {
      var contentString = [];
      
      for(var i = 0; i < seq_lodge.length; ++i) {
         var myLatLng = new google.maps.LatLng(lat[i], lon[i]);
         
         contentString[i] = '<div class="JH_infowindow">' +
            '<a href="/hajota/rooms/detailInfo.go?seq_lodge=' + seq_lodge[i] + '">' +
            '<img class="JH_infowidow_gallary" alt="infowindowGallary" src="<%=request.getContextPath() %>/resources/images/JHHY/Sample01_00.jpg" />' +
            '</a>' +
            '<span class="project-details">' +
            '<a href="/hajota/rooms/detailInfo.go?seq_lodge=' + seq_lodge[i] + '">' +
            '<strong>' +
            /* '<strong>' + name[i] + '</strong>' + '<br/>' + */
            /* '&nbsp;' + name[i] +  */'&#8361;&nbsp;' + total_price[i] + '<br/>' + type_lodge[i] + '&nbsp;' + type_building[i] + '<br/>' + '</a>' +
            '</strong>' +
               '</span>' +
            '</div>';
         
         marker[i] = new google.maps.Marker({
            position : myLatLng,
            map : map,
            seq_lodge : seq_lodge[i],
            content : contentString[i]
         });

         marker[i].addListener('click', function() {
            map.setCenter(this.position);
            infowindow.setContent(this.content);
            infowindow.open(map, this);
         });
      }
   }
   
   function setMapOnAll(map) {
      for(var i = 0; i < marker.length; ++i) {
         marker[i].setMap(map);
       }
    }
   
   function clearMarkers() {
      setMapOnAll(null);
    }
   
   function changedCenter(search_content, numOfPeople, startDate, endDate, pageNo) {
              
       var pageNo = "1";
       
      $.ajax({
         url : "/hajota/rooms/moveMap.go",
         dataType : "JSON",
         method : "GET",
         data : {
            afterLat : map.getCenter().lat(),
            afterLon : map.getCenter().lng(),
            search_content : search_content,
            numOfPeople : numOfPeople,
            startDate : startDate,
            endDate : endDate,
            pageNo : pageNo
         },
         
         success : function(data) {
            // map에 marker 등록할 것에 대한 정보
            seq_lodge = [];
            name = [];
            type_lodge = [];
            type_building = [];
            lat = [];
            lon = [];
            total_price = [];
            
            var html = '<ul class="gallery-post-grid holder" style="margin-left: 10%; margin-top: -3%;">';
            
            $.each(data, function(entryIndex, entry){
               seq_lodge[entryIndex] = entry.SEQ_LODGE;
               name[entryIndex] = entry.NAME;
               type_lodge[entryIndex] = entry.TYPE_LODGE;
               type_building[entryIndex] = entry.TYPE_BUILDING;
               lat[entryIndex] = entry.LAT;
               lon[entryIndex] = entry.LON;
               total_price[entryIndex] = entry.TOTAL_PRICE;
               
               html += '<div class="w3-third w3-margin-bottom w3-margin-top">'
                  + '<div class="w3-card-4" style="width: 300px; height: 400px;">'
                    + '<a href="/hajota/listdetailtest.go?seq_lodge=' + entry.SEQ_LODGE + '">'
                    + '<img src="<%=request.getContextPath() %>/resources/images/HSSH/event1.jpg" style="width:100%"></a>'
                    + '<div class="w3-container">'
                    + '<h3>' + entry.NAME + '</h3>'
                    + '<p class="w3-opacity">&#8361;&nbsp;' + entry.TOTAL_PRICE + '</p>'
                    + '<p class="w3-large">'
                    
                    if(entry.ELEVATOR == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/elevator.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.WIFI == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/wifi.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.AIR_CONTROLLER == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/air_controller.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.HEATING == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/heating.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.WASHING_MACHINE == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/washing_machine.png" style="width: 10%; height: 10%;"/>';   
                    }
                    
                    if(entry.HAIR_DRYER == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/hair_dryer.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.TV == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/tv.png" style="width: 10%; height: 10%;"/>';
                    }                    
                    
                    html += '&nbsp;</p><p><button class="w3-button w3-light-grey w3-block" onclick="goLocation(' + entry.SEQ_LODGE + ', ' + entry.LAT + ', ' + entry.LON + ');">숙소 위치 보기</button></p>'
                    + '</div>'
                    + '</div>'
                    + '</div>';
            });
            
            html += '</ul>';
            
            $("#div_showRoomsList").html(html);
            pagingAfterMoveMap(search_content, numOfPeople, startDate, endDate, pageNo);
            
            clearMarkers();
            setMarkers(map, lat, lon);
         }
      });
   }
   
   function paging(search_content, numOfPeople, startDate, endDate, pageNo) {
      
      $.ajax({
         url : "/hajota/rooms/pagingMap.go",
         dataType : "HTML",
         method : "GET",
         data : {
            search_content : search_content,
            numOfPeople : numOfPeople,
            startDate : startDate,
            endDate : endDate,
            pageNo : pageNo
         },
         
         success : function(data) {
            var html = data;
            
            if(html == "") {
               $("#div_showRoomsList").html("");
               
               html = "주변에 등록 된 숙소가 없습니다";
            }
            
            $("#JH_list_roomList_paging").html(html);
         }
      });
   }
   
   // 맵 중심을 움직이고 나서 보여주는 페이징 처리
   function pagingAfterMoveMap(search_content, numOfPeople, startDate, endDate, pageNo) {
      
      $.ajax({
         url : "/hajota/rooms/pagingMap.go",
         dataType : "HTML",
         method : "GET",
         data : {
            afterLat : map.getCenter().lat(),
            afterLon : map.getCenter().lng(),
            search_content : search_content,
            numOfPeople : numOfPeople,
            startDate : startDate,
            endDate : endDate,
            pageNo : pageNo
         },
         
         success : function(data) {
            var html = data;
            
            if(html == "") {
               $("#div_showRoomsList").html("");
               
               html = "주변에 등록 된 숙소가 없습니다";
            }
            
            $("#JH_list_roomList_paging").html(html);
         }
      });
   }
   
   // 맵을 움직이고 페이징 처리 버튼을 누르면 보여주는 링크
   function changedCenterViaLink(search_content, numOfPeople, startDate, endDate, pageNo, lat, lon) {
      
      $.ajax({
         url : "/hajota/rooms/moveMap.go",
         dataType : "JSON",
         method : "GET",
         data : {
            afterLat : lat,
            afterLon : lon,
            search_content : search_content,
            numOfPeople : numOfPeople,
            startDate : startDate,
            endDate : endDate,
            pageNo : pageNo
         },
         
         success : function(data) {
            seq_lodge = [];
            name = [];
            type_lodge = [];
            type_building = [];
            lat = [];
            lon = [];
            total_price = [];
            
            var html = '<ul class="gallery-post-grid holder" style="margin-left: 10%; margin-top: -3%;">';
            
            $.each(data, function(entryIndex, entry){
               seq_lodge[entryIndex] = entry.SEQ_LODGE;
               name[entryIndex] = entry.NAME;
               type_lodge[entryIndex] = entry.TYPE_LODGE;
               type_building[entryIndex] = entry.TYPE_BUILDING;
               lat[entryIndex] = entry.LAT;
               lon[entryIndex] = entry.LON;
               total_price[entryIndex] = entry.TOTAL_PRICE;

               html += '<div class="w3-third w3-margin-bottom w3-margin-top">'
                  + '<div class="w3-card-4" style="width: 300px; height: 400px;">'
                    + '<a href="/hajota/listdetailtest.go?seq_lodge=' + entry.SEQ_LODGE + '">'
                    + '<img src="<%=request.getContextPath() %>/resources/images/HSSH/event1.jpg" style="width:100%"></a>'
                    + '<div class="w3-container">'
                    + '<h3>' + entry.NAME + '</h3>'
                    + '<p class="w3-opacity">&#8361;&nbsp;' + entry.TOTAL_PRICE + '</p>'
                  + '<p class="w3-large">'
                    
                    if(entry.ELEVATOR == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/elevator.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.WIFI == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/wifi.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.AIR_CONTROLLER == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/air_controller.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.HEATING == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/heating.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.WASHING_MACHINE == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/washing_machine.png" style="width: 10%; height: 10%;"/>';   
                    }
                    
                    if(entry.HAIR_DRYER == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/hair_dryer.png" style="width: 10%; height: 10%;"/>';
                    }
                    
                    if(entry.TV == 1) {
                       html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/tv.png" style="width: 10%; height: 10%;"/>';
                    }                    
                    
                    html += '&nbsp;</p><p><button class="w3-button w3-light-grey w3-block" onclick="goLocation(' + entry.SEQ_LODGE + ', ' + entry.LAT + ', ' + entry.LON + ');">숙소 위치 보기</button></p>'
                    + '</div>'
                    + '</div>'
                    + '</div>';
            });
            
            html += '</ul>';
            
            $("#div_showRoomsList").html(html);
            pagingAfterMoveMap(search_content, numOfPeople, startDate, endDate, pageNo);
            
            clearMarkers();
            setMarkers(map, lat, lon);
         }
      });
   }
   
   
   
   
</script>

</head>
<body>
   <div id="map" style="display: inline-block;"></div>

   <form name="changedCenterForm">
      <input type="hidden" id="afterLat" name="afterLat" /> <input
         type="hidden" id="afterLon" name="afterLon" />
   </form>
</body>