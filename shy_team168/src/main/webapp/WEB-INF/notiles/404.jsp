<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
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
    
    		
			<div id="dd__container" style="margin-top:150px;">



	<div id="dd__outer">
	
		<div id="dd__inner" align="CENTER">
		<img src="<%=request.getContextPath()%>/resources/images/ddung/heartlogo.png" />
			
			<div>
			<i>존재하지 않는 페이지입니다.</i><br><br><br>
			<button type="button" id="btnAuthCode" class="dd_button dd_button5" onclick="location.href='/shy/'">로그인/회원가입 하러가기</button>
			</div>
			
			
			
			</div>
		</div>
	</div>