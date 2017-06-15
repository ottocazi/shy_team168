<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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



</style>


</head>

<!-- <body id="page-top"> -->
<header id="page-top">

<div style="margin-bottom:10px;">
</div>
<nav class="navbar navbar-fixed-top ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
       <span class="letter" id="shy" data-letter="s">s</span>
   				<span class="letter" id="shy" data-letter="h">h</span>
   				<span class="letter" id="shy" data-letter="y">y</span>
      </a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-heart-empty" style="font-size: 15pt; "></span></a></li>
      <li><a href="#"><span style="font-size: 15pt;"class="glyphicon glyphicon-flash"></span></a></li>
      <li><a href="#"><span style="font-size: 15pt;"class="glyphicon glyphicon-map-marker"></span></a></li>
    </ul>
    
    <form class="navbar-form">
      <div class="form-group">
        <input  type="text" class="form-control" placeholder="Search" style="border-radius: 10px;">&nbsp;
        
        <a href="#">
        	<span class="glyphicon glyphicon-search" style="font-size:15pt; "></span>
        </a>
      </div>
      <!-- <button type="submit" class="btn btn-default">Submit</button> -->
    </form>
  </div>
</nav>


   <!--  <nav id="mainNav" class="navbar navbar-default navbar-fixed-top" style="background-color: white;">
        <div class="shytain">
            
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                
                <span class="letter" id="shy" data-letter="s">s</span>
   				<span class="letter" id="shy" data-letter="h">h</span>
   				<span class="letter" id="shy" data-letter="y">y</span>
            	</a>
                
                <form class="form-inline" name="searchForm">my-2 my-lg-0 
					
					<input class="input-sm" style="border-radius: 10px; margin-top: 10px; " type="text"  placeholder="검색" >
					<a href=""style="margin-right:330px;"><span class="glyphicon glyphicon-search"></span></a>
					  
					</form>
            </div>
			
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	       	
                <ul class="nav navbar-nav navbar-right">
                
					<li>
					input 위치 
					</li>
					              
                
                    <li>
                       <a href="#">
          				<span style="font-size: 15pt;"class="glyphicon glyphicon-flash"></span>
        				</a>
                    </li>
                    <li>
                        <a href="#features">  
                        <span class="glyphicon glyphicon-heart-empty" style="font-size: 15pt;"></span></a>class="page-scroll" 
                    </li>
                    <li>
                        <a href="#">
          				<span style="font-size: 15pt;"class="glyphicon glyphicon-map-marker"></span>
        				</a>
                    </li>
                </ul>
            </div>
            
        </div>
        
    </nav>
 

    
 -->  

</header>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
  
<style>


#sidebar_nav {
  position: absolute;
  width: 200px;
  /* left: 0;
  top: 0;
  bottom: 0; */
  background-color: none;
  transform: translate(-200px, 0);
  transition: transform 0.3s linear;
}
#sidebar_nav.active {
  transform: translate(0, 0);
}

#slidebutton {
  position: absolute;
  top: 0;
  right: 0;
  border: 0;
  width: 50px;
  height: 50px;
  background-color: white;
  transform: translate(40px, 0);
  transition: transform 0.125s linear 0.375s;
}
button:focus, button:active, button:hover {
  outline: 0;
}
/* button:hover {
  background-color: #4B6280;
} */

 button:before, button:after {
  display: block;
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  width: 30px;
  height: 10px;
  border-radius: 2px;
  background-color: #F6D155;
  
  transition: all 0.125s linear 0.5s;
} 
 button:before {
  transform: translate(10px, 10px) rotate(0);
}
button:after {
  transform: translate(10px, 30px) rotate(0);
}

.active button {
  transform: translate(0, 0);
  transition: all 0.125s linear;
}
.active button:before, .active button:after {
  width: 40px;
  transition: all 0.375s linear 0.125s;
}
.active button:before {
  transform: translate(5px, 20px) rotate(45deg);
}
.active button:after {
  transform: translate(5px, 20px) rotate(45deg);
}

/* a {
  display: block;
  padding: 3px;
  color: #fff;
  text-decoration: none;
  transition: all 0.0625s linear;
} */

/* a:hover, h4 a:hover{
  background-color: #4B6280;
  text-decoration: none;
} */

 h4{
  display: block;
  padding: 10px;
  color: #black;
  text-decoration: none;
  transition: all 0.0625s linear;
  margin: 0 0 0 30px;
  font-weight: bold;
} 

#sideul {
  margin: 0 auto;
  padding: 0;
}
#sideul li {
  list-style-type: none;
  text-decoration: none;
}
#sideul li:nth-child(6) a:hover {
  text-decoration: none;
  background-color: rgba(128, 0, 0, 0.7);
} 

</style>
  
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

  <nav role='navigation' id="sidebar_nav">
 <!--  <span style="margin-top: 50px; color:#fff; font-size: 8pt; font-weight: bold;">login/logout</span> -->
     <div id="accordion">
     
     <a href="#"><h4 style="margin-top: 50px;">내 정보</h4></a>
     <div>
           <a href="#"><ol>메뉴1</ol></a>
          <a href="#"><ol>메뉴2</ol></a>
          <a href="#"><ol>메뉴3</ol></a>
   </div>
   <a href="#"><h4>내 뱅킹</h4></a>
   <div>
           <a href="#"><ol>메뉴1</ol></a>
          <a href="#"><ol>메뉴2</ol></a>
          <a href="#"><ol>메뉴3</ol></a>
   </div>
   <a href="#"><h4>내 그룹</h4></a>
   <div>
           <a href="#"><ol>메뉴1</ol></a>
          <a href="#"><ol>메뉴2</ol></a>
          <a href="#"><ol>메뉴3</ol></a>
   </div>
   </div>
   <ul id="sideul">
   <li><a href="#"><h4>메세지</h4></a></li>
   
   <li><a href="#"><h4>Profile</h4></a></li>

   <li><a href="#"><h4>Logout</h4></a></li>
   </ul>
   
    <!-- <li><a href="#">내 정보</a></li>
    <li><a href="#">내 뱅킹</a></li> -->
    
    <!-- <li><a href="#">내 그룹</a></li>
    <li><a href="#">메세지</a></li>
    <li><a href="#">Profile</a></li>
    <li><a href="#">Logout</a></li> -->
 
  
  <button class="menu" id="slidebutton"></button>
  
  
</nav>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script type="text/javascript">
     function sidebar() {
         $("#sidebar_nav").toggleClass("active");
       }

       $("button").on("click", sidebar);
    </script>
    
    
   <!--  <script src="jquery/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
         $("#accordion").accordion();
      });
    </script>
   
   
   
   
   
   

    

    