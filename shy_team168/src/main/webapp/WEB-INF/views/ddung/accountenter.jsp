<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<!-- <style>
#dd__container {
	width: 100%;
	margin: 20px auto;
	
	
}

#dd__outer {
	display: table;
	width: 100%;
	height: AUTO;
	
}

#dd__inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

#dd__centered {
	position: relative;
	display: inline-block;
	width: 50%;
	min-height : 680PX;
	padding: 1em;
	/* color: WHITE; */
	vertical-align: middle;
	text-align: center;
	
}

#no_opacity{

color : black;
}

</style>
 -->

<style>
.dd_button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


.dd_button5 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

</style>

<script>
	function accountenter(){
		
		window.open("https://twww.open-platform.or.kr/apt/mobileweb/authorize?client_id=l7xx44e66d20db084a0d85446ca30beaff9b&client_secret=0f1cbba16a2840849ac0b381288dba29&response_type=code&scope=login+transfer&redirect_uri=http%3A%2F%2Flocalhost%3A8880%2Fshy_FinTech_server%2Fhtml%2Fcallback.html&client_info=shy+%3A+%ED%95%80%ED%85%8C%ED%81%AC+%ED%85%8C%EC%8A%A4%ED%8A%B8%EC%9A%A9+%EC%84%9C%EB%B2%84+%2F+DB+&auth_type=0&bg_color=%23fafafa&txt_color=%23000000&btn1_color=%23d9d9db&btn2_color=%23d9d9db&invoke_type=ajax&sessionID=3e8eeb37-69dc-4f76-915d-3f3b47893680&action=Grant&api_tran_id=fc3a9b66-f3b5-4512-862e-57cad0485d15&gw_svc_id=793ca84b51e6c631d339e5180897dc2b&gw_app_key=l7xx44e66d20db084a0d85446ca30beaff9b&scope=login%20transfer&redirect_uri=http://localhost:8880/shy_FinTech_server/html/callback.html&auth_type=0", 'shy에 계좌등록하기', "height=500,width=500");
	}

</script>
</head>

<body>
<div id="dd__container">



	<div id="dd__outer">
	
		<div id="dd__inner" align="CENTER">
		<img src="<%=request.getContextPath()%>/resources/images/ddung/ACCOUNT.png" />
			
			<div style="margin-left: 10%;">
			<button class="dd_button dd_button5" onclick="accountenter();">계좌등록하기</button>
			</div>
			
			
			
			</div>
		</div>
	</div>
</div>
</body>