<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
@font-face {
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/decade.ttf");
  font-family: Decade;
}
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  height: 100%;
  overflow: hidden;
  background: #000;
}
@media (max-width: 767px) {
  html, body {
    font-size: 80%;
  }
}
@media (max-width: 640px) {
  html, body {
    font-size: 60%;
  }
}
@media (max-width: 480px) {
  html, body {
    font-size: 40%;
  }
}

.inner, .nav-panel ul .nav-btn:after {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
}

.scene {
  width: 100%;
  height: 100%;
}

.page {
  z-index: 1;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  -webkit-transition: opacity .7s, z-index .7s, -webkit-transform .7s;
  transition: opacity .7s, z-index .7s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index .7s;
  transition: transform .7s, opacity .7s, z-index .7s, -webkit-transform .7s;
  will-change: transform, opacity;
}
.page:nth-child(1) .left {
  background-image: url("resources/images/wsgdb/bank2.jpg");
    
}
.page:nth-child(1) .right {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-2.jpg");
}
.page:nth-child(2) .left {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-3.jpg");
}
.page:nth-child(2) .right {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-4.jpg");
}
.page:nth-child(3) .left {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-5.jpg");
}
.page:nth-child(3) .right {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-6.jpg");
}
.page:nth-child(4) .left {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-7.jpg");
}
.page:nth-child(4) .right {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-8.jpg");
}
.page.active {
  z-index: 5;
  -webkit-transition: opacity .7s, z-index 0s .7s, -webkit-transform .7s;
  transition: opacity .7s, z-index 0s .7s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index 0s .7s;
  transition: transform .7s, opacity .7s, z-index 0s .7s, -webkit-transform .7s;
}
.page.active .half {
  -webkit-transform: translateX(0) !important;
          transform: translateX(0) !important;
  -webkit-transition: -webkit-transform .7s ease-out;
  transition: -webkit-transform .7s ease-out;
  transition: transform .7s ease-out;
  transition: transform .7s ease-out, -webkit-transform .7s ease-out;
}
.page.previous {
  opacity: 0.4 !important;
  visibility: visible !important;
  -webkit-transition: opacity .7s, z-index 0s, -webkit-transform .7s;
  transition: opacity .7s, z-index 0s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index 0s;
  transition: transform .7s, opacity .7s, z-index 0s, -webkit-transform .7s;
}
.page.small {
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  opacity: 0;
}
.page.small .half {
  -webkit-transform: translateX(0) !important;
          transform: translateX(0) !important;
}
.page:nth-child(2) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(2) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(3) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(3) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(4) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(4) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(5) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(5) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(6) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(6) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(7) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(7) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(8) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(8) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(9) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(9) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.page:nth-child(10) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(10) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}

.half {
  position: absolute;
  top: 0;
  width: 50%;
  height: 100%;
  background-size: cover;
  -webkit-transition: -webkit-transform .7s ease-in;
  transition: -webkit-transform .7s ease-in;
  transition: transform .7s ease-in;
  transition: transform .7s ease-in, -webkit-transform .7s ease-in;
  will-change: transform;
}
.half.left {
  left: 0;
}
.half.right {
  left: 50%;
}
.half.withText:after {
  content: "";
  position: absolute;
  display: block;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 10;
}

.heading {
  position: absolute;
  z-index: 500;
  top: 50%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  width: 100%;
  height: 100%;
  font-size: 3.5rem;
  color: #fff;
  font-family: 나눔고딕;
}

.heading1 {
  position: absolute;
  z-index: 500;
  top: 50%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  width: 100%;
  height: 100%;
  font-size: 2rem;
  color: #fff;
  font-family: 나눔고딕;
}

.nav-panel {
  position: fixed;
  top: 50%;
  right: 2%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  z-index: 1000;
  -webkit-transition: opacity 0.5s, -webkit-transform 0.5s cubic-bezier(0.57, 1.2, 0.68, 2.6);
  transition: opacity 0.5s, -webkit-transform 0.5s cubic-bezier(0.57, 1.2, 0.68, 2.6);
  transition: opacity 0.5s, transform 0.5s cubic-bezier(0.57, 1.2, 0.68, 2.6);
  transition: opacity 0.5s, transform 0.5s cubic-bezier(0.57, 1.2, 0.68, 2.6), -webkit-transform 0.5s cubic-bezier(0.57, 1.2, 0.68, 2.6);
  will-change: transform, opacity;
}
.nav-panel.invisible {
  opacity: 0;
  -webkit-transform: translateY(-50%) scale(0.5);
          transform: translateY(-50%) scale(0.5);
}
.nav-panel ul {
  list-style-type: none;
}
.nav-panel ul .nav-btn {
  position: relative;
  overflow: hidden;
  width: 1rem;
  height: 1rem;
  margin-bottom: 0.5rem;
  border: 0.12rem solid #fff;
  border-radius: 50%;
  cursor: pointer;
  -webkit-transition: border-color, -webkit-transform 0.3s;
  transition: border-color, -webkit-transform 0.3s;
  transition: border-color, transform 0.3s;
  transition: border-color, transform 0.3s, -webkit-transform 0.3s;
  will-change: border-color, transform;
}
.nav-panel ul .nav-btn:after {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%) scale(0.3);
          transform: translateX(-50%) translateY(-50%) scale(0.3);
  background-color: #fff;
  opacity: 0;
  -webkit-transition: opacity 0.3s, -webkit-transform;
  transition: opacity 0.3s, -webkit-transform;
  transition: transform, opacity 0.3s;
  transition: transform, opacity 0.3s, -webkit-transform;
  will-change: transform, opacity;
}
.nav-panel ul .nav-btn.active:after, .nav-panel ul .nav-btn:hover:after {
  -webkit-transform: translateX(-50%) translateY(-50%) scale(0.7);
          transform: translateX(-50%) translateY(-50%) scale(0.7);
  opacity: 1;
}
.nav-panel ul .nav-btn:hover {
  border-color: yellow;
  -webkit-transform: scale(1.2);
          transform: scale(1.2);
}
.nav-panel ul .nav-btn:hover:after {
  background-color: yellow;
}
.nav-panel .scroll-btn {
  position: absolute;
  left: 0;
  width: 1rem;
  height: 1rem;
  border: 0.2rem solid #fff;
  border-left: none;
  border-bottom: none;
  cursor: pointer;
  -webkit-transform-origin: 50% 50%;
          transform-origin: 50% 50%;
  -webkit-transition: border-color 0.3s;
  transition: border-color 0.3s;
}
.nav-panel .scroll-btn.up {
  top: -1.6rem;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
}
.nav-panel .scroll-btn.down {
  bottom: -1.2rem;
  -webkit-transform: rotate(135deg);
          transform: rotate(135deg);
}
.nav-panel .scroll-btn:hover {
  border-color: yellow;
}

.check-out {
  z-index: 1000;
  position: absolute;
  bottom: 1rem;
  left: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Decade;
  font-size: 1rem;
  text-transform: uppercase;
}
.check-out a {
  color: #ffaaaa;
  text-decoration: none;
  border-bottom: 0.2rem solid;
}


</style>
<script>
$(document).ready(function() {
	  
	  var pages = $(".page").length,
	      scrolling = false,
	      curPage = 1;
	  
	  function pagination(page, movingUp) {
	    scrolling = true;
	    var diff = curPage - page,
	        oldPage = curPage;
	    curPage = page;
	    $(".page").removeClass("active small previous");
	    $(".page-" + page).addClass("active");
	    $(".nav-btn").removeClass("active");
	    $(".nav-page" + page).addClass("active");
	    if (page > 1) {
	      $(".page-" + (page - 1)).addClass("previous");
	      if (movingUp) {
	        $(".page-" + (page - 1)).hide();
	        var hackPage = page;
	        setTimeout(function() {
	          $(".page-" + (hackPage - 1)).show();
	        }, 600);
	      }
	      while (--page) {
	        $(".page-" + page).addClass("small");
	      }
	    }
	    console.log(diff)
	    if (diff > 1) {
	      for (var j = page + 1; j < oldPage; j++) {
	        $(".page-" + j + " .half").css("transition", "transform .7s ease-out");
	      }
	    }
	    setTimeout(function() {
	      scrolling = false;
	      $(".page .half").attr("style", "");
	      $(".page")
	    }, 700);
	  }
	  
	  function navigateUp() {
	    if (curPage > 1) {
	      curPage--;
	      pagination(curPage, true);
	    }
	  }

	  function navigateDown() {
	    if (curPage < pages) {
	      curPage++;
	      pagination(curPage);
	    }
	  }
	  
	  $(document).on("mousewheel DOMMouseScroll", function(e) {
	    if (!scrolling) {
	      if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
	        navigateUp();
	      } else { 
	        navigateDown();
	      }
	    }
	  });
	  
	  $(document).on("click", ".scroll-btn", function() {
	    if (scrolling) return;
	    if ($(this).hasClass("up")) {
	      navigateUp();
	    } else {
	      navigateDown();
	    }
	  });
	  
	  $(document).on("keydown", function(e) {
	    if (scrolling) return;
	    if (e.which === 38) {
	      navigateUp();
	    } else if (e.which === 40) {
	      navigateDown();
	    }
	  });
	  
	  $(document).on("click", ".nav-btn:not(.active)", function() {
	    if (scrolling) return;
	    pagination(+$(this).attr("data-target"));
	  });

	});

</script>
</head>



<body>
  <div class="scene">
  <div class="page page-1 active">
    <div class="half left with text">
      <h2 class="heading"># 계좌등록하기<BR></h2>
      <h2 class="heading1">
      					쉽고 간단한 계좌 등록하세요.<br>
	 
계좌 구매내역을 통한 핀테크 관리와 

소셜네트워크 시스템을 동시에 누릴 수
 
있습니다. </h2>
      				
    </div>
    <div class="half right withText">
      <h2 class="heading">Page 1</h2>
    </div>
  </div>
  <div class="page page-2">
    <div class="half left withText">
      <h2 class="heading">Page 2</h2>
    </div>
    <div class="half right"></div>
  </div>
  <div class="page page-3">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Page 3</h2>
    </div>
  </div>
  <div class="page page-4">
    <div class="half left withText">
      <h2 class="heading">Page 4</h2>
      <p class="check-out">Check out my other <a href="https://codepen.io/suez/public/" target="_blank">pens</a></p>
    </div>
    <div class="half right"></div>
  </div>
</div>
<div class="nav-panel">
  <div class="scroll-btn up"></div>
  <div class="scroll-btn down"></div>
  <nav>
    <ul>
      <li data-target="1" class="nav-btn nav-page1 active"></li>
      <li data-target="2" class="nav-btn nav-page2"></li>
      <li data-target="3" class="nav-btn nav-page3"></li>
      <li data-target="4" class="nav-btn nav-page4"></li>
    </ul>
  </nav>
</div>
  <!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->

   

</body>


</html>