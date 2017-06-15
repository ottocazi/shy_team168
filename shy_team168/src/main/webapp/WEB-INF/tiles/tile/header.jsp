<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/shy_top.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>



#shy{
  font-family: 'Lato', sans-serif;
}


.letter{
  display: inline-block;
  font-weight: 900;
  font-size: 2em;
  margin: 0.03em;
  position: relative;
  color: #00B4F1;
  transform-style: preserve-3d;
  perspective: 500;
  z-index: 1;
}
.letter:before, .letter:after{
  position:absolute;
  content: attr(data-letter);
  transform-origin: top left;
  top:0;
  left:0;
}
.letter, .letter:before, .letter:after{
  transition: all 0.3s ease-in-out;
}
.letter:before{
  color: #fff;
  text-shadow: 
    -1px 0px 1px rgba(255,255,255,.8),
    1px 0px 1px rgba(0,0,0,.8);
  z-index: 3;
  transform:
    rotateX(0deg)
    rotateY(-15deg)
    rotateZ(0deg);
}
.letter:after{
  color: rgba(0,0,0,.11);
  z-index:2;
  transform:
    scale(1.08,1)
    rotateX(0deg)
    rotateY(0deg)
    rotateZ(0deg)
    skew(0deg,1deg);
}
.letter:hover:before{
  color: #fafafa;
  transform:
    rotateX(0deg)
    rotateY(-40deg)
    rotateZ(0deg);
}

.letter:hover:after{
  transform:
    scale(1.08,1)
    rotateX(0deg)
    rotateY(40deg)
    rotateZ(0deg)
    skew(0deg,22deg);
}

.shy_topnavbar a:hover {
	background-color: #fff;
}

</style>


</head>

<!-- <body id="page-top"> -->
<header id="page-top">

<!-- <div style="margin-bottom:10px;">
</div> -->
<nav class="shy_topnavbar shy_topnavbar-fixed-top " style="background-color: white;">
  <div class="shy_top_container-fluid">
    <div class="shy_topnavbar-header">
      <a class="shy_topnavbar-brand" href="#">
       <span class="letter" id="shy" data-letter="s">s</span>
   				<span class="letter" id="shy" data-letter="h">h</span>
   				<span class="letter" id="shy" data-letter="y">y</span>
      </a>
    </div>
    
    <ul class="shy_topnav shy_topnavbar-shy_topnav shy_topnavbar-right">
      <li><a href="#"><i class="fa fa-street-view fa-2x" aria-hidden="true" style="color:#98DDDE;"></i></a></li>
      <li><a href="#"><i class="fa fa-heartbeat fa-2x" aria-hidden="true" style="color:#F7786B;"></i></a></li>
      <li><a href="#"><i class="fa fa-bolt fa-2x" aria-hidden="true" style="color:#FAE03C;"></i></a></li>
      <li><a href="#"><i class="fa fa-credit-card fa-2x" aria-hidden="true" style="color:#F2552C;"></i></a></li>
      <li><a href="#"><i class="fa fa-map-marker fa-2x" aria-hidden="true" style="color:#B76BA3;"></i></a></li>
      
    </ul>
    
    <form class="shy_topnavbar-form">
      <div class="shy_top_form-group">
        <input  type="text" class="shy_top_form-control" placeholder="" style="border-radius: 10px;">&nbsp;
       
      </div>
      
      <input type="hidden" class="shy_top_btn"  id="search" onclick="goSearch();"><!-- style="border: hidden;" -->
      <label for="search" style="cursor: pointer;"><i class='fa fa-search'></i></label> 
    </form>
  </div>
</nav>

</header>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
    