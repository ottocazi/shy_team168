<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/pa/groups.css">    
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
		    
		      	<img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }">
		      </c:if>
		      <c:if test="${gvo.gimg == null}">
		      	<img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg"> <!-- 기본이미지 -->
		      </c:if>
		      <c:if test="${gvo.myimg != null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg }"></a>
		      </c:if>	
		      <c:if test="${gvo.myimg == null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png"></a>
		       </c:if>
		       <a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">
		      	<div class="grp_inner">
		      	<h4 class="grp_h">${gvo.gname }</h4>
		      	<i class="grp_fa fa-users"> ${gvo.gcount }명</i>
		      	<span class="grp_desc"> ${gvo.description }</span>
		      	</div></a>
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
		    <img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }">
		    </c:if>
		    <c:if test="${gvo.gimg == null}">
		    <img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg">
		    </c:if>
		    <c:if test="${gvo.myimg != null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg }"></a>
		      </c:if>	
		      <c:if test="${gvo.myimg == null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png"></a>
		       </c:if>
		     <a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">
		     <div class="grp_inner">
		      <c:if test="${gvo.status==1}">
		      <h4 class="grp_h">${gvo.gname }</h4>
		      <i class="grp_fa fa-users"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		      </c:if>
		      <c:if test="${gvo.status==2}">
		      <h4 class="grp_h">${gvo.gname }</h4>
		      <i class="grp_fa fa-users"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		      </c:if>
		    </div></a>
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
		    <img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.gimg }">
		    </c:if>
		    <c:if test="${gvo.gimg == null}">
		    <img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg">
		    </c:if>
		   <c:if test="${gvo.myimg != null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img class="grp_buddy" src="<%=request.getContextPath() %>/resources/images/shydb/${gvo.myimg }"></a>
		      </c:if>	
		      <c:if test="${gvo.myimg == null}">
		      	<a href="<%= request.getContextPath() %>/mypage.shy?idx=${gvo.fk_idx}">
		      	<img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png"></a>
		       </c:if>
			 <a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${gvo.groupno}">
		    <div class="grp_inner">
		      <h4 class="grp_h">${gvo.gname }</h4>
		      <i class="grp_fa fa-users"> ${gvo.gcount }명</i>
		      <span class="grp_desc"> ${gvo.description }</span>
		    </div></a>
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


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




