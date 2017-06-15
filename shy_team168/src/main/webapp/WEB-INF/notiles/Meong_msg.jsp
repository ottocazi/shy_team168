<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css">

<script type="text/javascript">

$(document).ready(function() {
	swal({ 
	  	title:  "${title}", 
	   	text: 	"${msg}",
	    type: 	"${type}" // 설명 :  warning, error, success, info and question
	  },
	  
	  function(){
	    window.location.href = "${loc}";
	});
});
</script>
