<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ddung/shy_top.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/sweetalert2/latest/sweetalert2.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.css"
	rel="stylesheet" />
<%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css"> --%>


<style> /*DROPDOWN 스타일  */
.dropbtn {
	background-color: WHITE;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content {

	-webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;  
    box-sizing: border-box; 
}

</style>


<script>
	/* 글쓰기 펑션  */

	function shynow() {

		swal(
				{
					html : '<div style="text-align: left;">'
							+ '<form name="shynowform" enctype="multipart/form-data">'
							+ '<span style="font-size:16pt; color:navy; "><c:if test="${loginuser.name!=null}">${loginuser.name}</c:if>'
							+ '<c:if test="${loginuser.name==null}">${loginuser.email}</c:if></span>  님의 샤이 기록하기&nbsp;&nbsp;'
							+ '<select name="status" id="status"> <option value="1">전체 공개</option>'
							+ '<option value="2">친구 공개</option>'
							+ '<option value="0">나만 보기</option>'
							+ '</select>'
							+ '<input type="hidden" name="userseq" value="${loginuser.idx}"/>'
							+ '<textarea id="content" name="content" class="swal2-textarea" placeholder=""></textarea>'
							+ '<span style="font-size:10pt;">누구와 함께 계신가요? &nbsp;&nbsp;</span>'
							+ '<input id="ftag" name="ftag" placeholder=""/><br><br>'
							+ '<span style="font-size:10pt;">어디에 계신가요? &nbsp; &nbsp;</span>'
							+ '<input id="shyplace" name="shyplace" placeholder="배고파덕"/>'
							+ '<br><br><input type="file" id="uploader" name="image" />'
							+ '</form></div>',
					width : '640px',
					showCloseButton : true,
					allowOutsideClick : false

				}).then(function(content) {
			if (content) {
				/*formData 추가?  */
				document.shynowform.method = "post";
				document.shynowform.action = "shynow.shy";
				document.shynowform.submit();

			}
		})

	}; // shynow END

	$(window).scroll(function() {
		if ($(this).scrollTop() > 50) {
			$('.scrolltop:hidden').stop(true, true).fadeIn();
		} else {
			$('.scrolltop').stop(true, true).fadeOut();
		}
	});
	$(function() {
		$(".scroll").click(function() {
			$("html,body").animate({
				scrollTop : $(".thetop").offset().top
			}, "1000");
			return false
		})
	})
</script>
<script type="text/javascript">      
     // 알람 Ajax 불러오기
     
  /*   $.ajax({
         url: "/shy/myAlram.shy",
         type: "GET",
         dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
          data: { // 파라미터     
         }, 
         success: function(data) { // 성공했을 때의 처리 콜백함수
             $("#ajaxresult").append("success<br />");
       
             if(data.leght==0){
            	 $("#ajaxresult").append("알림이 없습니다.");
             }else{
            	  $.each(data,function(entryIndex,entry){
            	  
            	  
            	  
            	  
            	  }
             }   
         },
         complete: function() { // ajax 전송이 완료 됐을 때의 콜백함수
             //stopLoading();  로딩 멈추기
       
             $("#ajaxresult").append("complete<br />");
         },
         error: function() { // 에러가 발생했을 때의 콜백함수
             $("#ajaxresult").append("error<br />");
         }
     }); */
     </script> 


<style>
#status {
	font-size: 10pt;
	border-left: hidden;
	border-right: hidden;
	border-top: hidden;
	border-bottom: hidden;
}

#ftag, #shyplace {
	border-left: hidden;
	border-right: hidden;
	border-top: hidden;
}

#shy {
	font-family: 'Lato', sans-serif;
}

.letter {
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

.letter:before, .letter:after {
	position: absolute;
	content: attr(data-letter);
	transform-origin: top left;
	top: 0;
	left: 0;
}

.letter, .letter:before, .letter:after {
	transition: all 0.3s ease-in-out;
}

.letter:before {
	color: #fff;
	text-shadow: -1px 0px 1px rgba(255, 255, 255, .8), 1px 0px 1px
		rgba(0, 0, 0, .8);
	z-index: 3;
	transform: rotateX(0deg) rotateY(-15deg) rotateZ(0deg);
}

.letter:after {
	color: rgba(0, 0, 0, .11);
	z-index: 2;
	transform: scale(1.08, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg)
		skew(0deg, 1deg);
}

.letter:hover:before {
	color: #fafafa;
	transform: rotateX(0deg) rotateY(-40deg) rotateZ(0deg);
}

.letter:hover:after {
	transform: scale(1.08, 1) rotateX(0deg) rotateY(40deg) rotateZ(0deg)
		skew(0deg, 22deg);
}

.shy_topnavbar a:hover {
	background-color: #fff;
}

.scrolltop {
	display: none;
	width: 100%;
	margin: 0 auto;
	position: fixed;
	bottom: 20px;
	right: 10px;
}

.scroll {
	position: absolute;
	right: 20px;
	bottom: 20px;
	background: #b2b2b2;
	background: rgba(178, 178, 178, 0.7);
	padding: 20px;
	text-align: center;
	margin: 0 0 0 0;
	cursor: pointer;
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
}

.scroll:hover {
	background: rgba(178, 178, 178, 1.0);
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
}

.scroll:hover .fa {
	padding-top: -10px;
}

.scroll .fa {
	font-size: 30px;
	margin-top: -5px;
	margin-left: 1px;
	transition: 0.5s;
	-moz-transition: 0.5s;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
}

.header-menu-number {
	/* position: absolute; */
	line-height: 22px;
	padding: 0 6px;
	font-weight: 700;
	background: #eee;
	border-radius: 100%;
	top: 15px;
	right: 2px;
	-webkit-transition: all .3s linear;
	transition: all .3s linear;
}

.header-menu-number:hover {
	text-decoration: none;
	-webkit-transform: rotate(360deg);
	transform: rotate(360deg);
}
</style>

<script type="text/javascript">
	/* 
	 $(document).ready(function(){
	
	 searchKeep();
	
	 //	===== #147. Ajax 로 검색어 입력시 자동글 완성하기 2 =====
	 $("#displayList").hide();

	 $("#search").keyup(function(){
	
	 var form_data = { colname : $("#colname").val(),  // 키값 : 밸류값 
	 search  : $("#search").val()    // 키값 : 밸류값 
	 };
	
	 $.ajax({
	 url: "/shy/wordSearchShow.shy",
	 type: "GET",
	 data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
	 dataType: "JSON", 
	 success: function(data){
	
	 // ===== #152. Ajax 로 검색어 입력시 자동글 완성하기 7 ===== 
	 if(data.length > 0) {
	 // 검색된 데이터가 있는 경우.
	 // 조심할것은 if(data != null) 으로 하면 안된다.
	 var resultHTML = "";
	
	 $.each(data, function(entryIndex, entry){
	 var wordstr = entry.RESULTDATA.trim();
	 // 검색어 - 영주                    aj
	 // 결과물 - 김영주 프로그래머     AJAX
	 //         김영주바둑기사        ajax 프로그래밍
	 //         영주사과
	
	 var index = wordstr.toLowerCase().indexOf( $("#search").val().toLowerCase() ); 
	 var len = $("#search").val().length;
	 var result = "";
	
	 result = "<span class='first' style='color: black;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color: red; font-weight: bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color: blue;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";        
	
	 resultHTML += "<span style='cursor: pointer;'>" + result + "</span><br/>"; 	   
	 });
	
	 $("#displayList").html(resultHTML);
	 $("#displayList").show();
	 }
	 else {
	 // 검색된 데이터가 없는 경우.
	 // 조심할것은 if(data == null) 으로 하면 안된다.
	 $("#displayList").hide();
	 }
	
	 },
	 error: function(){
	 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	 }
	 });
	
	 }); // end of keyup(function(){})---------
	
	
	 // ===== #153. Ajax 로 검색어 입력시 자동글 완성하기 8 ===== 
	 $("#displayList").click(function(event){
	 var word = "";
	
	 var $target = $(event.target);
	
	 if($target.is(".first")) {
	 word = $target.text() + $target.next().text() + $target.next().next().text();
	 //	alert(word);
	 }
	 else if($target.is(".second")) {
	 word = $target.prev().text() + $target.text() + $target.next().text();
	 //	alert(word);
	 }
	 else if($target.is(".third")) {
	 word = $target.prev().prev().text() + $target.prev().text() + $target.text();
	 //	alert(word);
	 }
	
	 $("#search").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
	
	 $("#displayList").hide();
	
	 });// end of $("#displayList").click()---------	
	
	
	
	 });// end of $(document).ready()----------------------
	
	
	 */

	function goSearch() {

		var searchFrm = document.searchFrm;

		var search = $("#search").val();

		if (search.trim() == "") {
			alert("검색어를 입력하세요!!");
		} else {
			searchFrm.action = "/shy/searchlist.shy";
			searchFrm.method = "GET";
			searchFrm.submit();
		}

	}

	function searchKeep() {
		<c:if test="${not empty search}">
		/* $("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다. */
		$("#search").val("${search}"); // 검색어를 유지시켜 주겠다.
		</c:if>
	}
</script>





</head>

<!-- <body id="page-top"> -->
<header id="page-top">


	<nav class="shy_topnavbar shy_topnavbar-fixed-top "
		style="background-color: white;">
		<div class="shy_top_container-fluid">
			<div class="shy_topnavbar-header">
				<a class="shy_topnavbar-brand" href="<%=request.getContextPath() %>/mainline.shy"> <span class="letter"
					id="shy" data-letter="s">s</span> <span class="letter" id="shy"
					data-letter="h">h</span> <span class="letter" id="shy"
					data-letter="y">y</span>
				</a>
				<c:if test="${loginuser!=null }">

					<c:if test="${loginuser.name!=null }">
						<span class="shy_topnavbar-brand">&nbsp;&nbsp;&nbsp;&nbsp;<kbd>${loginuser.name }</kbd>님
							안녕하세요
						</span>
						<a class="header-menu-number" href="#"><!-- 알림카운트 --></a><div id="ajaxresult"></div>
					</c:if>

					<c:if test="${loginuser.name==null }">
						<span class="shy_topnavbar-brand">&nbsp;&nbsp;&nbsp;&nbsp;<kbd>${loginuser.email }</kbd>님
							안녕하세요
						</span>
						<div id="ajaxresult"></div>
					</c:if>

				</c:if>
			</div>
			<ul class="shy_topnav shy_topnavbar-shy_topnav shy_topnavbar-right">
			<li><a href="javascript:shynow();"><i
						class="fa fa-pencil fa-2x" aria-hidden="true" style="color: red;"></i></a></li>
				
				<li>
				<div class="dropdown">
					<button class="dropbtn"><i class="fa fa-street-view fa-2x"
							aria-hidden="true" style="color: #98DDDE;"></i></button>
							<div class="dropdown-content">
								<a href="<%=request.getContextPath() %>/mypage.shy">my shy</a> 
								<a href="<%=request.getContextPath() %>/myInfoEdit.shy">정보수정</a> 
								<a href="#">Link3</a>
							</div>
				</div>
				</li>
				
				
				<li>
				
				<div class="dropdown">
						<button class="dropbtn"><i class="fa fa-heartbeat fa-2x"
						aria-hidden="true" style="color: #F7786B;"></i></button>
						<div class="dropdown-content">
							<a href="#">팔로워</a> 
							<a href="<%=request.getContextPath() %>/mygroups.shy">그룹</a> 
							<a href="#">Link3</a>
						</div>
					</div>
				
				</li>
				
				<li>
				<div class="dropdown">
					<button class="dropbtn"><i class="fa fa-bolt fa-2x"
						aria-hidden="true" style="color: #FAE03C;"></i></button>
							<div class="dropdown-content">
								<a href="#">Link 1111111</a> <a href="#">Link 2</a> <a href="#">Link
									3</a>
							</div>
				</div>
				</li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-credit-card fa-2x"
						aria-hidden="true" style="color: #F2552C;"></i> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </li>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-map-marker fa-2x"
						aria-hidden="true" style="color: #B76BA3;"></i> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </li>
          </ul>

			<!-- <ul class="shy_topnav shy_topnavbar-shy_topnav shy_topnavbar-right">
				
				
				<li>
				<div class="dropdown">
					<button class="dropbtn"><i class="fa fa-credit-card fa-2x"
						aria-hidden="true" style="color: #F2552C;"></i></button>
							<div class="dropdown-content">
								<a href="#">Link 1111111</a> <a href="#">Link 2</a> <a href="#">Link
									3</a>
							</div>
				</div>
				</li>
				
				<li>
				<div class="dropdown">
					<button class="dropbtn"><i class="fa fa-map-marker fa-2x"
						aria-hidden="true" style="color: #B76BA3;"></i></button>
							<div class="dropdown-content">
								<a href="#">Link 1111111</a> <a href="#">Link 2</a> <a href="#">Link
									3</a>
							</div>
				</div>
				</li>
				
				
				<ul class="dropdown-menu">
      <li> 내 샤이 위치 보기 </li>
      <li> 친구 샤이 위치 보기 </li>
      </ul>
				<li></li>

			</ul> -->


			<!-- ===== #103. 글검색 폼 추가하기 : 제목, 내용, 글쓴이로 검색하도록 한다. ===== -->
			<form name="searchFrm" style="margin-top: 20px;">



				<input type="text" name="search" id="search" size="20px"
					style="border-radius: 10px; height: 30px;" />
				<button type="button" class="btn btn-primary" onClick="goSearch();"
					style="width: 60px; height: 30px;">검색</button>
			</form>

	
    
    



		</div>


	</nav>

</header>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->

<div class='thetop'></div>
<div style="width: 0; height: 0;" id="noexists"></div>




<div class='scrolltop'>
	<div class='scroll icon'>
		<i class="fa fa-4x fa-angle-up"></i>
	</div>
</div>
