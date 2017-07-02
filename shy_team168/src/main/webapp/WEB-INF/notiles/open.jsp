<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css">

<script type="text/javascript">
   $(document).ready(function(){
      
      $("#sign").hide();
      $("#joinus").hide();
      
      $(".goRegister").click(function(){
         $("#sign").show();
         $("#joinus").show();
         
         $("#signin").hide();
         $("#register").hide();
      });
      
      $(".goLogin").click(function(){
         $("#signin").show();
         $("#register").show();
         
         $("#sign").hide();
         $("#joinus").hide();
      });
      
  
      $("#loginend").click(function(event){

 		 var email = $("#email").val(); 
		 var pwd = $("#pwd").val(); 
			
			 if(email.trim()=="") {
				swal({title: "아이디를 입력하세요!!",type: "warning"},		  
				function(){
				    window.location.href = "";
				});
				 event.preventDefault();
				 return;
			 }
			
			 if(pwd.trim()=="") {
				swal({title: "비밀번호를 입력하세요!!", type: "error"},		  
				function(){
				    window.location.href = "";
				});
				 event.preventDefault();
				 return;
			 }

			 document.loginform.action = "loginEnd.shy";
			 document.loginform.method = "post";
			 document.loginform.submit();
		}); 
      
   });
   
	function goAdd() {
		var addFrm = document.addFrm;
		addFrm.submit();
	}
   
</script>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/css/0common/open.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>shy</title>
</head>
<body>
<div id="main">
  
  <div id="login">
     <div id="signin" style="min-height:385px;">
   <div class="form-title">
   
   <span class="letter" id="shy" data-letter="s">s</span>
   <span class="letter" id="shy" data-letter="h">h</span>
   <span class="letter" id="shy" data-letter="y">y</span>
   <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
   </div>
   <p style="color: #BBBBBB; font-size: 10pt">친구들의 새소식이 궁금하시다면 <br>지금 바로 샤이로 로그인하세요</p>
   <form name="loginform">
   <div class="form-input">
		
      		<input type="text" placeholder="email" name="email" id="email"/>
      		<input type="password" placeholder="password" name="pwd" id="pwd"/>
     	
   </div>
   <br>
   <a href="" class="forgot-pw">비밀번호를 잊으셨나요?</a>
   <button class="login" id="loginend" type="submit">Login</button>
   </form> 
   </div>
   
   <div id="joinus" style="min-height: 385px;">
   <div class="form-title">
   <span class="letter" id="shy" data-letter="s">s</span>
   <span class="letter" id="shy" data-letter="h">h</span>
   <span class="letter" id="shy" data-letter="y">y</span>
   </div>
   <p style="color: #BBBBBB; font-size: 10pt">가족, 친구와 함께하는 <br>즐거운 경제활동에 참여하세요 </p>
   <div class="form-input" >
   	  <form name="addFrm" action="<%= request.getContextPath() %>/addregistorEnd.shy" method="post">
	      <input type="text" placeholder="name" name="name" id="name"/>
	      <input type="text" placeholder="email" name="email" id="email"/>
	      <input type="password" placeholder="password" name="pwd" id="pwd"/>
	      <input type="password" placeholder="password" name="chkpwd" id="chkpwd"/>
	  </form>    
   </div>
   
   <button class="login" type="button" onClick="goAdd();">JOIN</button>
   </div>
  
     <div id="register">
   <p style="color: #BBBBBB; font-size: 10pt">아직 회원이 아닌가요? <a class="goRegister" style="cursor:pointer">가입하기</a></p>
     </div>
     <div id="sign">
   <p style="color: #BBBBBB; font-size: 10pt">이미 회원이신가요? <a class="goLogin" style="cursor:pointer">로그인하기</a></p>
     </div>
  </div>
  
  <div id="intro">
    
     <p ><i><b>15 : 20 pm</b></i><br/>
     <span style="font-size:9pt; color:gray;">
        
      	결제, 막힘없는 시원함을 담다.<br/>
      	단 하나 남은 신상 가을 의류,<br/>
      	단숨에 결제하고 shy로 기뻐한다.<br/>
      	</span>
   </p>
     
     <p>
        <i><b>12 : 10 pm</b></i><br/>
        <span style="font-size:9pt; color:gray;">
      		송금, 즐거운 만남에 편리함을 담다.<br/>
      		지인들과 즐거운 점심식사! 맛있게 먹고 밥값 정산 할 땐<br/>
      		계좌번호 묻지 않고 이젠 shy로 사이좋게 계산완료!<br/></span>
     </p>
     
  </div>
  
</div>
</body>
</html>