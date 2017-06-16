<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:500);

body {
  font-family: Raleway, helvetica, arial, sans-serif;
}

#shyside {
  position: fixed;
  width: 200px;
  left: 0;
  top: 0;
  margin-top:80px;
  
  /* bottom: 0; */
  background-color: none;
  transform: translate(-200px, 0);
  transition: transform 0.5s linear;
}
#shyside.active {
  transform: translate(0, 0);
}
#shyside a,sidebar_nav a:hover{
  text-decoration: none;
}

#shy_sidebtn {
  position: absolute;
  top: 0;
  margin-top: 50px;
  right: 0;
  border: 0;
  width: 50px;
  height: 50px;
  background-color: #F7CAC9;
  transform: translate(50px, 0);
  transition: transform 0.125s linear 0.375s;
}
#shy_sidebtn:focus, #shy_sidebtn:active, #shy_sidebtn:hover {
  outline: 0;
}
#shy_sidebtn:hover {
  background-color: #F7CAC9;
}
#shy_sidebtn:before, #shy_sidebtn:after {
  display: block;
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 30px;
  height: 10px;
  border-radius: 2px;
  background-color: white;
  transition: all 0.125s linear 0.5s;
}
#shy_sidebtn:before {
  transform: translate(10px, 10px) rotate(0);
}
#shy_sidebtn:after {
  transform: translate(10px, 30px) rotate(0);
}

.active #shy_sidebtn {
  transform: translate(0, 0);
  transition: all 0.125s linear;
}
.active #shy_sidebtn:before, .active #shy_sidebtn:after {
  width: 40px;
  transition: all 0.375s linear 0.125s;
}
.active #shy_sidebtn:before {
  transform: translate(5px, 20px) rotate(45deg);
}
.active #shy_sidebtn:after {
  transform: translate(5px, 20px) rotate(-45deg);
}

.a_shyside #a_shyside {
  display: block;
  padding: 3px;
  color: black;
  transition: all 0.0625s linear;
  font-size: 12px;
  text-align: center;
}

#a_shyside:hover, h4 #a_shyside:hover{
  background-color: none;
  text-decoration: none;
}

#shyside_li{
  display: block;
  padding: 10px;
  color: black;
  text-decoration: none;
  margin: 0 0 0 30px;
  font-weight: bold;
  font-size : 14px;
}

.shyside_ul {
  margin: 0 auto;
  padding: 0;
  text-decoration: none;
}
.shyside_ul li {
  list-style-type: none;
}

#accordion {
	text-decoration: none;
}

</style>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

  <nav role='sidebar_navigation' id="shyside">
 <!--  <span style="margin-top: 50px; color:#fff; font-size: 8pt; font-weight: bold;">login/logout</span> -->
     <div id="accordion">
     <h4 class="a_shyside shyside_li"  style="margin-top: 50px;">내 정보</h4>
     <div>
          <a class="a_shyside" href="#">메뉴1</a><br>
          <a class="a_shyside" href="#">메뉴2</a><br>
          <a class="a_shyside" href="#">메뉴3</a><br>
   </div>
   <h4><a class="a_shyside shyside_li" href="#">내 뱅킹</a></h4>
   <div>
          <a class="a_shyside" href="#">메뉴1</a><br>
          <a class="a_shyside" href="#">메뉴2</a><br>
          <a class="a_shyside" href="#">메뉴3</a><br>
   </div>
   <h4><a class="a_shyside shyside_li" href="#" >내 그룹</a></h4>
   <div>
          <a class="a_shyside" href="#">메뉴1</a><br>
          <a class="a_shyside" href="#">메뉴2</a><br>
          <a class="a_shyside" href="#">메뉴3</a><br>
   </div>
   </div>
   <ul class="shyside_ul">
   <h4><li class="shyside_li"><a id="a_shyside" href="#">메세지</a></li></h4>
   
   <h4><li class="shyside_li"><a id="a_shyside" href="#">프로필</a></li></h4>

   <h4><li class="shyside_li"><a id="a_shyside" href="#">로그아웃</a></li></h4>
   </ul>
   
    <!-- <li><a id="a_shyside" href="#">내 정보</a></li>
    <li><a id="a_shyside" href="#">내 뱅킹</a></li> -->
    
    <!-- <li><a id="a_shyside" href="#">내 그룹</a></li>
    <li><a id="a_shyside" href="#">메세지</a></li>
    <li><a id="a_shyside" href="#">Profile</a></li>
    <li><a id="a_shyside" href="#">Logout</a></li> -->
 
  
  <button class="menu" id="shy_sidebtn"></button>
</nav>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script type="text/javascript">
     function sidebar() {
         $("#shyside").toggleClass("active");
       }

       $("button").on("click", sidebar);
    </script>
    
    
   <!--  <script src="jquery/jquery.js"></script> -->
    <script src="<%=request.getContextPath() %>/resources/js/pa/jquery-ui.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
         $("#accordion").accordion();
      });
    </script>
   
   
   
   
   
   

    

 --%>