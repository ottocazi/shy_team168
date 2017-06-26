<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/latest/sweetalert2.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.css" rel="stylesheet"/>

<script type="text/javascript">

$(document).ready(function() {
	swal({ 
	  	title:  "${title}", 
	   	text: 	"${msg}",
	    type: 	"${type}" // 설명 :  warning, error, success, info and question
	  }).then(function(){
	    location.href = "${loc}";
	});
});
</script>
