<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css">

<script type="text/javascript">

<c:if test="${sessionScope.loginuser == null}">
	$(document).ready(function() {
		swal({ 
		  	title:  "로그아웃 되었습니다.", 
		    type: 	"success" // 설명 :  warning, error, success, info and question
		  },
		  
		  function(){
		    window.location.href = "<%= request.getContextPath() %>/open.shy";
		});
	});
</c:if>

</script>
    