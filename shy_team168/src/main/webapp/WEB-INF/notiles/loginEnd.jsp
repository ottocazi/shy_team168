<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css">

<script type="text/javascript">
	<c:if test="${n == 1}">	
		$(document).ready(function() {
			swal({ 
			  	title:  "로그인 성공 !!", 
			   	text: 	"메인페이지로 이동하겠습니다~",
			    type: 	"success" // 설명 :  warning, error, success, info and question
			  },
			  function(){
			    window.location.href = "<%= request.getContextPath() %>/mainline.shy";
			});
		});	
	</c:if>
		
	<c:if test="${n == 0}">
		$(document).ready(function() {
			swal({ 
			  	title:  "암호가 틀립니다 !!", 
			   	text: 	"아이디와 암호를 다시입력하세요~",
			    type: 	"error" // 설명 :  warning, error, success, info and question
			  },
			  function(){
			    window.location.href = "javascript:history.back()";
			});
		});	
	</c:if>
	
	<c:if test="${n == -1}">
		$(document).ready(function() {
			swal({ 
			  	title:  "아이디가 존재하지 않습니다.!!", 
			   	text: 	"회원가입부터 하세요~~",
			    type: 	"error" // 설명 :  warning, error, success, info and question
			  },
			  function(){
			    window.location.href = "javascript:history.back()";
			});
		});	
	</c:if>

</script>
    