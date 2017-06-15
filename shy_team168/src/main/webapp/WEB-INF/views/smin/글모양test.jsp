<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




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
  
  
  
  
  <style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    @import "compass/css3";


.star,
.rating:not(.vote-cast):hover .star:hover ~ .star,
.rating.vote-cast .star.selected ~ .star
{
  /* normal state */
  color: black;
}

.rating:hover .star,
.rating.vote-cast .star
{
  /* highlighted state */
  color: red;
}
    
    
    
    
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
      list.slice(0, numToShow).show();

      button.click(function(){
          var showing = list.filter(':visible').length;
          list.slice(showing - 1, showing + numToShow).fadeIn();
          var nowShowing = list.filter(':visible').length;
          if (nowShowing >= numInList) {
            button.hide();
          }
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
  
  $(window).scroll(function() {
	    if ($(this).scrollTop() > 50 ) {
	        $('.scrolltop:hidden').stop(true, true).fadeIn();
	    } else {
	        $('.scrolltop').stop(true, true).fadeOut();
	    }
	});
	$(function(){$(".scroll").click(function(){$("html,body").animate({scrollTop:$(".thetop").offset().top},"1000");return false})})
  
  </script>
  
</head>


<body>




<div class='thetop'></div>



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
          <textarea class="form-control" rows="7" required></textarea>
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



<form role="form">
<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="MainInput" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">메인글 남기기</h4>
        
        
      </div>
      <div class="modal-body">
        
		

        <div class="form-group">
          <textarea class="form-control" rows="7" required></textarea>
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




		<!-- ******  인풋 (글남기기) 형식 *********  끝 -->


















<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header" style="margin-left: 350px;">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">홈페이지</a>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar" style="margin-right: 320px;">
     
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="Search..">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> OOO님 </a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container ">    
  <div class="row">
  
  
  
    <div class="col-sm-3 well">
    	
<!-- Add Google Maps -->
<div id="googleMap" style="height:300px;width:100%;"></div>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(37.539578, 126.899568);
var mapProp = {center:myCenter, zoom:15, scrollwheel:false, draggable:true, mapTypeId:google.maps.MapTypeId.ROADMAP};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({position:myCenter});
marker.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDm5ys8Aqru_hi_-arUTuHNDxR0Gmx4HxU&callback=myMap"></script>

<br><br><br>


		<ul class="rating"  >
  <li class="star" style=" cursor:pointer; display:inline-block; font-size: 30px;list-style-type: none; float: left; margin-left: 7px;">&star;</li>
  <li class="star" style=" cursor:pointer; display:inline-block; font-size: 30px;list-style-type: none;float: left; ">&star;</li>
  <li class="star" style=" cursor:pointer; display:inline-block; font-size: 30px;list-style-type: none;float: left; ">&star;</li>
  <li class="star" style=" cursor:pointer; display:inline-block; font-size: 30px;list-style-type: none; float: left;">&star;</li>
  <li class="star" style=" cursor:pointer; display:inline-block; font-size: 30px;list-style-type: none; float: left;">&star;</li>
</ul>        
<br><br>
 

      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>추천하기!</strong></p>
        방문한 페이지가 마음에 든다면 별표로 평가해주세요~
      </div>
      <p><a href="#">친구 추가하기</a></p>
      <p><a href="#">공유하기</a></p>
      <p><a href="#">자세히 보기</a></p>
    </div>
    
    
    
    <div class="col-sm-7">
    
      
      <div class="wrapper">
      
      
	 <ul class="list">
	 
     <li>

      <div>
      <h4>메인 글남기기</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="7"  data-toggle="modal" data-target="#MainInput" required></textarea>
        </div>
        
      </form>
      <br><br>
      </div>

	
	

      </li>
      
     <li>

     
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>Officially Blogging</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
      <h5><span class="label label-success">Lorem</span></h5><br>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>

      <h4>Leave a Comment:</h4>
      <form role="form">
        <div class="form-group">
          
          <textarea class="form-control" rows="4"  data-toggle="modal" data-target="#my80sizeCenterModal" required></textarea>
        </div>
        
        
        <div class="dropdown">
  <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown"> 코멘트
  <span class="badge">2</span></button>
  <ul class="dropdown-menu">
    



		 
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="bandmember.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>Anja <small>Sep 29, 2015, 9:12 PM</small>
		<button style="float: right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">댓글달기</button></h4>
          <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
        </div>
        <div class="col-sm-2 text-center">
          <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>John Row <small>Sep 25, 2015, 8:25 PM</small>
			<button style="float: right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">댓글달기</button></h4>

          <p>I am so happy for you man! Finally. I am looking forward to read about your trendy life. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
          <p><span class="badge">1</span> Comment:</p><br>
          <div class="row">
            <div class="col-sm-2 text-center">
              <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-xs-10">
              <h4>Nested Bro <small>Sep 25, 2015, 8:28 PM</small></h4>
              <p>Me too! WOW!</p>
              <br>
            </div>
          </div>
        </div>
        </div>





  </ul>
</div>
        
      </form>
      <br><br>
      
     
</li>

     <li>




     
      <div>
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>7번 글이요</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <img src="../images/iyou.jpg" class="img-thumbnail" alt="Cinque Terre" >
      <img src="../images/iyou.jpg" class="img-thumbnail" alt="Cinque Terre" >
      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><br>
      </div>
      
      
      
      
</li>
     
     <li>

      
      <div>
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>7번 글이요</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><br>
      </div>

</li>
     
     <li>

      
      <div>
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>7번 글이요</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><br>
      </div>

</li>
     
     <li>
     
     

</li>
     
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





<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-4x fa-angle-up"></i></div>
</div>


<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>





