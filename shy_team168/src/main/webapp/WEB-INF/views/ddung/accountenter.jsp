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
</head>

<body>
<div id="dd__container">



	<div id="dd__outer">
	
		<div id="dd__inner" align="CENTER">
		<img src="<%=request.getContextPath()%>/resources/images/ddung/ACCOUNT.png" />
			
			<div style="margin-left: 10%;">
			<button class="dd_button dd_button5">계좌등록하기</button>
			</div>
			
			
			
			</div>
		</div>
	</div>
</div>
</body>