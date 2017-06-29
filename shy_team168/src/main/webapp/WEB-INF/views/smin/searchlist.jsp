<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SHY 관리자 페이지</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
   <link href="<%=request.getContextPath() %>/resources/css/meong/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/custom.min.css" rel="stylesheet">
    
    <style>
a, a:hover{
text-decoration: none;
}

#mygroups{
	margin: 0 auto;
	width: 70%;
	display: block;
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

	
	
    .list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.list li {
	position: relative;
	margin-bottom: 10px;
}
	

</style>    
    
    <script type="text/javascript">
    function goFollow(fk_idxflwed){
    	var form_data = {fk_idxflwed:fk_idxflwed}
    	$.ajax({
   			url: "/shy/goFollow.shy",
    		type: "GET",
    		data: form_data,
    		dataType: "JSON", 
    		success: function(data){
    			alert("idx : "+fk_idxflwed);
    			follow();
    		},
    		error: function(){
				  alert("goFollow() error!"); 
		    }
    	});	
    };
	
    function unFollow(fk_idxflwed){
    	var form_data = {fk_idxflwed:fk_idxflwed}
    	$.ajax({
   			url: "/shy/unFollow.shy",
    		type: "GET",
    		data: form_data,
    		dataType: "JSON", 
    		success: function(data){
    			alert("idx : "+fk_idxflwed);
    			follow();
    		},
    		error: function(){
				  alert("unFollow() error!"); 
		    }
    	});	
    };
    
   	function follow() {
   		var idxArr = new Array();
   		<c:if test="${plist!=null}">
   		<c:forEach items="${plist}" var="plist">
   		// alert('${plist.IDX}');
   		idxArr.push('${plist.IDX}');
   		</c:forEach>
   		</c:if>
   		 // alert(idxArr);
   		
   		jQuery.ajaxSettings.traditional = true; /* data: {idxArr:idxArr}, 이렇게 쓸라면 트루로 해줘야함 */
   		
   		$.ajax({
   			url: "/shy/follow.shy",
    		type: "GET",
    		data: {idxArr:idxArr},
    		dataType: "JSON", 
    		success: function(data){
    			//alert("follow");
    			var html;
    			
    			$.each(data, function(entryIndex, entry){
	    			
	    			var FOLLOWCHECK = entry.FOLLOWCHECK;
					if(FOLLOWCHECK == 1){

						html = "<button onClick='unFollow("+ entry.IDX + ");'>팔로우해제</button>";

					}
					else {
						
						html = "<button onClick='goFollow("+ entry.IDX + ");'>팔로우</button>";

					}
					
					$("#follow" + entry.IDX).html(html);
    				
    			});
    		//	getCommentList();
    		},
    		error: function(){
 				  alert("follow() error!"); 
 		    }
   		});
    }; 
      

    $(document).ready(function(){

    	follow();
    	
        var list = $(".list li");
        var numToShow = 4;
        var button = $("#next");
        var numInList = list.length;
        list.hide();
        if (numInList > numToShow) {
          button.show();
        }
        list.slice(0, numToShow).show();

        button.click(function(){
            var showing = list.filter(':visible').length;
            list.slice(showing - 1, showing + numToShow).fadeIn();
            var nowShowing = list.filter(':visible').length;
            if (nowShowing >= numInList) {
              button.hide();
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
    
    
  </head>

  <body style="margin-left: 10%; width: 80%;">
    <div class="container body">
      <div class="main_container">
        
        
        
        

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>검색결과</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
            
              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원목록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">000</a>
                          </li>
                          <li><a href="#">000</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table">
                      <thead>
                        <tr>
                        
                          <th>회원번호</th>
                          <th>회원이름</th>
                          <th>회원아이디</th>
                          <th>팔로우</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="map" items="${plist}" varStatus="status">
                        <tr>
                        
                          <td>${map.IDX}</td>
                          <td>${map.NAME}</td>
                          <td>${map.EMAIL}</td>
                          <td id="follow${map.IDX}"></td>
                        </tr>
                      </c:forEach>
                      </tbody>
					  </table>
					   <div align="right">${pagebar}</div> 
                  </div>
                </div>
              </div>


              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>그룹 목록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>그룹번호</th>
                          <th>그룹이름</th>
                          <th>그룹 회원수</th>
                          <th>그룹 공개범위</th>
                        </tr>
                      </thead>
                     <tbody>
                      <c:forEach var="map" items="${glist}" varStatus="status">
                        <tr>
                          <td>${map.GROUPNO}</td>
                          <td>${map.GNAME}</td>
                          <td>${map.GCOUNT}명</td>
                          <td>
                          <c:if test="${map.STATUS==1}">전체 공개</c:if>
                          <c:if test="${map.STATUS==2}">회원 공개</c:if>
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                      <div align="right">${pagebar1}</div> 
                  </div>
                </div>
              </div>

              <div class="clearfix"></div>
              
              
              
              
              
              
			<div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                
                
                







                  <div class="x_content">

				
<div id="mygroups">
				
				
	<!-- 그룹리스트 -->
	<div class="mygrp" align="center">

				 <!-- 여기에 그룹 콘텐트 넣어주기 --><!-- 여기에 그룹 콘텐트 넣어주기 --><!-- 여기에 그룹 콘텐트 넣어주기 -->
				 <h3 class="mygrp_types">그룹 목록 IMAGE </h3>
			
			
			<c:if test="${glist!=null }">
   		  <c:forEach var="map" items="${glist }" varStatus="status">
   		  
   		  
   		  <c:if test="${status.index % 4 == 0}">
				 <!-- 이게 한줄 -->
			<div class="mygrp mygrp_hotgrp" style="display: inline-flex; flex-wrap: nowrap; ">
			</c:if>
		
		
		<!-- HOT한 그룹  -->
   		  
   		  
   		  <ul class="list">
	 		<li>
		  <div class="grp_box">
		    <c:if test="${map.GIMG != null}">
		    <img class="grp_boxImage" src="<%=request.getContextPath() %>/resources/images/shydb/${map.GIMG }"><%-- img가져오기 --%>
		    </c:if>
		    
		    <c:if test="${map.GIMG == null}">
		    <img class="grp_boxImage" src="http://wallpaperpulse.com/thumb/604167.jpg"><%-- 기본이미지 --%>
		    </c:if>
		    
		    <img class="grp_buddy" src="https://farm4.staticflickr.com/3932/buddyicons/43830692@N04_r.jpg?1413100041#43830692@N04">
		    <div class="grp_inner">
		    
		      <c:if test="${map.STATUS==1}">
		      <h4 class="grp_h"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${map.GROUPNO}">${map.GNAME}</a></h4>
		      <i class="grp_fa fa-eye"> ${map.GCOUNT}명</i>
		      <span class="grp_desc"> ${map.DESCRIPTION}</span>
		      </c:if>
		      <c:if test="${map.STATUS==2}">
		      <h4 class="grp_h2"><a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${map.GROUPNO}">${map.GNAME}</a></h4>
		      <i class="grp_fa fa-eye"> ${map.GCOUNT}명</i>
		      <span class="grp_desc"> ${map.DESCRIPTION}</span>
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
		  
		  
		
		  
		 
		  
		   <c:if test="${glist==null }">
		   <div class="mygrp mygrp_hotgrp" style="display: inline-flex; flex-wrap: nowrap; ">
		   <div class="grp_box">
		   	 <span style="text-align: center; font-weight: bold; font-size: 15pt;"> 인기 그룹이 없습니다.</span>
		    </div>
		    
		    </div>
		   </c:if>
		   
		
</div>
 </div>

                  </div>
                  
                  
                  
                  
                </div>
                
                
                
              </div>
              
              <div align="center"><button id="next" style=" margin-bottom: 150px; font-size: 20px;">더보기</button></div>
            </div>
          </div>
        </div>
        <!-- /page content -->

      </div>
    </div>

    <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/nprogress.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/custom.min.js"></script>
  </body>
</html>