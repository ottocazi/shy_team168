<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/shy_top.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
 <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

 <script src="https://cdn.jsdelivr.net/sweetalert2/latest/sweetalert2.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.css" rel="stylesheet"/>
 <%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/newAlert/sweetalert.css"> --%>

<script>/* 글쓰기 펑션  */


 
	function shynow() {
	
		swal({
			  html:
			  '<div style="text-align: left;">'+
			  '<form name="shynowform">'+
			  '<span style="font-size:16pt; color:navy; ">${loginuser.email}</span>  님의 샤이 기록하기&nbsp;&nbsp;'+
			  '<select name="status" id="status"> <option value="1">전체 공개</option>'+
			    '<option value="2">친구 공개</option>'+
			    '<option value="0">나만 보기</option>'+
			    '</select>'+
			    '<input type="hidden" name="userseq" value="${loginuser.idx}"/>'+
				'<textarea id="content" name="content" class="swal2-textarea" placeholder=""></textarea>'+
				'<span style="font-size:10pt;">누구와 함께 계신가요? &nbsp;&nbsp;</span>'+ 
				'<input id="ftag" name="ftag" placeholder=""/><br><br>'+
				'<span style="font-size:10pt;">어디에 계신가요? &nbsp; &nbsp;</span>'+ 
				'<input id="shyplace" name="shyplace" placeholder="배고파덕"/>' +
				'<br><br><input type="file" id="uploader" name="image" />'+
				'</form></div>',
			  width:'640px',
			  showCloseButton:true,
			  allowOutsideClick : false
			  
			  
		      
			  
			}).then(function (content) {
			  if (content) {
			    /*formData 추가?  */
				  document.shynowform.method = "post";
				  document.shynowform.action = "shynow.shy";
				  document.shynowform.submit();
				  
			  }
			})
	
}; // shynow END


    
</script>



<style>
   

#status {
 font-size : 10pt;
 border-left: hidden; 
 border-right:hidden;
 border-top : hidden;
 border-bottom: hidden;
}

#ftag, #shyplace{
 
 border-left: hidden; 
 border-right:hidden;
 border-top : hidden;
}

#shy{
  font-family: 'Lato', sans-serif;
}


.letter{
  display: inline-block;
  font-weight: 900;
  font-size: 2em;
  margin: 0.03em;
  position: relative;
  color: #00B4F1;
  transform-style: preserve-3d;
  perspective: 500;
  z-index: 1;
}
.letter:before, .letter:after{
  position:absolute;
  content: attr(data-letter);
  transform-origin: top left;
  top:0;
  left:0;
}
.letter, .letter:before, .letter:after{
  transition: all 0.3s ease-in-out;
}
.letter:before{
  color: #fff;
  text-shadow: 
    -1px 0px 1px rgba(255,255,255,.8),
    1px 0px 1px rgba(0,0,0,.8);
  z-index: 3;
  transform:
    rotateX(0deg)
    rotateY(-15deg)
    rotateZ(0deg);
}
.letter:after{
  color: rgba(0,0,0,.11);
  z-index:2;
  transform:
    scale(1.08,1)
    rotateX(0deg)
    rotateY(0deg)
    rotateZ(0deg)
    skew(0deg,1deg);
}
.letter:hover:before{
  color: #fafafa;
  transform:
    rotateX(0deg)
    rotateY(-40deg)
    rotateZ(0deg);
}

.letter:hover:after{
  transform:
    scale(1.08,1)
    rotateX(0deg)
    rotateY(40deg)
    rotateZ(0deg)
    skew(0deg,22deg);
}

.shy_topnavbar a:hover {
	background-color: #fff;
}

</style>



</head>

<!-- <body id="page-top"> -->
<header id="page-top">

<!-- <div style="margin-bottom:10px;">
</div> -->
<nav class="shy_topnavbar shy_topnavbar-fixed-top " style="background-color: white;">
  <div class="shy_top_container-fluid">
    <div class="shy_topnavbar-header">
      <a class="shy_topnavbar-brand" href="#">
       <span class="letter" id="shy" data-letter="s">s</span>
   				<span class="letter" id="shy" data-letter="h">h</span>
   				<span class="letter" id="shy" data-letter="y">y</span>
      </a>
    </div>
    
    <ul class="shy_topnav shy_topnavbar-shy_topnav shy_topnavbar-right">
    <li><a href="javascript:shynow();"><i class="fa fa-pencil fa-2x" aria-hidden="true" style="color:red;"></i></a></li>
      <li><a href="#"><i class="fa fa-street-view fa-2x" aria-hidden="true" style="color:#98DDDE;"></i></a></li>
      <li><a href="#"><i class="fa fa-heartbeat fa-2x" aria-hidden="true" style="color:#F7786B;"></i></a></li>
      <li><a href="#"><i class="fa fa-bolt fa-2x" aria-hidden="true" style="color:#FAE03C;"></i></a></li>
      <li><a href="#"><i class="fa fa-credit-card fa-2x" aria-hidden="true" style="color:#F2552C;"></i></a></li>
      <li><a href="#"><i class="fa fa-map-marker fa-2x" aria-hidden="true" style="color:#B76BA3;"></i></a></li>
      
    </ul>
    
    <form class="shy_topnavbar-form">
      <div class="shy_top_form-group">
        <input  type="text" class="shy_top_form-control" placeholder="" style="border-radius: 10px;">&nbsp;
       
      </div>
      
      <input type="hidden" class="shy_top_btn"  id="search" onclick="goSearch();"><!-- style="border: hidden;" -->
      <label for="search" style="cursor: pointer;"><i class='fa fa-search'></i></label> 
    </form>
  </div >
  
  
</nav>

</header>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->

<div style="width:0; height: 0;" id="noexists">


</div>
    