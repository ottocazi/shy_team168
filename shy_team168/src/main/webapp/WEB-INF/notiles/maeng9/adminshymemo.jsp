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
    <!-- Datatables -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/meong/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/meong/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/meong/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/meong/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=request.getContextPath() %>/resources/css/meong/custom.min.css" rel="stylesheet">
     
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="admin.shy" class="site_title"><i class="fa fa-paw"></i> <span>SHY</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<%=request.getContextPath() %>/resources/images/shydb/${sessionScope.loginuser.myimg}" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <h2>${sessionScope.loginuser.name}님 환영합니다.</h2>
                <br>
                <a href="mainline.shy"><span style="color: red;">일반페이지로 가기</span></a>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <!-- <h3>메뉴</h3> -->
                <ul class="nav side-menu">
                   <li><a><i class="fa fa-home"></i> SHY관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/shymember.shy">유저관리</a></li>
                      <li><a href="<%= request.getContextPath() %>/adminshymemo.shy">게시물관리</a></li>
                     </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 회사관리 <span class="fa fa-chevron-down"></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/shyinfo.shy">회사개요 <span class="label label-success pull-right">추후 구현</span></a></li>
                      <li><a href="<%= request.getContextPath() %>/shyinfomember.shy">회사식구<span class="label label-success pull-right">추후 구현</span></a></li>
                    </ul>
                  </li>
                   <li><a><i class="fa fa-desktop"></i> 통계상세 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
					  <li><a href="<%= request.getContextPath() %>/tongke.shy">시간대별 로그인 통계</a></li>
                      <li><a href="<%= request.getContextPath() %>/bartongke.shy">일주일별 회원,그룹게시물 통계</a></li>
                      <li><a href="<%= request.getContextPath() %>/pietongke.shy">지역,국가별 게시물 통계</a></li>
                      <li><a href="<%= request.getContextPath() %>/GeoShy.shy">도시별 게시물 통계</a></li>
                     </ul>
                  </li>
<%--                   <li><a><i class="fa fa-table"></i> 공지사항 <span class="label label-success pull-right">추후 구현</span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/gesipan.shy">테이블</a></li>
                    </ul>
                  </li> --%>
                  <li><a><i class="fa fa-table"></i> UI 요소 <span class="label label-success pull-right">추후 구현</span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/general_elements.shy">일반요소</a></li>
                      <li><a href="<%= request.getContextPath() %>/icons.shy">아이콘</a></li>
                      <li><a href="<%= request.getContextPath() %>/widgets.shy">위젯</a></li>
                      <li><a href="<%= request.getContextPath() %>/invoice.shy">운송장</a></li>
                    </ul>
                  </li>
               </ul>            
              </div>

            </div> 

            <!-- /sidebar menu -->
            
            <!-- /menu footer buttons -->
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
            <!-- /menu footer buttons -->
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
                    <img src="<%=request.getContextPath() %>/resources/images/shydb/${sessionScope.loginuser.myimg}" alt="">${sessionScope.loginuser.name}
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
        <!-- /top navigation -->
        
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>게시물관리</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>SHY게시물 관리</h2>
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
                    <p class="text-muted font-13 m-b-30">
                      <%-- DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> --%>
                             회원들의 게시물과 버튼을 통해 활성화/비활성화를 할수있는 페이지
                    </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>게시물번호</th>
                          <th>이름</th>
                          <th>성별</th>
                          <th>게시물내용</th>
                          <th>최종수정일</th>
                          <th>좋아요수</th>
                          <th>신고수</th>
                          <th>게시물상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="map" items="${memoList}" varStatus="status">
                        <tr align="center">
                          <td>${map.SNSNO}</td>
                          <td>${map.NAME}</td>
                          <td>${map.GENDER}</td>
                          <td>${map.SCONTENT}</td>
                          <td>${map.SDATEDTIME}</td>
                          <td>${map.SLIKECNT}</td>
                          <td>${map.SBLAMECNT}</td>
                        <td>
                        <c:if test="${map.STATUS != 0}">  
                  		<button onClick="javascript:location.href='shymemostatusDown.shy?snsno=${map.SNSNO}&name=${map.NAME}'">활성화</button>
                  		</c:if>
                  		<c:if test="${map.STATUS == 0}">
                  		<button onClick="javascript:location.href='shymemostatusUp.shy?snsno=${map.SNSNO}&name=${map.NAME}'">비활성화</button>
                  		</c:if>
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>			
                  </div>
                </div>
              </div>
            </div>
          </div>

        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <a href="open.shy">Shy</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

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
    <!-- Datatables -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.buttons.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/buttons.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/meong/buttons.flash.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/buttons.html5.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/buttons.print.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.fixedHeader.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.keyTable.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.responsive.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/responsive.bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/dataTables.scroller.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/jszip.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/pdfmake.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meong/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/meong/custom.min.js"></script>

  </body>
</html>