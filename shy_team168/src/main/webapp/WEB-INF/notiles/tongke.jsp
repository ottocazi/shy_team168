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

    <!-- Custom Theme Style -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/custom.min.css" rel="stylesheet">

<script type="text/javascript">
function goday(){
	var godayForm = document.godayForm;
	godayForm.submit();
}

 function ym_init_charts() {
	if (console.log("run_charts  typeof [" + typeof Chart + "]"), "undefined" != typeof Chart) {	 
	 if($("#lineChart_ym").length) {
        var f = document.getElementById("lineChart_ym");
        new Chart(f, {
            type: "line",
            data: {
            	labels: [
            		<c:forEach var="map" items="${tkList}"  varStatus="status">
					"${map.TIME}시",
					</c:forEach>
            	],
                datasets: [{
                    label: 
                    	<c:if test="${empty today2}">"오늘",</c:if>
                    	<c:if test="${not empty today2}">"${today2}",</c:if>
                    	
                    backgroundColor: "rgba(38, 185, 154, 0.31)",
                    borderColor: "rgba(38, 185, 154, 0.7)",
                    pointBorderColor: "rgba(38, 185, 154, 0.7)",
                    pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
                    pointHoverBackgroundColor: "#fff",
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointBorderWidth: 1,
                    data: [
                     	<c:forEach var="map" items="${tkList}"  varStatus="status">
						"${map.CNT}",
						</c:forEach>
                    ]
                }, {
                    label: 
                    	<c:if test="${empty yesterday2}">"어제",</c:if>
                    	<c:if test="${not empty yesterday2}">"${yesterday2}",</c:if>
                    	
                    backgroundColor: "rgba(3, 88, 106, 0.3)",
                    borderColor: "rgba(3, 88, 106, 0.70)",
                    pointBorderColor: "rgba(3, 88, 106, 0.70)",
                    pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
                    pointHoverBackgroundColor: "#fff",
                    pointHoverBorderColor: "rgba(151,187,205,1)",
                    pointBorderWidth: 1,
                    data: [
                    	<c:forEach var="map" items="${tkList2}"  varStatus="status">
						"${map.CNT}",
						</c:forEach>
                    	]
                } ]
            }
        })
       }
	}
 }
</script>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="open.shy" class="site_title"><i class="fa fa-paw"></i> <span>SHY</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <h2>환영합니다. OOO님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

			<!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>메뉴</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> SHY관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/shymember.shy">유저관리</a></li>
                      <li><a href="<%= request.getContextPath() %>/adminshymemo.shy">게시물관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 회사관리 <span class="label label-success pull-right">출시 예정</span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">회사개요</a></li>
                      <li><a href="#">채용공고</a></li>
                      <li><a href="#">사업제안</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 통계상세 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
					  <li><a href="<%= request.getContextPath() %>/tongke.shy">시간대별 로그인 통계</a></li>
                      <li><a href="<%= request.getContextPath() %>/bartongke.shy">일주일별 회원,그룹게시물 통계</a></li>
                      <li><a href="<%= request.getContextPath() %>/pietongke.shy">지역,국가별 회원수 통계</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 공지사항 <span class="label label-success pull-right">출시 예정</span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/gesipan.shy">미정</a></li>
                      <li><a href="#">###</a></li>
                    </ul>
                  </li>
               </ul>            
              </div>

            </div> 
            <!-- /sidebar menu -->

            <!-- menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3 style="color: red;">${year}년 ${month}월 ${day}일 시간대별 로그인 통계</h3>
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
                <div class="x_panel_ym">
                  <div class="x_title">
                    <h2>시간대별 LINE 그래프</h2>
                    
<form name="godayForm" action="<%= request.getContextPath() %>/tongke.shy" method="get">
                    <input type="date" required="required" name="today" value="${today2}"/> 
                    <input type="date" required="required" name="yesterday" value="${yesterday2}"/>
                    <button type="button" onClick="goday();">확인</button>
</form>

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
                  <div class="x_content" >
                    <canvas id="lineChart_ym"></canvas>
                  </div>
                  <div>
     			  </div> 
                </div>
              </div>
<!-- 
              <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Bar Graph</h2>
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

                    <div id="mainb" style="height:350px;"></div>

                  </div>
                </div>
              </div>
               -->
            </div>

          </div>
        </div>
        <!-- page content -->

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
    <!-- Chart.js -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/Chart.min.js"></script>
	<!-- ECharts -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/echarts.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/world.js"></script>
	
    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/custom.min.js"></script>
	
  </body>
</html>