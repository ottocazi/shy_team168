<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCpqeGEfswdtP2VPArIjCJ7_ycPxqvq640"></script>
  
  

  <style>    
    /* Set black background color, white text and some padding */
   
    
    @import "compass/css3";





    
    
    
    
    *{ 
  font-family:tahoma;
}

.scrolltop {
	display:none;
	width:100%;
	margin:0 auto;
	position:fixed;
	bottom:20px;
	right:10px;	
}
.scroll {
	position:absolute;
	right:20px;
	bottom:20px;
	background:#b2b2b2;
	background:rgba(178,178,178,0.7);
	padding:20px;
	text-align: center;
	margin: 0 0 0 0;
	cursor:pointer;
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s; 		
}
.scroll:hover {
	background:rgba(178,178,178,1.0);
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s; 		
}
.scroll:hover .fa {
	padding-top:-10px;
}
.scroll .fa {
	font-size:30px;
	margin-top:-5px;
	margin-left:1px;
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s; 	
}
    
    
    .list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.list li {
	position: relative;
	margin-bottom: 10px;
}



.modal-dialog.modal-80size {
  width: 40%;
  height: 70%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 70%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 80%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}


.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:1px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#b30000;}


    
  </style>
  
  <script type="text/javascript">
  
  
  
  $(document).ready(function(){

      var list = $(".list li");
      var numToShow = 3;
      var button = $("#next");
      var numInList = list.length;
      list.hide();
      if (numInList > numToShow) {
        button.show();
      }
      list.slice(1, numToShow).show();

      button.click(function(){
          var showing = list.filter(':visible').length;
          list.slice(showing - 1, showing + numToShow).fadeIn();
          var nowShowing = list.filter(':visible').length;
          if (nowShowing >= numInList) {
            button.hide();
          }
      });

      
      $( ".star_rating a" ).click(function() {
    	     $(this).parent().children("a").removeClass("on");
    	     $(this).addClass("on").prevAll("a").addClass("on");
    	     return false;
    	});


      
      
      
});
  
  
  
  $(
		  function () {
		    $('li').on('click', function() {
		      var selectedCssClass = 'selected';
		      var $this = $(this);
		      $this.siblings('.' + selectedCssClass).removeClass(selectedCssClass);
		      $this
		        .addClass(selectedCssClass)
		        .parent().addClass('vote-cast');
		    });
		  }
		);
  /* 
  $(window).scroll(function() {
	    if ($(this).scrollTop() > 50 ) {
	        $('.scrolltop:hidden').stop(true, true).fadeIn();
	    } else {
	        $('.scrolltop').stop(true, true).fadeOut();
	    }
	});
	$(function(){$(".scroll").click(function(){$("html,body").animate({scrollTop:$(".thetop").offset().top},"1000");return false})})
  
	 */
	
	
	function getText(){
		
		var test = $("#firstarea").val();
	
		$("#secondarea").val(test);
		

	}
	
	
	function goInput( ) {
		  
		    /*formData 추가?  */
			  document.mainputfrm.method = "post";
			  document.mainputfrm.action = "shynow.shy";
			  document.mainputfrm.submit();
			  
		  
		}
	
	function starcount(count){
		
		alert(count);
		$("#starcounter").val(count);
	}
	
	var latitude = ${geomap.latitude}
	var longditude = ${geomap.longditude}
	
	
	var myCenter=new google.maps.LatLng( latitude , longditude);

	
	
	
	function initialize() {
		  var mapProp = {
		    center:myCenter ,
		    zoom:14,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
		  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		  
		  
/* 
		  var marker=new google.maps.Marker({
		    position:myCenter,
		    animation:google.maps.Animation.BOUNCE
		    });
		  
		  marker.setMap(map);
		  
		   */
		  
		  
<%-- 
			// 장환이형 소스코드
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
			            '&nbsp;' + name[i] + '&#8361;&nbsp;' + total_price[i] + '&nbsp;' + type_lodge[i] + '&nbsp;' + type_building[i] + '<br/>' + '</a>' +
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
			    --%>
		  
		  
		  
		  
		  var myCity = new google.maps.Circle({
			  center:myCenter ,
			  radius:1200,
			  strokeColor:"#ff4d4d",
			  strokeOpacity:0.8,
			  strokeWeight:2,
			  fillColor:"#ffcce0",
			  fillOpacity:0.4
			});
		  

		  myCity.setMap(map);
		  
		  

		  var infowindow = new google.maps.InfoWindow({
		    content:"Hello World!"
		    });

		  google.maps.event.addListener(marker, 'click', function() {
		    infowindow.open(map,marker);
		    });
		  
		  
		}
	
	
	
		google.maps.event.addDomListener(window, 'load', initialize);
	
		
		
		
		
		
		   
		   
  </script>
  
</head>


<body>



<!-- 
<div class='thetop'></div>
 -->


			<!-- ******  인풋 (글남기기) 형식 *********  시작 -->
		
		
		
<form role="form">
<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">글 남기기</h4>
        
        
      </div>
      <div class="modal-body">
        
		

        <div class="form-group">
          <textarea class="form-control" rows="7"  required></textarea>
        </div>
 

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         <button type="submit" class="btn btn-success">Submit</button>
      </div>
    </div>
  </div>
</div>
</form>



<form role="form" name="mainputfrm">
<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="MainInput" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">메인글 남기기</h4>
        
        
      </div>
      <div class="modal-body">


<p class="star_rating" align="left">
	
    <a href="#" class="on" onclick="starcount('1');">★</a>
    <a href="#" class="on" onclick="starcount('2');">★</a>
    <a href="#" class="on" onclick="starcount('3');">★</a>
    <a href="#" onclick="starcount('4');">★</a>
    <a href="#" onclick="starcount('5');">★</a>
     
    
	<select name="status" id="status" style="float: right; size: 30px;"> 
	<option value="1">전체 공개</option>
	<option value="2">친구 공개</option>
	<option value="0">나만 보기</option>
	</select>
    
</p>
<input type="hidden" id="starcounter" value="0"/> 
		

        <div class="form-group">
          <textarea class="form-control" rows="7" id="secondarea"  required></textarea>
          
        </div>
 <input type="file" id="uploader" name="image" />

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         <button type="submit" class="btn btn-success" OnClick="goInput()">확인</button>
      </div>
    </div>
  </div>
</div>
</form>




		<!-- ******  인풋 (글남기기) 형식 *********  끝 -->

















<div class="container" style="width: 90%; " >    
  <div class="row" >
  
  
  
    <div class="col-sm-3 well">
    	
    	
    	
    	<!-- 구글맵 해버리기~  Google map-->


<div id="googleMap" style="width:100%; height:300px;"></div>
<br><br>




      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>내 주변 Shy보기</strong></p>
        위 지도의 마커를 클릭해 보세요!
      </div>
      <p><a href="#">친구 추가하기</a></p>
      <p><a href="#">공유하기</a></p>
      <p><a href="#">자세히 보기</a></p>
    </div>
    
    
    
    <div class="col-sm-7">
    
      
      <div class="wrapper">
      
      <div style="font-size: 25px; font-weight: bold; color:  #2952a3; margin-left: 130px;">${geomap.shyplace }</div>
      <br><br><br>
      
      
        <div>
      
      <form role="form" name="gogo">
        <div class="form-group">
          <textarea class="form-control" rows="7" id="firstarea" placeholder="메인에 남길 글을 작성해보세요!" 
           required></textarea>
        </div>
        
      </form>
      
      	<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#MainInput" style="float: right;" OnClick="getText()">작성 시작하기</button>
      
      <br><br>
      </div>
      
      
	 <ul class="list">
	 
      
     <li>

     
     
</li>

	<c:forEach items="${geolist}" var="geolist" varStatus="status">
     <li>


      <div style="border: double 5px #ccdcff;">
      
      <h4>
      <small>${geolist.shyplace}에서 OO님과 함께</small>
      
      </h4>
      
      
      <c:if test="${gvo.gimg != null}">
      	<img class="grp_boxImage" style="width: 100%;"
      	 src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }"><%-- img가져오기 --%>
      </c:if>
      <c:if test="${gvo.gimg == null}">
      	<img class="grp_boxImage" style="width: 100%;"
      	src="http://wallpaperpulse.com/thumb/604167.jpg"><%-- 기본이미지 --%>
      </c:if>
      <h2 style="font-style: inherit; font-size: 23px;">
      
      <a style="color:  #2952a3; " href="<%= request.getContextPath() %>/gainpage.shy?myIdx=${geolist.idx}">
      ${geolist.name}</a>님의 글
      
      </h2>
      
      
      <h5><span class="glyphicon glyphicon-time"></span>${geolist.sdatedtime}</h5>
      <h5><span class="label label-danger">#여기서</span> <span class="label label-primary">#누구와</span></h5><br>
      
      <p style="border-top: double 5px #ccdcff;"> ${geolist.scontent} </p>
      <br><br>
      </div>
      
</li>
     </c:forEach>
     
     
     
     
     
     
     
     <li>Item 7</li>
     
     <li>Item 8</li>
     
     <li>Item 9</li>
     
     <li>Item 10</li>
     
     
  </ul>
  
  <button id="next" style=" margin-bottom: 150px; ">Show More</button>
</div>
      
      
      
      
    </div>
    
    
    
  </div>
</div>



<!-- 

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-4x fa-angle-up"></i></div>
</div> -->


</body>
</html>





