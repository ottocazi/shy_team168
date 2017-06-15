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
		 HOT한 그룹
		  HOT한 그룹
		   HOT한 그룹
		   
		</div>
		
		<div class="mygrp mygrp_newgrp">
		<!-- 신규 그룹 -->
		 HOT한 그룹
		  HOT한 그룹
		   HOT한 그룹
		   
		</div>

	</div>

</div>

