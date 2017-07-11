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
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/heartlogo.png");
}
.page:nth-child(1) .right {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/eat.jpg");
}
.page:nth-child(2) .left {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/payment-2.jpg");
}
.page:nth-child(2) .right {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/account.jpg");
}
.page:nth-child(3)  .left  {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/playing.jpg");
}
.page:nth-child(3) .right {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/search-2.png");
}
.page:nth-child(4) .left {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/partner-1.jpg");
}
.page:nth-child(4) .right {
  background-image: url("<%=request.getContextPath() %>/resources/images/wsgdb/ipp.jpg");
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
.page:nth-child(1) .left {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.page:nth-child(1) .right {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
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
  top: 40%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  font-size: 8rem;
  color: #fff;
  font-family: 배달의민족 연성;
}
.heading-1 {
  position: absolute;
  z-index: 500;
  top: 60%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  font-size: 4rem;
  color: #fff;
  font-family: 배달의민족 연성;
}

.heading-2 {
    position: absolute;
    z-index: 500;
    top: 70%;
    left: 50%;
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
    font-size: 1.8rem;
    color: #fff;
    font-family: 배달의민족 연성;
	
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
    <div class="half left withText">
     	<a href="http://localhost:9090/shy/mainline.shy" target="blank"> <h2 class="heading"> # shy?</h2> </a>
		<a href="http://localhost:9090/shy/mainline.shy" target="blank">네이버로이동

<h2 class="heading-1">더치페이를 손쉽게,<br> 스마트 소셜  송금 서비스 </h2></a>




<!-- register_btn  btnRegistration -->

 
    </div>
    <div class="half right withText">
      <a href="http://localhost:9090/shy/mainline.shy" target="blank"> <h2 class="heading"># Why shy?	</h2></a>
    <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading-1">먹고, 사랑하고, 샤이
    <br> EAT, LOVE, 	SHY</h2></a>
    </div>
  </div>
  <div class="page page-2 ">
    <div class="half left withText">
    <a href="http://localhost:9090/shy/banking.shy" target="blank"><h2 class="heading"># Payment	</h2></a>
   <a href="http://localhost:9090/shy/banking.shy" target="blank"> <h2 class="heading-1">귀찮아서, 복잡해서 보낼 때를 놓쳤던 송금.<br>
이젠 간단하게 shy로 쉽게 송금하세요!<br>
</h2></a>
    </div>
    <div class="half right withText">
     <a href="http://localhost:9090/shy/auth.shy" target="blank"><h2 class="heading"># 계좌 등록	</h2></a>
    <a href="http://localhost:9090/shy/auth.shy" target="blank"><h2 class="heading-1">계좌등록 쉽게 하세요.<br>

</h2></a>
    </div>
  </div>
  <div class="page page-3">
    <div class="half left"></div>
    <div class="half left withText">
      <a href="http://localhost:9090/shy/mygroups.shy" target="blank"><h2 class="heading"># Connect with people</h2></a>
       <h2 class="heading-1">친구와 함께하는 시간을 기억하세요.<br> 저녁 식사, 생일파티,아니면 안부<br>
    </div>
     <div class="half right withText">
      <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading"># Search for friends</h2></a>
          <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading-1">shy 검색을 사용하여 지인들을 찾아보세요.<br>
          </h2></a>
    </div>
  </div>
  <div class="page page-4">
    <div class="half left withText">
     <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading"># business	</h2></a>
   <a href="http://localhost:9090/shy/mainline.shy" target="blank"> <h2 class="heading-1">많은 업체들과 공식적으로 제휴하여 서비스를 제공하고 있습니다.
   	<br>shy와 함께하세요. 
    </h2></a>
    </div>
    <div class="half right withText">
    <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading"># shy Mobile	</h2></a>
    <a href="http://localhost:9090/shy/mainline.shy" target="blank"><h2 class="heading-1">이제 shy를 Mobile로 만나세요</h2></a>
    
    </div>

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
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>
	
</body>



</html>