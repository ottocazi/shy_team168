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