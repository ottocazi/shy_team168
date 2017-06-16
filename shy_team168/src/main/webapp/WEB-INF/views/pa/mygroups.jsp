<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script>
<style>
#mygroups{
	margin-left: 11%;
	margin-top: -8.5%;
	width: 80%;
	display: block;
}


.topInputSearch {
    position: absolute;
    left: 30%;
    width: 20%;
    height: 28px;
    padding: 0 36px 0 12px;
    border: none;
}

.topInputSearch input{
	position: absolute;
	width: 80%;
	padding: 4px;
	border: 1px solid rgba(0,0,0,.15);
    background: rgba(255,255,255,.11);
    border-radius: 28px;
}

.topInputSearch button{
	position: relative;
    border: none;
    left: 93%;
    padding: 5px;
    background: rgba(255,255,255,.11);
}

.mygrp{
	margin-top: 10.2%;
    position: relative;
    border: 1px solid red;
}

.mygrp .mygrp_list, .mygrp .mygrp_hotgrp, .mygrp .mygrp_newgrp{
	position: relative;
    border: 1px solid rgba(0,0,0,.15);
    margin-top: 10%;
    /* max-height: 300px;  */
}

/* grp layout */
.grp_box { 
	width: 660px; 
	margin: 40px auto; 
	text-align:center; 
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
}
.grp_fa:hover { color: #666; }
.grp_h { display:block; color:#999; }
.grp_inner { text-align: center; }
.grp_boxImage { border-top-left-radius:3px; border-top-right-radius:3px; width:100%; }

.grp_buddy {
  position:absolute; z-index:2;
  width:96px; height:96px;
  left:50%;
  margin: -48px 0 0 -48px;
  border-radius:50%;
}
.grp_content{

}
</style>    
    
    
<div id="mygroups" align="center">

	<!-- 그룹검색 -->
	<div class="topInputSearch" align="center">  
		<input type="text"placeholder="그룹, 게시글을 검색해 보세요"> <!-- class="grpInputSearch"  -->
		<button type="submit" class="icon-search"><span class="searchgrp">검색</span></button>
	</div>
	
	<!-- 그룹리스트 -->
	<div class="mygrp" align="center">
	
		<div class="mygrp mygrp_list">
		<!-- 내 그룹-->
		내 그룹 목록
		</div>
	
		<div class="mygrp mygrp_hotgrp">
		<!-- HOT한 그룹  -->
   
		  <div class="grp_box">
		    
		    <img class="grp_boxImage" src="https://farm8.staticflickr.com/7328/9000198669_57003f7505_n.jpg">
		    <img class="grp_buddy" src="https://farm4.staticflickr.com/3932/buddyicons/43830692@N04_r.jpg?1413100041#43830692@N04">
		    
		    <div class="grp_inner">
		      <h3 class="grp_h"><a href="http://www.flickr.com/photos/tommiehansen/">그룹장</a></h3>
		      <i class="grp_fa fa-eye"> 회원 수</i>
		      <span class="grp_content">그룹 설명 그룹 설명 그룹 설명 </span>
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
		
		<div class="mygrp mygrp_newgrp">
		<!-- 신규 그룹 -->
		 HOT한 그룹
		  HOT한 그룹
		   HOT한 그룹
		   
		</div>

	</div>

</div>

