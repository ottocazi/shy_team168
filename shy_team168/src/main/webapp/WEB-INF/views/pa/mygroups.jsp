<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
$(function(){
	  $('.mygrp_gimg').on('click', function(e){
	    var $biginfo = $('.mygrp_clearfix');
	    var $bigname = $('.mygrp_name');
	    var $bigmember  = $('.mygrp_member');
	    var $bigdesc  = $('.mygrp_desc');
	    
	    var newname = $(this).siblings('.name').eq(0).html();
	    var newmember = $(this).siblings('.member').eq(0).html();
	    var newdesc = $(this).siblings('.desc').eq(0).html();
	    
	    $bigname.html(newname);
	    $bigmember.html(newmember);
	    $bigdesc.html(newdesc);
	    
	    if($biginfo.css('display') == 'none') {
	      $biginfo.slideDown(350);
	    }
	  });
	});
</script>
<script>
$(document).ready(function(){
	
	grpsearchKeep();
	
	//	===== 2. Ajax 로 검색어 입력시 자동글 완성하기  =====
	$(".topInputSearchList").hide();

    $("#grpsearch").keyup(function(){
    	
    	var form_data = { colname : $("#colname").val(),  // 키값 : 밸류값  
    					  grpsearch  : $("#grpsearch").val()    // 키값 : 밸류값 
    	       		    };
    	
    	$.ajax({
    		url: "/shy/wordSearchShow.shy",
    		type: "GET",
    		data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
    		dataType: "JSON", 
    		success: function(data){
    			
    		// ===== 7. Ajax 로 검색어 입력시 자동글 완성하기  ===== 
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
                       
                        var index = wordstr.toLowerCase().indexOf( $("#grpsearch").val().toLowerCase() ); 
					    var len = $("#grpsearch").val().length;
					    var result = "";
					    
					    result = "<span class='first' style='color: font-weight: bold;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color: #DD4124; font-weight: bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' >" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";        
                       
						resultHTML += "<span style='cursor: pointer;'>" + result + "</span><br/>"; 	   
    			   });
    			  
    			   $(".topInputSearchList").html(resultHTML);
    			   $(".topInputSearchList").show();
    		   }
    		   else {
    			  // 검색된 데이터가 없는 경우.
    			  // 조심할것은 if(data == null) 으로 하면 안된다.
    			   $(".topInputSearchList").hide();
    		   }
    			
    		},
    		error: function(){
   				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
   		    }
    	});
    	
    }); // end of keyup(function(){})---------
    
    
    // ===== 8. Ajax 로 검색어 입력시 자동글 완성하기  ===== 
    $(".topInputSearchList").click(function(event){
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
		
		$("#grpsearch").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		
		$(".topInputSearchList").hide();
		
    });// end of $(".topInputSearchList").click()---------
    
	
	
});// end of $(document).ready()----------------------


function goGrpsearch(){
	
	var frm = document.searchFrm;
	var grpsearch = $("#grpsearch").val();
	
	if(grpsearch.trim() == "") {
		alert("검색어를 입력하세요!!");
	}
	else {
		frm.action = "/shy/mygroups.shy";
		frm.method = "GET";
		frm.submit();
	}
}// end of goGrpsearch() ------- 상단검색바


function grpsearchKeep(){
	<c:if test="${not empty grpsearch}">
		$("#grpsearch").val("${grpsearch}");   // 검색어를 유지시켜 주겠다.
	</c:if>
}// end of grpsearchKeep() ----- 상단검색바 검색어 유지

function goMakegrp() {
	var frm = document.searchFrm;
	
	frm.action = "/shy/mygroups_insertFrm.shy";
	frm.method = "GET";
	frm.submit();
}
</script>
<style>
#mygroups{
	margin: 0 auto;
	width: 80%;
	display: block;
}

/* 검색바 부분  */
.topInputSearch {
    position: sticky;
    margin-top:1.2%;
    width: 50%;
    height: 28px;
    padding: 0 36px 0 12px;
}

.topInputSearch input{
	position: relative;
    width: 232px;
    padding: 4px;
    border: 1px solid rgba(0,0,0,.15);
    background: rgba(255,255,255,.11);
    border-radius: 28px;
}

.topInputSearch button{
    border: none;
    left: 93%;
    padding: 5px;
    background: rgba(255,255,255,.11);
}

.topInputSearch .populargrp{
    text-align: center;
    display: block;
    padding: 5px;
    background: rgba(255,255,255,.11);
}

.topInputSearchList{
	position: sticky;
    display: inline-flex;
    width: 220px;
    height: auto;
    margin-left: 5px;
    margin-top: -5px;
    padding: 10px;
    border: 1px solid rgba(0,0,0,.15);
    border-top: hidden;
    background: #fff;
}

/* 그룹 리스트  */
.mygrp{
	margin: 2%;
    position: relative;
    display: block;
    border: 1px solid #fff;
}

.mygrp .mygrp_list, .mygrp .mygrp_hotgrp, .mygrp .mygrp_newgrp{
	position: relative;
}

.mygrp_types{
	text-align: center;
	font-weight: bold;
	color: #92A8D1;
	padding: 20px;
}

.mygrp_register{
	position: absolute;
	font-weight: bold;
	margin: 10px;
}

/* hot,신규그룹 layout */
.grp_box { 
	width: 660px; 
	margin: 40px auto; 
	position: relative; 
}

.grp_box { 
	overflow: hidden;
	width:320px;
	text-align:left;
	display:inline-block;
	position:relative;
	border: 1px solid #ddd;
	border-bottom: 1px solid #bbb;
	background: #fff;
	border-radius: 3px;
}

.grp_fa { 
	color:#999; 
	font-family:"FontAwesome", "Open Sans", sans-serif; 
	font-weight:100; 
	font-size:12px; 
	cursor:help; 
	word-spacing:2px; 
    padding: 8px;
    text-align: right;
}
.grp_fa:hover { color: #666; }
.grp_h { margin-top: 20%;display:block; color:#999; font-weight: bold; }
.grp_inner { text-align: center; display: grid; padding: 5px;}
.grp_boxImage { border-top-left-radius:3px; border-top-right-radius:3px; width:100%; }

.grp_buddy {
  position:absolute; z-index:2;
  width:96px; height:96px;
  left:50%;
  margin: -48px 0 0 -48px;
  border-radius:50%;
}
.grp_content{
	padding:10px;
}

/* 내 그룹 layout */
.mygrp_name h2{
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  font-size: 3.0em;
  line-height: 1.2em;
  margin-bottom: 4px;
  color: #515151;
  font-weight: bold;
}

.mygrp_clearfix{
  display: block;
  margin: 0 auto;
  width: 900px;
  padding: 10px 25px;
  background: #fff;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.3);
  -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.3);
  box-shadow: 0 1px 1px rgba(0,0,0,0.3);
  text-align: left;
}

/** 내 그룹 list **/
.mygrp {
  display: block;
}

.mygrp li {
  display: block;
  float: left;
  margin-right: 20px;
  margin-bottom: 20px;
}
.mygrp li:hover {
  cursor: pointer;
}

.mygrp li.last { margin-right: 0; }

.mygrp .gcontent {
  display: none;
}

/** hidden mygrp content **/
.mygrp_img {
  display: block;
  float: left;
}

.mygrp_details {
  display: block;
  float: left;
  width: 600px;
  padding-left: 15px;
}

/** 내 그룹 mygrp_clearfix **/
.mygrp_clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0; }
.mygrp_clearfix { display: inline-block; }
.mygrp_clearfix html[xmlns]{ display: block; }
.mygrp_clearfix * html { height: 1%; }

</style>    
    
    
<div id="mygroups">
<form name="searchFrm">
	<!-- 그룹검색 -->
	<div align="center" style="margin-top: 60px;">
	<div class="topInputSearch">
		<select name="colname" id="colname">
			<option value="gname">그룹명</option>
			<option value="gcontent">게시글</option>
		</select>  
		<input type="text" id="grpsearch" name="grpsearch" placeholder="그룹, 게시글을 검색해 보세요"> <!-- class="grpInputSearch"  -->
		<button type="submit" class="icon-search" onclick="goGrpsearch();"><span class="searchgrp">검색</span></button>
		<span class="populargrp">#해시태그 #해시태그</span>
	</div>
	
	<!-- =====  1. Ajax 로 검색어 입력시 자동글 완성하기  ===== --> 
	<div class="topInputSearchList" align="center">자동글완성
	</div>
	</div>
	
	<!-- 그룹리스트 -->
	<div class="mygrp" align="center">
	
		<div class="mygrp mygrp_list">
		<!-- 내 그룹-->
			<h3 class="mygrp_types">내가 만든 그룹</h3>
			<button type="button" class="mygrp_register" onclick="goMakegrp();">그룹만들기</button>
			 <div class="mygrp_clearfix">
		      <img src="https://i.imgur.com/TkSNOpF.jpg" class="mygrp_img" width="225" height="260">
		      <div class="mygrp_details">
		        <h3 class="mygrp_name">그룹명</h3>
		        <p class="mygrp_member">그룹회원 수</p>
		        <p class="mygrp_desc">그룹설명 그룹설…&nbsp;<a href="#">더 보기</a></p>
		      </div>
	    	 </div>
	    
		    <ul class="mygrp mygrp_clearfix">
		      <li>
		        <img src="https://i.imgur.com/TkSNOpF.jpg" alt="Johnny Appleseed" width="130" height="150" class="mygrp_gimg">
		        <span class="gcontent name">President/CEO</span>
		        <span class="gcontent member">5명</span>
		        <span class="gcontent desc">Just a bunch of random text here explaining details about the person. You could include history, job responsibilities, time at the company, and maybe stuff they like to do for fun. Or make fun of them... your call.</span>
		      </li>
		       <li>
		        <img src="https://i.imgur.com/TkSNOpF.jpg" alt="Mr. What Zit Tooya" width="130" height="150" class="mygrp_gimg">
		        <span class="gcontent name">Project Manager</span>
		        <span class="gcontent member">6명</span>
		        <p class="gcontent desc">These are pretty flexible and we could even include <strong>real HTML tags</strong>! Which also means the potential to include <a href="https://twitter.com/" target="_blank">social networking</a> links.</p>
      		   </li>
		   	 </ul>
		</div>
	
		<div class="mygrp mygrp_hotgrp" style="display: inline-block;">
		<!-- HOT한 그룹  -->
   		  <h3 class="mygrp_types">HOT 그룹</h3>
   		  <c:if test="${hotGrpList!=null }">
		  <div class="grp_box">
		  <c:forEach var="gvo" items="${hotGrpList }">
		    <img class="grp_boxImage" src="https://farm8.staticflickr.com/7328/9000198669_57003f7505_n.jpg">
		    <img class="grp_buddy" src="https://farm4.staticflickr.com/3932/buddyicons/43830692@N04_r.jpg?1413100041#43830692@N04">
		    <div class="grp_inner">
		      <h4 class="grp_h"><a href="http://www.flickr.com/photos/tommiehansen/">${gvo.gname }</a></h4>
		      <i class="grp_fa fa-eye"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		      <!-- <i class="btn openPop">Popular photos</i> -->
		    </div>
		   
		    <!-- <div class="pop">
		      <i class="close">&times;</i>
		      <h3><i>Tommie Hansen's</i>Popular photos</h3>
		        <img src="http://farm8.static.flickr.com/7390/12980175743_5cb04727f3_q.jpg">
		        <img src="http://farm4.static.flickr.com/3679/12980129103_edbea2fca4_q.jpg">
		        <img src="http://farm6.static.flickr.com/5497/14367491417_563fcbc6a9_q.jpg">
		        <img src="http://farm3.static.flickr.com/2573/12980150413_6982593c38_q.jpg">
		      <a href="http://www.flickr.com/photos/tommiehansen/" target="_blank">Visit flickr photostream</a>yes, target is evil
		    </div> -->
		     </c:forEach>
		  </div>
		  </c:if>
		</div>
		
		<div class="mygrp mygrp_newgrp">
		<!-- 신규 그룹 -->
		 <h3 class="mygrp_types">신규 그룹</h3>
		 <div class="grp_box">
		    <img class="grp_boxImage" src="https://farm8.staticflickr.com/7328/9000198669_57003f7505_n.jpg">
		    <img class="grp_buddy" src="https://farm4.staticflickr.com/3932/buddyicons/43830692@N04_r.jpg?1413100041#43830692@N04">
		    <div class="grp_inner">
		      <h4 class="grp_h"><a href="http://www.flickr.com/photos/tommiehansen/">그룹명</a></h4>
		      <i class="grp_fa fa-eye"> 회원 수</i>
		      <span class="grp_desc">그룹 설명 그룹 설명 그룹 설명</span>
		      <!-- <i class="btn openPop">Popular photos</i> -->
		    </div>
		    
		    <!-- <div class="pop">
		      <i class="close">&times;</i>
		      <h3><i>Tommie Hansen's</i>Popular photos</h3>
		        <img src="http://farm8.static.flickr.com/7390/12980175743_5cb04727f3_q.jpg">
		        <img src="http://farm4.static.flickr.com/3679/12980129103_edbea2fca4_q.jpg">
		        <img src="http://farm6.static.flickr.com/5497/14367491417_563fcbc6a9_q.jpg">
		        <img src="http://farm3.static.flickr.com/2573/12980150413_6982593c38_q.jpg">
		      <a href="http://www.flickr.com/photos/tommiehansen/" target="_blank">Visit flickr photostream</a>yes, target is evil
		    </div> -->
		    
		  </div>
		   
		</div>
	
	</div>
	</form>
</div>

