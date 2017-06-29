<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
$(function(){
	  
	  $('.grp_h2').on('click', function(e){
		 alert('회원공개 그룹입니다.');
	  });
	  
	  $('.mygrp_register').mouseover(function() { 
		  var target = $(event.target);
			
		  $(this).addClass("mygrp_registerover");
	  });
	  
	  $(".mygrp_register").mouseout(function() {
			$(this).removeClass("mygrp_registerover");
		});
	  
	});
</script>
<script>



function goMakegrp() {
	var frm = document.GroupFrm;
	
	frm.submit();
}


$(document).ready(function(){

    var newlist = $(".newlist li");
    var hotlist = $(".hotlist li");
    var numToShow = 4;
   /*   var button = $("#next"); */
    var numInNewList = newlist.length;
    var numInHotList = hotlist.length;
   
    newlist.hide();
    hotlist.hide();
    
    if (numInNewList > numToShow) {
    	$("#newGrp").show();
    	
    }
    if (numInHotList > numToShow){
    	$("#hotGrp").show();
    }
    
    newlist.slice(0, numToShow).show();
    hotlist.slice(0, numToShow).show();

    $("#newGrp").click(function(){
        var showing = newlist.filter(':visible').length;
        newlist.slice(showing - 1, showing + numToShow).fadeIn();
        var nowShowing = newlist.filter(':visible').length;
        if (nowShowing >= numInNewList) {
        	$("#next newGrp").hide();
        }
    });

    $("#hotGrp").click(function(){
        var showing = hotlist.filter(':visible').length;
        hotlist.slice(showing - 1, showing + numToShow).fadeIn();
        var nowShowing = hotlist.filter(':visible').length;
        if (nowShowing >= numInHotList) {
        	$("#next hotGrp").hide();
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


</script>
<style>
a, a:hover{
text-decoration: none;
}

#mygroups{
	margin: 0 auto;
	width: 70%;
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
	display: inline-block;
}

.mygrp_types{
	text-align: center;
	font-weight: bold;
	color: #92A8D1;
	padding: 20px;
}

.mygrp_register{
	font-weight: bold;
	margin: 10px;
	background-color: #fff;
	border: 1px solid gray;
}

.mygrp_registerover{
	color:#92A8D1;
	font-weight: bold;
}

.grp_box { 
	overflow: hidden;
	width:220px;
	height:auto;
	text-align:left;
	position:relative;
	border: 1px solid #ddd;
	border-bottom: 1px solid #bbb;
	background: #fff;
	border-radius: 3px;
	margin: 2px;
}

.grp_box:hover{
  background: #A9A8A8;
  border-color: #919191;
  box-shadow: 0 1px 40px rgba(0, 0, 0, 0.15);
}

.grp_fa { 
	color:#999; 
	font-family:"FontAwesome", "Open Sans", sans-serif; 
	font-weight:100; 
	font-size:12px; 
	cursor:pointer; 
	word-spacing:2px; 
    padding: 8px;
    text-align: right;
}
.grp_fa:hover { color: #666; }
.grp_h { margin-top: 20%;display:block; color:#999; font-weight: bold;}
.grp_h2 { margin-top: 20%;display:block; color:#999; font-weight: bold;}
.grp_inner { text-align: center; padding: 15px;}
.grp_boxImage { border-top-left-radius:3px; border-top-right-radius:3px; width:100%; height: 145px; }
.grp_boxImage:hover{background-color: #A9A8A8;opacity: inherit;}

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

@import "compass/css3";

.newlist, .hotlist {
	list-style: none;
	padding: 0;
	margin: 0;
}

.newlist li, .hotlist li {
	position: relative;
	margin-bottom: 10px;
}
	




</style>    
    
    
<div id="mygroups">

	<!-- 그룹검색 -->
	<!-- <div align="center" style="margin-top: 60px;">
	<div class="topInputSearch">
		<select name="colname" id="colname">
			<option value="gname">그룹명</option>
			<option value="gcontent">게시글</option>
		</select>  
		<input type="text" id="grpsearch" name="grpsearch" placeholder="그룹, 게시글을 검색해 보세요"> class="grpInputSearch" 
		<button type="submit" class="icon-search" onclick="goGrpsearch();"><span class="searchgrp">검색</span></button>
		<span class="populargrp">#해시태그 #해시태그</span>
	</div>
	
	=====  1. Ajax 로 검색어 입력시 자동글 완성하기  ===== 
	<div class="topInputSearchList" align="center">자동글완성
	</div>
	</div> -->
	
	<!-- 그룹리스트 -->
	<div class="mygrp" align="center">
	
		<h3 class="mygrp_types">내가 만든 그룹</h3>
			<form name="GroupFrm" method="POST" action="<%= request.getContextPath() %>/mygroups_insertFrm.shy">
				<button type="submit" class="mygrp_register" onclick="goMakegrp();">그룹만들기</button>
			</form>
		<div class="mygrp mygrp_list" style="display: inline-flex; flex-wrap: nowrap;">
		<!-- 내 그룹-->
			
			<c:if test="${myGrpList!=null }">
			<c:forEach var="gvo" items="${myGrpList }">
			 <div class="grp_box">
		      <c:if test="${gvo.gimg != null}">
		      	<img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }"><%-- img가져오기 --%>
		      </c:if>
		      <c:if test="${gvo.gimg == null}">
		      	<img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg"><%-- 기본이미지 --%>
		      </c:if>
		      	<img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg }">
		      	<div class="grp_inner">
		      	<h4 class="grp_h"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">${gvo.gname }</a></h4>
		      	<i class="grp_fa fa-eye"> ${gvo.gcount }명</i>
		      	<span class="grp_desc"> ${gvo.description }</span>
		      </div>
	    	 </div>
	    	</c:forEach>
		   	 
		   	 </c:if>
		   	 <c:if test="${myGrpList==null }">
		   	 <div class="grp_box" style="width: 100%">
		   	 	<span style="text-align: center; font-weight: bold; font-size: 15pt;"> 내가 만든 그룹이 없습니다.</span>
		   	 </div>
		   	 </c:if>
		</div>
	
	
	
	
	
	
		<div style="border: dashed; border-color:  #ff8080; width: 110%;">
		<h3 class="mygrp_types" style="color:  #ff8080">HOT 그룹</h3>
		
		
		<!-- HOT한 그룹  -->
   		  <c:if test="${hotGrpList!=null }">
   		  <c:forEach var="gvo" items="${hotGrpList }" varStatus="status">
   		  
   		  <c:if test="${status.index % 4 == 0}">
				 <!-- 이게 한줄 -->
			<div class="mygrp mygrp_hotgrp" style="display: inline-flex; flex-wrap: nowrap; ">
			</c:if>
   		  
   		  
   		   <ul class="hotlist">
	 		<li>
		  <div class="grp_box">
		    <c:if test="${gvo.gimg != null}">
		    <img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }"><%-- img가져오기 --%>
		    </c:if>
		    <c:if test="${gvo.gimg == null}">
		    <img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg"><%-- 기본이미지 --%>
		    </c:if>
		    <c:if test="${gvo.myimg != null}">
		    <img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg  }">
		    </c:if>
		    <c:if test="${gvo.myimg == null}">
			<img class="grp_buddy" src="http://magazine.nicktv.it/wp-content/uploads/sites/11/2016/09/Spongebob-Finalmente-Si-Mangia.gif">
			 </c:if>
		     <div class="grp_inner">
		      <c:if test="${gvo.status==1}">
		      <h4 class="grp_h"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">${gvo.gname }</a></h4>
		      <i class="grp_fa fa-eye"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		      </c:if>
		      <c:if test="${gvo.status==2}">
		      <h4 class="grp_h2"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">${gvo.gname }</a></h4>
		      <i class="grp_fa fa-eye"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		      </c:if>
		    </div>
		  </div>
		  </li>
		  </ul>
		  
		  <c:if test="${(status.index + 1) % 4 == 0}">
		  </div>
		  </c:if>
		  </c:forEach>
		  </c:if>
		  
		  
		   <c:if test="${hotGrpList==null }">
		   <div class="grp_box">
		   	 <span style="text-align: center; font-weight: bold; font-size: 15pt;"> 인기 그룹이 없습니다.</span>
		    </div>
		   </c:if>
		</div>
		</div>
		<div align="center"><button id="hotGrp" style=" font-size: 20px; margin: 50px; ">더보기</button></div>
		
		
		
		
		
		
		<div style="border: dashed; border-color: #00b300; width: 110%;">
		<h3 class="mygrp_types" style="color: #00b300">신규 그룹</h3>
		
		<!-- 신규 그룹 -->
		 <c:if test="${newGrpList!=null }">
   		  <c:forEach var="gvo" items="${newGrpList }" varStatus="status">
   		  
   		  <c:if test="${status.index % 4 == 0}">
   		  <div class="mygrp mygrp_newgrp" style="display: inline-flex; flex-wrap: nowrap; ">
   		  </c:if>
   		  
   		  
   		  <ul class="newlist">
	 		<li>
		  <div class="grp_box">
		    <c:if test="${gvo.gimg != null}">
		    <img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }"><%-- img가져오기 --%>
		    </c:if>
		    <c:if test="${gvo.gimg == null}">
		    <img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg"><%-- 기본이미지 --%>
		    </c:if>
		    <c:if test="${gvo.myimg != null}">
		    <img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg  }">
		    </c:if>
		    <c:if test="${gvo.myimg == null}">
			<img class="grp_buddy" src="http://magazine.nicktv.it/wp-content/uploads/sites/11/2016/09/Spongebob-Finalmente-Si-Mangia.gif">
			 </c:if>
		    <div class="grp_inner">
		      <h4 class="grp_h"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">${gvo.gname }</a></h4>
		      <i class="grp_fa fa-eye"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		    </div>
		  </div>
		  </li>
		  </ul>
		  
		  <c:if test="${(status.index + 1) % 4 == 0}">
		  </div>
		  </c:if>
		  </c:forEach>
		  </c:if>
		  
		   <c:if test="${newGrpList==null }">
		   <div class="grp_box">
		   	 <span style="text-align: center; font-weight: bold; font-size: 15pt;"> 신규 그룹이 없습니다.</span>
		    </div>
		   </c:if>
		   
		</div>
		
		</div>
		
		
		
	<div align="center"><button id="newGrp" style=" font-size: 20px; margin: 50px; ">더보기</button></div>
	</div>
</div>

