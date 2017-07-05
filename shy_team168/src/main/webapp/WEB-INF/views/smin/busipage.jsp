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
	
	
	function initialize() {
		  var mapProp = {
		    center:new google.maps.LatLng(${geomap.latitude},${geomap.longditude}),
		    zoom:18,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
		  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
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

















<div class="container" style="width: 70%;" >    
  <div class="row">
  
  
  
    <div class="col-sm-3 well">
    	
    	
    	
    	<!-- 구글맵 해버리기~  Google map-->


<div id="googleMap" style="width:300px;height:300px;"></div>
<br><br>




      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>마음에 드시나요?</strong></p>
        방문한 페이지에 대해 글을 남겨 평가해주세요.
      </div>
      <p><a href="#">친구 추가하기</a></p>
      <p><a href="#">공유하기</a></p>
      <p><a href="#">자세히 보기</a></p>
    </div>
    
    
    
    <div class="col-sm-7">
    
      
      <div class="wrapper">
      
      <div style="font-size: 20px; font-weight: bold;">${geomap.shyplace } 의 페이지</div>
      <br><br><br>
      
      
        <div>
      <h4>메인 글남기기</h4>
      <form role="form" name="gogo">
        <div class="form-group">
          <textarea class="form-control" rows="7" id="firstarea"  required></textarea>
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


      <div>
      <h4>
      <small>${geolist.shyplace}에서 OO님과 함께</small>
      <small>${geolist.sdatedtime}</small>
      </h4>
      <hr>
      <h2> 이름 : ${geolist.name}</h2>
      <h5><span class="glyphicon glyphicon-time"></span>${geolist.sdatedtime}</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <img src="../images/iyou.jpg" class="img-thumbnail" alt="Cinque Terre" >
      <img src="../images/iyou.jpg" class="img-thumbnail" alt="Cinque Terre" >
      <p> ${geolist.scontent} </p>
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





