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
  </head>

  <body class="nav-md">
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
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="map" items="${plist}" varStatus="status">
                        <tr>
                        
                          <td>${map.IDX}</td>
                          <td>${map.NAME}</td>
                          <td>${map.EMAIL}</td>
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
                          <th>그룹아이디</th>
                        </tr>
                      </thead>
                     <tbody>
                      <c:forEach var="map" items="${glist}" varStatus="status">
                        <tr>
                          <td>${map.GROUPNO}</td>
                          <td>${map.GNAME}</td>
                          <td>${map.GCOUNT}</td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                     <%-- <div align="right">${pagebar2}</div>  --%>
                  </div>
                </div>
              </div>

              <div class="clearfix"></div>
              
              
              
              
              
              
			<div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                
                
                
                  <div class="x_title">
                    <h2>Table design <small>Custom design</small></h2>
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

				 <!-- 여기에 그룹 콘텐트 넣어주기 --><!-- 여기에 그룹 콘텐트 넣어주기 --><!-- 여기에 그룹 콘텐트 넣어주기 -->
				 <%-- <div class="mygrp mygrp_hotgrp" style="display: inline-flex; flex-wrap: nowrap; ">
		
		<!-- HOT한 그룹  -->
   		  <c:if test="${hotGrpList!=null }">
   		  <c:forEach var="gvo" items="${hotGrpList }">
		  <div class="grp_box">
		    <c:if test="${gvo.gimg!=null}">
		    <img class="grp_boxImage" src="${gvo.gimg}">img가져오기
		    </c:if>
		    <c:if test="${gvo.gimg==null}">
		    <img class="grp_boxImage" src="https://farm8.staticflickr.com/7328/9000198669_57003f7505_n.jpg">기본이미지
		    </c:if>
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
		  </div>
		  </c:forEach>
		  </c:if>
		   <c:if test="${hotGrpList==null }">
		   <div class="grp_box">
		   	 <span style="text-align: center; font-weight: bold; font-size: 15pt;"> 인기 그룹이 없습니다.</span>
		    </div>
		   </c:if>
		</div>

 --%>

                  </div>
                  
                  
                  
                  
                </div>
              </div>
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