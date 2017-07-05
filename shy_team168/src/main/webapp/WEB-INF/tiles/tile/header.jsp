<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- google map 스크립트 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_sZM1PsNMiAuzi6F-aZRkDqqeOKTCA_Y&libraries=places&callback=initAutocomplete" async defer></script>
<script>
	// This example displays an address form, using the autocomplete feature
	// of the Google Places API to help users fill in the information.

	// This example requires the Places library. Include the libraries=places
	// parameter when you first load the API. For example:
	// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

	var placeSearch, autocomplete;
	var componentForm = {
		street_number : 'short_name',
		route : 'long_name',
		locality : 'long_name',
		administrative_area_level_1 : 'short_name',
		country : 'long_name',
		postal_code : 'short_name'
	};

	function initAutocomplete() {
		// Create the autocomplete object, restricting the search to geographical
		// location types.
		autocomplete = new google.maps.places.Autocomplete(
		/** @type {!HTMLInputElement} */
		(document.getElementById('autocomplete')));

		// When the user selects an address from the dropdown, populate the address
		// fields in the form.
		autocomplete.addListener('place_changed', fillInAddress);
	}

	function fillInAddress() {
		// Get the place details from the autocomplete object.
		var place = autocomplete.getPlace();
		document.getElementById('위도').value = place.geometry.location.lat();
		document.getElementById('경도').value = place.geometry.location.lng();
		for ( var component in componentForm) {
			document.getElementById(component).value = '';
			document.getElementById(component).disabled = false;
		}

		// Get each component of the address from the place details
		// and fill the corresponding field on the form.
		for (var i = 0; i < place.address_components.length; i++) {
			var addressType = place.address_components[i].types[0];
			if (componentForm[addressType]) {
				var val = place.address_components[i][componentForm[addressType]];
				document.getElementById(addressType).value = val;
			}
		}
	}

	// Bias the autocomplete object to the user's geographical location,
	// as supplied by the browser's 'navigator.geolocation' object.
	function geolocate() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var geolocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				var circle = new google.maps.Circle({
					center : geolocation,
					radius : position.coords.accuracy
				});
				autocomplete.setBounds(circle.getBounds());
			});
		}
	}
</script>
			

			






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


<style>

/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}

/* #locationField, #controls {
	position: relative;
	width: 480px;
} */
#ajaxresult{
   border: 1px solid gray;
   display: table;
    position: relative;
    margin-left: 100px;
    background: none;
}


</style>




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

.dd_button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


.dd_button5 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

</style>


<script>
	/* 글쓰기 펑션  */

	function shynow() {

		swal(
				{
					html : '<!DOCTYPE html><div style="text-align: left;">'
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
							+ ' <div id="locationField">'
							+ '<span style="font-size:10pt;">위치 추가하기 &nbsp; &nbsp;</span>'
							+ '<input type ="text" id="shyplace" name="shyplace" placeholder="장소를 추가합니다"></input>'
							+ '</div>'
							+ '<input  id="street_number" name ="street_number" type="hidden" disabled></input>'
							+ '<input  id="route" type="hidden"      disabled></input>'
							+ '<input  id="locality" type="hidden" disabled></input>'
							+ '<input  id="administrative_area_level_1"type="hidden" disabled></input>'
							+ '<input  id="postal_code" type="hidden" disabled></input>'
							+ '<input  id="country" type="hidden" disabled></input>'
							+ '<input id = "위도" type="hidden" type="text"/>'
							+ '<input id = "경도" type="hidden" type="text"/>'
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

	function new_shynow() {
		location.href = "#new_shynow";
	}

	function finishpic() {
		location.href = "#";
	}

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
	
	function new_shynow_enter(){
		
		document.shynowform.method = "post";
		document.shynowform.action = "shynow.shy";
		document.shynowform.submit();
	}
</script>


<style>
#status {
	font-size: 10pt;
	border-left: hidden;
	border-right: hidden;
	border-top: hidden;
	border-bottom: hidden;
}

#ftag, #autocomplete {
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
</style>

<style>
.white_content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.8);
	opacity: 0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none; 
}

.white_content:target {
	opacity: 1;
	pointer-events: auto;
	z-index: 750;
	
}

.white_content>div {
	margin-top: 10%;
	top: 25%;
	left: 40%;
	width: 30%;
	height: 70%;
	padding: 16px; 
	border: 2px solid #639EB0;
	border-radius : 20px; 
	background-color: white;
	overflow: auto;
	z-index: 751;
}
.pac-container {
    z-index: 9999 !important;
}

</style>

<script type="text/javascript">
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
		
					<a class="shy_topnavbar-brand"
					href="<%=request.getContextPath()%>/mainline.shy"> <span
					class="letter" id="shy" data-letter="s">s</span> <span
					class="letter" id="shy" data-letter="h">h</span> <span
					class="letter" id="shy" data-letter="y">y</span>
				</a>
				<c:if test="${loginuser!=null }">

					<c:if test="${loginuser.name!=null }">
                  <span class="shy_topnavbar-brand">&nbsp;&nbsp;&nbsp;&nbsp;<kbd>${loginuser.name }</kbd>님
                     안녕하세요
                  </span>
                  <a class="header-menu-number" onclick="Alramchk();"><span id="alarmcnt"></span></a><div id="ajaxresult"></div>
               </c:if>

               <c:if test="${loginuser.name==null }">
                  <span class="shy_topnavbar-brand">&nbsp;&nbsp;&nbsp;&nbsp;<kbd>${loginuser.email }</kbd>님
                     안녕하세요
                  </span>
                  <a class="header-menu-number" onclick="Alramchk();"><span id="alarmcnt"></span></a><div id="ajaxresult"></div>
               </c:if>

				</c:if>
				
				
				
			</div>
			
			<form name="searchFrm" style="  display: inline-block;  float: center; margin-top:10px;" class="shy_topnavbar">



				<input type="text" name="search" id="search" size="20px"
					style="border-radius: 10px; height: 30px;" class="" />
				&nbsp;<button type="button"  onClick="goSearch();" style="border: none; background-color: white; font-size: 12pt;" 
					><i class="fa fa-search" aria-hidden="true"></i></button>
			</form>
			
			<ul class="shy_topnav shy_topnavbar-shy_topnav shy_topnavbar-right">
				<li><a href="javascript:new_shynow();"><i
						class="fa fa-pencil fa-2x" aria-hidden="true" style="color: red;"></i></a></li>

				<li>
					<div class="dropdown">
						<button class="dropbtn">
							<i class="fa fa-street-view fa-2x" aria-hidden="true"
								style="color: #98DDDE;"></i>
						</button>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/mypage.shy">my shy</a> <a
								href="<%=request.getContextPath()%>/myInfoEdit.shy">정보수정</a> <a
								href="#">Link3</a>
						</div>
					</div>
				</li>


				<li>

					<div class="dropdown">
						<button class="dropbtn">
							<i class="fa fa-heartbeat fa-2x" aria-hidden="true"
								style="color: #F7786B;"></i>
						</button>
						<div class="dropdown-content">
							<a href="#">팔로워</a> <a
								href="<%=request.getContextPath()%>/mygroups.shy">그룹</a> <a
								href="#">Link3</a>
						</div>
					</div>

				</li>

				<li>
					<div class="dropdown">
						<button class="dropbtn">
							<i class="fa fa-bolt fa-2x" aria-hidden="true"
								style="color: #FAE03C;"></i>
						</button>
						<div class="dropdown-content">
							<a href="#">Link 1111111</a> <a href="#">Link 2</a> <a href="#">Link
								3</a>
						</div>
					</div>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-credit-card fa-2x"
						aria-hidden="true" style="color: #F2552C;"></i> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-map-marker fa-2x"
						aria-hidden="true" style="color: #B76BA3;"></i> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>

		
			
		<!-- 선택 모달창 -->
		<div class="white_content" id="new_shynow">
			<div align="center">
				<i class="fa fa-times-circle-o fa-2x" aria-hidden="true"style="float:right; color:grey; font-weight: lighter;" onclick="finishpic();" ></i>
			<c:if test="${loginuser.myimg != null}">
			<img src="<%=request.getContextPath() %>/resources/images/shydb/${loginuser.myimg }" style="float: center; width:96px; height:96px; border-radius: 50%; margin-top: 20px;" />
								<%-- <img class="avatar-32"
									src="<%=request.getContextPath() %>/resources/images/shydb/${shies.myimg }"
									alt="Avatar"> --%>
							</c:if>
				
			
							
				<div style="clear: both; width: 96%;">

					<form name="shynowform" enctype="multipart/form-data">
						<div align="left" style="width: 480px;">
							
							<br> <span style="font-size: 16pt; color: navy;"><c:if
									test="${loginuser.name!=null}">${loginuser.name}</c:if> <c:if
									test="${loginuser.name==null}">${loginuser.email}</c:if></span> 님의 샤이
							기록하기&nbsp;&nbsp; 
							<div style="float: right; display:inline-block; vertical-align: baseline; "  >
							<select name="status" id="status">
								<option value="1">전체 공개</option>
								<option value="2">친구 공개</option>
								<option value="0">나만 보기</option>
							</select>
							</div>
							</div>
						
						<input type="hidden" name="userseq" value="${loginuser.idx}" />
						<br>
							<textarea id="content" name="content" class="swal2-textarea"
								placeholder="일상을 공유하거나 구매 활동을 기록해 보세요." style="width: 480px; min-height: 170px;"></textarea>
						
						<br>
						<div style="margin-top: 5%; width:480px;" align="left">
						<div style="float: left; display: block;">
						<span style="font-size: 10pt;">누구와 함께 계신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
						<div style="float:right; display: inline;" >
						<input style="width: 250px;"
							id="ftag" name="ftag" placeholder="" />
							</div>
						</div><br><br>
						<div style="display: block;">
						<span style="font-size: 10pt;">장소를 선택해 보세요. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							 <input style="width: 250px;"
								type="text" onFocus="geolocate();" id="autocomplete"
								name="shyplace" ></input>
						</div>	
						<br>
						<input type="file" id="uploader" name="image" />	
					</div>
						
						<input id="street_number" name="street_number" type="hidden" 
							disabled></input> <input id="route" type="hidden" name="route"
							disabled></input> <input id="locality" type="hidden" name="locality"
							disabled></input> <input id="administrative_area_level_1" name="area1"
							type="hidden" disabled></input> <input id="postal_code" name="postal_code"
							type="hidden" disabled></input> <input id="country" name="country"
							type="hidden" disabled></input> <input id="위도" name="latitude"
							type="hidden"  /> <input id="경도" type="hidden" name="longditude"
							 /> <br>
						
						
					</form>
					
				<br>	
			<button class="dd_button dd_button5" onclick="new_shynow_enter();">shy up!</button>	
				
</div>
</div>




		

			<!-- ===== #103. 글검색 폼 추가하기 : 제목, 내용, 글쓴이로 검색하도록 한다. ===== -->
			






		</div>










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

<script>
/* $(document).ready(function(){
   
   $("#ajaxresult").hide();
   
   $(function() {

         $.ajax ({
            url : "/shy/myAlarm.shy", 
            cache : false,
            type: "POST",
              dataType: "JSON",
            success : function (data) { 
               
               $.each(data,function(entryIndex,entry){
                  //alert(entry.cnt);
                  if(entryIndex==0){
                     $("#alarmcnt").html(entry.cnt);
                  }
                });
               
            }
         });
   });

   $("#ajaxresult").click(function(e) {
      $("#ajaxresult").hide();
   })
   
});

function Alramchk() {
   
   $.ajax ({
      url : "/shy/myAlarm.shy",
      cache : false,
      type: "POST",
        dataType: "JSON",
      success : function (data) { 
         var result="";
         $.each(data,function(entryIndex,entry){
            
                var html = "<span>"+entry.name+"님이<br/>"
                +"${loginuser.name}님의 글을 좋아요♡했습니다.<br/>("+entry.alarmdate+")</span><br/>";
               
                result += html;   
            });
         
         $("#ajaxresult").html(result).show();
      },
        error: function() { // 에러가 발생했을 때의 콜백함수
            alert("error");
        }
   });
}  */
</script>
