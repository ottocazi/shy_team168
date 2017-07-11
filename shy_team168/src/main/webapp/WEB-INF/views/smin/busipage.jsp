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
		
		//alert(count);
		$("#starcounter").val(count);
	}
	
	 function new_Main() {
		   
      location.href = "#new_Main";
   }
	
	 function new_Main_enter(){
	      
		  document.Mainform.method = "post";
	      document.Mainform.action = "shynow.shy";
	      document.Mainform.submit();
	   }
	 
	 
	 
	 
	 
	
	
	
	// 구글맵 함수
	// 검색어의 위도, 경도
	var centerLat = '${geomap.latitude}';
	var centerLng = '${geomap.longditude}';
	
	var myCenter=new google.maps.LatLng( centerLat , centerLng);
	var marker = [];
	
	function initialize() {
		  var mapProp = {
		    center:myCenter ,
		    
		    zoom:14,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
		  
		  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		  
		  
		  
		  
		  
		  
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
		  
		  setMarkers(map);
		  
		  
		}
		
		
		/* 
		function setMarkers(map) {
			var myLatLng = new google.maps.LatLng('${geomap.latitude}', '${geomap.longditude}');
	         
	         
	         marker[0] = new google.maps.Marker({
	            position : myLatLng,
	            map : map
	         });
		}
		  */
		function setMarkers(map) {
			
			<c:if test="${selectNearMap != null}">
        		<c:forEach var="location" items="${selectNearMap}" varStatus="status">
	        		var myLatLng = new google.maps.LatLng('${location.latitude}', '${location.longditude}');
			         
			         
			         marker[status.index] = new google.maps.Marker({
			            position : myLatLng,
			            
			            map : map,
			            seq : '${location.seq}'
			         });
	
			         marker[status.index].addListener('click', function() {
			        	 javascript:location.href='<%= request.getContextPath() %>/place.shy?geoidx=' + this.seq;
			         });
        		</c:forEach>
        	</c:if>
        	
        	
        	
        	
		}
	
	
		google.maps.event.addDomListener(window, 'load', initialize);
	
		
		 // end of 구글멥
		
		
		
		   
		   
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


<%-- 


		<!-- ******  인풋 (글남기기) 형식 *********  끝 -->

<!-- 선택 모달창 -->
      <div class="white_content" id="new_Main" align="center">
         <div align="center">
            <i class="fa fa-times-circle-o fa-2x" aria-hidden="true"style="float:right; color:grey; font-weight: lighter;" onclick="finishpic();" ></i>
         
            
         
                     
            <div style="clear: both; width: 96%;">

               <form name="Mainform" enctype="multipart/form-data">
                  <div align="left" style="width: 480px;">
                     
                     <br>  <h4 class="modal-title" id="myModalLabel">메인글 남기기</h4> 
        
                     <div style="float: right; display:inline-block; vertical-align: baseline; "  >
                     <select name="status" id="status">
                        <option value="1">전체 공개</option>
                        <option value="2">친구 공개</option>
                        <option value="0">나만 보기</option>
                     </select>
                     </div>
                
                     </div>
                     
                  <div>
                  <input type="text" name="shypay" id="shypay" style="width:480px; border:none; color:#f4bf42; font-size:13pt; font-style: italic;"readonly></input>
                  </div>
                  
                  
                  <input type="hidden" name="userseq" value="${loginuser.idx}" />
                  
                     <textarea id="content" name="content" class="swal2-textarea"
                         style="width: 480px; min-height: 170px;"></textarea>
                  
                  
                  <div style="margin-top: 5%; width:480px;" align="left">
                  
                  
                   
                  <input type="file" id="uploader" name="image" />   
               </div>
                  
                  <input id="street_number" name="street_number" type="hidden" 
                     disabled></input> <input id="route" type="hidden" name="route"
                     disabled></input> <input id="locality" type="hidden" name="locality"
                     disabled></input> <input id="administrative_area_level_1" name="area1"
                     type="hidden" disabled></input> <input id="postal_code" name="postal_code"
                     type="hidden" disabled></input> <input id="country" name="country"
                     type="hidden" disabled></input> <input id="위도" name="latitude" value="${geomap.latitude}"
                     type="hidden"  /> <input id="경도" type="hidden" name="longditude" value="${geomap.longditude}"
                      /> 
                  
                  
               </form>
               
            <br>   
         <button class="dd_button dd_button5" onclick="new_Main_enter();">작성완료</button>   
            
</div>
</div></div>
 --%>




<div class="container" style="width: 90%; " >    
  <div class="row" >
  
  
  
    <div class="col-sm-3 well">
    	
    	
    	
    	<!-- 구글맵 해버리기~  Google map-->

<c:if test="${geomap.latitude != 'X'}">
<div id="googleMap" style="width:100%; height:300px;"></div>

		<br>
      <div class="alert alert-success fade in">
        <!-- <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a> -->
        <p><strong>내 주변 Shy보기</strong></p>
        위 지도의 마커를 클릭해 보세요!
      </div>
      
      </c:if>
      <c:if test="${geomap.latitude == 'X'}">
		    <img style="width:100%; height:300px;" src="http://wallpaperpulse.com/thumb/604167.jpg">
		    
		    </c:if>
      
      
    </div>
    
    
    
    <div class="col-sm-7">
    
      
      <div class="wrapper">
      
      <div style="font-size: 25px; font-weight: bold; color:  #2952a3; " align="center">${geomap.shyplace }</div>
      <br><br><br>
      
      
      
      
	 <ul class="list">
	 
      
     <li>

     
     
</li>

	<c:forEach items="${geolist}" var="geolist" varStatus="status">
     <li>


      <div style="border: double 5px #ccdcff;">
      
      <h4>
      <small>${geomap.shyplace}에서 OO님과 함께</small>
      
      </h4>
      
      
      <c:if test="${geomap.myimg != null}">
      	<img  style="width: 100%;"
      	 src="<%=request.getContextPath() %>/resources/images/shydb/${geolist.myimg }"><%-- img가져오기 --%>
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





