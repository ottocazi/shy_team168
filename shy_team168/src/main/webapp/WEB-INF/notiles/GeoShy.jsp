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

	<!-- Google chart  -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type='text/javascript' src='http://www.google.com/jsapi'></script>
		
	<!-- sweetalert2 -->
	<script src="https://cdn.jsdelivr.net/sweetalert2/latest/sweetalert2.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.css" rel="stylesheet" />
	
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	
	drawRegionsMap();

});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Create the chart
google.charts.load('current', {
    'packages':['geochart'],
    // Note: you will need to get a mapsApiKey for your project.
    // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
    // 내 키 확인하기 : https://developers.google.com/maps/documentation/javascript/get-api-key#key
    //					https://console.developers.google.com/apis/credentials/key/296?authuser=0&project=my-project-1495672880322&pli=1
    'mapsApiKey': 'AIzaSyCAcG-iSP1ZgpFHIX_lERGlomJZLls3i0s'
});

function drawRegionsMap() {
	
	$.ajax({
		url: "/shy/drawRegionsMap.shy",
		type: "GET",
		dataType: "JSON",
		success: function(count){
		//	alert("drawRegionsMap(); ajax success function!");
		//	alert("start count.Seoul : "+count.Seoul);
			//alert("data.FK_SNSNO"+data.FK_SNSNO);
			//[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]
			
			/* 
			var llArr = [ ['Latitude', 'Logditude','Population'],[37.5338151,126.89697839999997, 1] ];
			
	        var latitude = 0;
	        var longditude = 0;
	        var population = 0;
			$.each(data, function(entryIndex, entry){ 
				latitude = entry.LATITUDE;
				longditude = entry.LONGDITUDE;
				population++;
				llArr.push( [latitude,longditude,population] );
			});  
			
			alert("llArr : "+llArr);
			 */
//			var data = google.visualization.arrayToDataTable(llArr);
			
			var data = new google.visualization.DataTable();
			
			data.addColumn('string', 'Country');
			data.addColumn('number', 'Count'); 
			data.addColumn({type:'string', role:'tooltip'});var ivalue = new Array();
			// c: cell, v: value, f: format
			data.addRows([[{v:'KR-11', f:'서울특별시'},count.Seoul,'shy : '+count.Seoul+' 개']]);
			ivalue['KR-11'] = count.Seoul;
			
			data.addRows([[{v:'KR-26', f:'부산광역시'},count.Busan,'shy : '+count.Busan+' 개']]);
			ivalue['KR-26'] = count.Busan;
			
			data.addRows([[{v:'KR-27',f:'대구광역시'},count.Daegu,'shy : '+count.Daegu+' 개']]);
			ivalue['KR-27'] = count.Daegu;
			
			data.addRows([[{v:'KR-30',f:'대전광역시'},count.Daejeon,'shy : '+count.Daejeon+' 개']]);
			ivalue['KR-30'] = count.Daejeon;
			
			data.addRows([[{v:'KR-29',f:'광주광역시'},count.Gwangju,'shy : '+count.Gwangju+' 개']]);
			ivalue['KR-29'] = count.Gwangju;
			
			data.addRows([[{v:'KR-28',f:'인천광역시'},count.Incheon,'shy : '+count.Incheon+' 개']]);
			ivalue['KR-28'] = count.Incheon;
			
			data.addRows([[{v:'KR-31',f:'울산광역시'},count.Ulsan,'shy : '+count.Ulsan+' 개']]);
			ivalue['KR-31'] = count.Ulsan;
			
			data.addRows([[{v:'KR-43',f:'충청북도'},count.Chungcheongbugdo,'shy : '+count.Chungcheongbugdo+' 개']]);
			ivalue['KR-43'] = count.Chungcheongbugdo;
			
			data.addRows([[{v:'KR-44',f:'충청남도'},count.Chungcheongnamdo,'shy : '+count.Chungcheongnamdo+' 개']]);
			ivalue['KR-44'] = count.Chungcheongnamdo;
			
			data.addRows([[{v:'KR-42',f:'강원도'},count.Gangweondo,'shy : '+count.Gangweondo+' 개']]);
			ivalue['KR-42'] = count.Gangweondo;
			
			data.addRows([[{v:'KR-41',f:'경기도'},count.Gyeonggido,'shy : '+count.Gyeonggido+' 개']]);
			ivalue['KR-41'] = count.Gyeonggido;
			
			data.addRows([[{v:'KR-47',f:'경상북도'},count.Gyeongsangbugdo,'shy : '+count.Gyeongsangbugdo+' 개']]);
			ivalue['KR-47'] = count.Gyeongsangbugdo;
			
			data.addRows([[{v:'KR-48',f:'경상남도'},count.Gyeongsangnamdo,'shy : '+count.Gyeongsangnamdo+' 개']]);
			ivalue['KR-48'] = count.Gyeongsangnamdo;
			
			data.addRows([[{v:'KR-49',f:'제주도'},count.Jejudo,'shy : '+count.Jejudo+' 개']]);
			ivalue['KR-49'] = count.Jejudo;
			
			data.addRows([[{v:'KR-45',f:'전라북도'},count.Jeonrabugdo,'shy : '+count.Jeonrabugdo+' 개']]);
			ivalue['KR-45'] = count.Jeonrabugdo;
			
			data.addRows([[{v:'KR-46',f:'전라남도'},count.Jeonranamdo,'shy : '+count.Jeonranamdo+' 개']]);
			ivalue['KR-46'] = count.Jeonranamdo;	
			
			var options = {
	            region: 'KR', // 030 - Eastern Asia	CN, HK, JP, KP, KR, MN, MO, TW
	            colorAxis: {colors: ['#fffab1','#e8d59e', '#ffce97','#e8a48d', '#ffa4ad']}, // 지도 그라데이션 컬러
	            backgroundColor: '#ffffff', // 바다색
	            markerOpacity: 0.3,
	            datalessRegionColor: '#fff', // 한국아닌지역색
	            defaultColor: '#aofff0',
	            displayMode: 'regions', 
				enableRegionInteractivity: 'true', 
				resolution: 'provinces',
	        };
	
	        var chart = new google.visualization.GeoChart(document.getElementById('geochart-colors'));
	        
//	        var chart = new google.visualization.GeoChart(document.getElementById('visualization')); 
			google.visualization.events.addListener(chart, 'select', function() {
			 	var selection = chart.getSelection();
			 	if (selection.length == 1) {
			 		var selectedRow = selection[0].row;
			 		var selectedRegion = data.getValue(selectedRow, 0);
			 		var sivalue = ivalue[selectedRegion];
		 		//	alert("selection : "+selection+" selectedRegion : "+selectedRegion + "     sivalue : "+sivalue);
		 		//	alert(typeof(selection));
		 			
			 		detailMap(selectedRegion,sivalue);
			 	}
			});
			
			chart.draw(data, options);
	        
		}, error: function(request, status, error){
			alert("drawRegionsMap(); ajax error function!");
		} 
	});
}

function detailMap(selectedRegion,sivalue){
//	alert("detailMap() start! selectedRegion : "+selectedRegion+"  sivalue : "+sivalue);
	var specs = "left=600,top=200,width=900,height=700"
	var param_RS= document.param_RS;
	var gsWin = window.open('about:blank','popupView',specs);
    var frm =document.param_RS;
    
    frm.selectedRegion.value = selectedRegion;
    frm.sivalue.value = sivalue;
    frm.action = 'geodetail.shy';
    frm.target ="popupView";
    frm.method ="post";
    frm.submit();
  
	/* 
		여기에 오버레이 상세 지도 및 기타지역(count.ect) 표시 하는 거 만들면 될듯
		참고사이트 : https://developers.google.com/chart/interactive/docs/overlays#css2
	*/
	/* 
		대한민국의 시도별 행정 구역 분류
		참고사이트 : https://ko.wikipedia.org/wiki/%EB%B6%84%EB%A5%98:%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EC%8B%9C%EB%8F%84%EB%B3%84_%ED%96%89%EC%A0%95_%EA%B5%AC%EC%97%AD
	*/
	
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function drawVisualization(){
	
	$.ajax({
		url: "/shy/drawRegionsMap.shy",
		type: "GET",
		dataType: "JSON",
		success: function(data){
		//	alert("drawRegionsMap(); ajax success function!");
		//	alert(data);
			/* 
			지역별 shy 수 
			 */
			var data = new google.visualization.DataTable();

				data.addColumn('string', 'Country');
				data.addColumn('number', 'Value'); 
				data.addColumn({type:'string', role:'tooltip'});var ivalue = new Array();
				
				data.addRows([[{v:'KR-11', f:'Seoul Teugbyeolsi'},0,'Click to change background color']]);
				ivalue['KR-11'] = '#3182BD';
				
				data.addRows([[{v:'KR-26', f:'Busan Gwang\'yeogsi'},1,'Click to change background color']]);
				ivalue['KR-26'] = '#3182BD';
				
				data.addRows([[{v:'KR-27',f:'Daegu Gwang\'yeogsi'},2,'Click to change background color']]);
				ivalue['KR-27'] = '#3182BD';
				
				data.addRows([[{v:'KR-30',f:'Daejeon Gwang\'yeogsi'},3,'Click to change background color']]);
				ivalue['KR-30'] = '#3182BD';
				
				data.addRows([[{v:'KR-29',f:'Gwangju Gwang\'yeogs'},4,'Click to change background color']]);
				ivalue['KR-29'] = '#3182BD';
				
				data.addRows([[{v:'KR-28',f:'Incheon Gwang\'yeogsi'},5,'Click to change background color']]);
				ivalue['KR-28'] = '#3182BD';
				
				data.addRows([[{v:'KR-31',f:'Ulsan Gwang\'yeogsi'},6,'Click to change background color']]);
				ivalue['KR-31'] = '#3182BD';
				
				data.addRows([[{v:'KR-43',f:'Chungcheongbugdo'},7,'Click to change background color']]);
				ivalue['KR-43'] = '#3182BD';
				
				data.addRows([[{v:'KR-44',f:'Chungcheongnamdo'},8,'Click to change background color']]);
				ivalue['KR-44'] = '#3182BD';
				
				data.addRows([[{v:'KR-42',f:'Gang\'weondo'},9,'Click to change background color']]);
				ivalue['KR-42'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-41',f:'Gyeonggido'},10,'Click to change background color']]);
				ivalue['KR-41'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-47',f:'Gyeongsangbugdo'},11,'Click to change background color']]);
				ivalue['KR-47'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-48',f:'Gyeongsangnamdo'},12,'Click to change background color']]);
				ivalue['KR-48'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-49',f:'Jejudo'},13,'Click to change background color']]);
				ivalue['KR-49'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-45',f:'Jeonrabugdo'},14,'Click to change background color']]);
				ivalue['KR-45'] = '#9ECAE1';
				
				data.addRows([[{v:'KR-46',f:'Jeonranamdo'},15,'Click to change background color']]);
				ivalue['KR-46'] = '#9ECAE1';
				
		//	alert("data : "+data);	// [object, Object]
				
			var options = {
				backgroundColor: {fill:'#FFFFFF',stroke:'#FFFFFF' ,strokeWidth:0 },
				colorAxis:  {minValue: 0, maxValue: 21,  colors: ['#3182BD','#3182BD','#3182BD','#3182BD','#3182BD','#3182BD','#3182BD','#3182BD','#3182BD','#9ECAE1','#9ECAE1','#9ECAE1','#9ECAE1','#9ECAE1','#9ECAE1','#9ECAE1','#9ECAE1','#DEEBF7','#DEEBF7','#DEEBF7','#DEEBF7','#DEEBF7',]},
				legend: 'none',	
				backgroundColor: {fill:'#FFFFFF',stroke:'#FFFFFF' ,strokeWidth:0 },	
				datalessRegionColor: '#f5f5f5',
				displayMode: 'regions', 
				enableRegionInteractivity: 'true', 
				resolution: 'provinces',
				sizeAxis: {minValue: 1, maxValue:1,minSize:10,  maxSize: 10},
				region:'KR', //country code
				keepAspectRatio: true,
				width:600,
				height:400,
				tooltip: {textStyle: {color: '#444444'}, trigger:'focus'}
	        };
	
			var chart = new google.visualization.GeoChart(document.getElementById('visualization')); 
			google.visualization.events.addListener(chart, 'select', function() {
			 	var selection = chart.getSelection();
			 	if (selection.length == 1) {
			 		var selectedRow = selection[0].row;
			 		var selectedRegion = data.getValue(selectedRow, 0);
			 		if(ivalue[selectedRegion] != '') {
			 			document.getElementsByTagName('body')[0].style.background=ivalue[selectedRegion]; 
			 		}
			 	}
			});
			
	        chart.draw(data, options);
	        
		}, error: function(request, status, error){
			alert("drawRegionsMap(); ajax error function!");
		} 
	});
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
              	<img src="<%= request.getContextPath() %>/resources/images/juno/hjuydf.jpg" alt="피카츄 볼때기" class="img-circle profile_img" />pikachu
                
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
                  <li><a><i class="fa fa-home"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/shymember.shy">유저조회</a></li>
                      <li><a href="#">게시물관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 회사관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">회사개요</a></li>
                      <li><a href="#">채용공고</a></li>
                      <li><a href="#">사업제안</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 통계상세 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%= request.getContextPath() %>/tongke.shy">통계상세보기</a></li>
                      <li><a href="<%= request.getContextPath() %>/gesimulTK.shy">좋아요가 가장많은 유저</a></li>
                      <li><a href="#">신고를 많이받은 유저</a></li>
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
                    <img src="<%= request.getContextPath() %>/resources/images/juno/hjuydf.jpg" alt="피카츄 볼때기" />pikachu
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
                        <span class="image"><img src="<%= request.getContextPath() %>/resources/images/juno/hjuydf.jpg" alt="피카츄 볼때기"></span>
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
                        <!-- <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
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
                        <!-- <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
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
                        <!-- <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
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
                <h3>통계상세보기 <small>통계상세보기페이지</small></h3>
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
                  <div class="x_title" style="margin-bottom: 50px;">
                    <h2>shy 위치별 접속자 통계</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content" style="margin-bottom: 50px;">
                    <form name="param_RS">
                    	<input type="hidden" name="selectedRegion"/>
                    	<input type="hidden" name="sivalue" />
                    </form>
                    <div id="geochart-colors"></div>
                    <div id="visualization"></div>
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
	
	
	<!-- GoogleMap Scope  -->
	<!-- 
		SensorNotRequired	경고	
		이제 Google Maps JavaScript API에서 sensor 매개변수가 더 이상 필요하지 않습니다. 
		Google Maps JavaScript API는 올바로 작동하겠지만, 스크립트 요소에서 sensor를 제거하는 것이 좋습니다. 
	-->
	<!-- <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script> -->
  </body>
</html>