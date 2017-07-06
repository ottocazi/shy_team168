<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/mypage.css">

 <!-- 타임라인소스 -->
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/timelinestyle.css">

 <!-- 코멘트박스 소스 -->
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/commentboxstyle.css">

<script>
    function openComment() {
	
	   var commentbox = document.getElementById('commentbox');
	   
	
	   if(commentbox.style.display=='none'){
		   commentbox.style.display = 'block';
	    }else{
	        commentbox.style.display = 'none';
	    }

	} 
     
    function goEdit() {
		var frm = document.mypageFrm;
		
		frm.action = "myInfoEdit.shy";
		frm.method = "GET";
		frm.submit();
	}
    
    $(document).ready(function(){
    	$('.bt-love_chg').hide();
    	//countComment();
      
    	$('#showFlwList').hide();
    	
        getLike();
        
        $('#showFlwList').click(function(e){
     	   $('#showFlwList').hide(); 
        });
       
        $('.flwList').click(function(e){
           
            // 팔로우목록 Ajax 불러오기
             $.ajax({
                 url: "/shy/myfollowList.shy",
                 type: "GET",
                 dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
                 /* data: , */
                 success: function(data) { // 성공했을 때의 처리 콜백함수
                	 if(data.length > 0) {
	                	 var Result="";
	                 
	                    $.each(data,function(entryIndex,entry){
	                     var html = "<img src='/shy/resources/images/shydb/"+entry.myimg+"' style='width:30px; hegiht:30px;'/>"
	                     			+"<span>"+entry.email+"&nbsp;&nbsp;Following..</span>";
	                     	Result += "<span style='cursor: pointer;'>" + html + "</span><br/>";
	                     	
	                    });
	                    $("#showFlwList").html(Result).show(); 
	                    
                	}else{
                		$('#showFlwList').hide();	
                	}
                 },
                 error: function() { // 에러가 발생했을 때의 콜백함수
                     alert("error");
                 }
             });
            
        });
       
       
       
    });// end of $(document).ready() --------
    
    function goLike(idx,likeseq,liketype,seqcolum){
      var form_data = {idx : idx,
                   likeseq   : likeseq,
                   liketype   : liketype,
                   seqcolum   : seqcolum};
      
       // 좋아요 Ajax 불러오기
        $.ajax({
            url: "/shy/like.shy",
            type: "GET",
            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
            data: form_data ,// 파라미터     
            success: function(data) { // 성공했을 때의 처리 콜백함수
               
               getLike();
               
            },
            error: function() { // 에러가 발생했을 때의 콜백함수
                alert("error");
            }
        });
       
   }
    
    function getLike(){
       var snsnoArr = new Array();
       
        <c:if test="${myshyList!=null}">
        <c:forEach items="${myshyList}" var="shies">
        // alert('${shies.snsno}');
        snsnoArr.push("${shies.snsno}");
        </c:forEach>
        </c:if>
        //alert(snsnoArr);
         
        jQuery.ajaxSettings.traditional = true;
      
       // 좋아요목록 Ajax 불러오기
        $.ajax({
            url: "/shy/likeList.shy",
            type: "GET",
            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
            data: {snsnoArr:snsnoArr},
            success: function(data) { // 성공했을 때의 처리 콜백함수
               var snsnoObjArr = [];
               
               $.each(data,function(entryIndex,entry){
                  snsnoObjArr.push([entry.snsno,Number(entry.totalcount),Number(entry.mylikestat) ]);
                  if(Number(entry.mylikestat) == 1) {
                     if(Number(entry.totalcount) >0){
                        $('#bt-love'+entry.snsno).hide();
                        $('#love'+entry.snsno).empty();
                        
                        var html = '<span>'+entry.totalcount+'</span>';
                        $('#love'+entry.snsno).html(html).show();
                     }else{
                        $('#bt-love'+entry.snsno).hide();
                        $('#love'+entry.snsno).show();
                     }
                     
                  }else{
                     $('#bt-love'+entry.snsno).show();
                     $('#love'+entry.snsno).hide();
                  }
                  
               });
               

               
            },
            error: function() { // 에러가 발생했을 때의 콜백함수
                alert("error");
            }
        });
       
   }
    
</script>
<style type="text/css">
.bt, .proedit {
    text-align: center;
    font-weight: 600;
    cursor: pointer;
    line-height: 1;
    background: #88d;
    border: none;
    color: #fff;
    padding: 5px;
}
.bt:hover, .proedit:hover {
    text-align: center;
    padding: 5px;
    font-weight: 600;
    cursor: pointer;
    line-height: 1;
    background: #fff;
    color: #88d;
}
.readmore{
    text-align: center;
    padding: 14px 24px;
    font-weight: 600;
    cursor: pointer;
    line-height: 1;
    background: #88d;
}
</style>
</head>
<body>
<div id="mypage" align="center">
      
      <form name="mypageFrm">
      <div class="myProfile" style="text-align: left">
         <div class="pimg">
         <c:if test="${loginuser.myimg != null}">
            <img src="<%=request.getContextPath() %>/resources/images/shydb/${loginuser.myimg }">
         </c:if>
         <c:if test="${loginuser.myimg == null}"> 
            <img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
         </c:if>
         </div>
         <div class="myIntro">
            <h2 style="display: -webkit-inline-box;">${loginuser.email}</h2>
            <button class="bt" title="Follow" onclick="goFollow();">
               Follow
            </button>
            <hr>
            <span>게시물&nbsp; 
            	<c:if test="${snsnocnt==0}" >
	            0
	            </c:if>
            	<c:if test="${snsnocnt>0}" >
	            ${snsnocnt }
	            </c:if>
            	개</span>&nbsp;&nbsp;
            <span class="flwList">팔로우&nbsp; 
	            <c:if test="${fk_idxflwedcnt==0 }" >
	            0
	            </c:if>
	            <c:if test="${fk_idxflwedcnt>0 }" >
	            ${fk_idxflwedcnt } 
	            </c:if>
                      명</span>&nbsp;&nbsp;
            <div id="showFlwList">
            </div>
            <span>그룹&nbsp; 1개</span>&nbsp;&nbsp;
            <button class="proedit" onclick="goEdit();">프로필편집</button>
            <c:if test="${loginuser.myintro != null}">
            <p style="padding-top:30px;">
                ${loginuser.myintro}
            </p>
            </c:if>
            <c:if test="${loginuser.myintro == null}">
            <p style="padding-top:30px;">
               	 자기소개가 없습니다.
            </p>
            </c:if>
         </div>
      </div>
      </form>
      
      <div class="showMypage">

          <div id="myTabContent" class="tab-content">
               
               <main role="main"><!--지우지 마세요  -->
  
  <c:if test="${myshyList==null}">
  	아직 등록된 글이 없습니다.
  	친구들에게 shy 해보세요!!
  </c:if>
  
  <c:if test="${myshyList!=null}">
  <c:forEach items="${myshyList }" var="shies" varStatus="status" >
  <c:set var="myimg" value="${shies.myimg }"/>	
  	<article class="card-60 social">
    <figure>
      
      <img src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr }" alt="shy" id="nike">
      
    </figure>
    <!-- end figure-->
    <div class="flex-content">
       
 <header style="text-align: left">
        <p class="user">
          <c:if test="${shies.myimg != null}">
          <img class="avatar-32" src="<%=request.getContextPath() %>/resources/images/shydb/${shies.myimg }" alt="Avatar">
          </c:if>
          <c:if test="${shies.myimg == null}">
          <img class="avatar-32" src="http://magazine.nicktv.it/wp-content/uploads/sites/11/2016/09/Spongebob-Finalmente-Si-Mangia.gif" alt="Avatar">
          </c:if>
          <strong>
               <a title="Full Name" href="#">
                  <span style="font-size: 12pt; margin:0; color:black;">
	                  
	                <c:if test="${shies.name!=null }">
	                ${shies.name }
	                </c:if> 
                  
                  	<c:if test="${shies.name==null }">
                  	${shies.email }
                  	</c:if>
                  
                  </span>
               </a>
            </strong>
          <span>${shies.sdatedtime} &middot; <a href="">@파파파</a> 님과 함께</span>
        </p>
      </header>

      <p class="subinfo" style="text-align: left">
             <a class="location" title="Location" href="" >
               당산역 맥도날드 앞 사거리에서 shy
         </a>
        </p>
       <p style="text-align: left">
       	${shies.scontent }
      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love"
								onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','1','snsno')"
								id="bt-love${shies.snsno }"> Love </a> <a class="bt-love_chg"
								title="Love" id="love${shies.snsno }"> </a> <a class="bt-share"
								title="Share" href="#"> Share </a> <a
								href="javascript:openComment('${shies.snsno}');"
								class="bt-comment" title="Comment" id="comment${shies.snsno}">
							</a>
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a href="javascript:openComment();"class="bt-comment" title="Comment" href="">
               댓글(33)
            </a>
        </p>
      </footer>
    </div>
    
      <!--new댓글창  -->
    
      
     <div id="commentbox" class="shy_comments-app" style="margin-top:0; display:none;" ><!--ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl"  -->
  
  
  <!-- Form -->
  <div class="shy_comment-form">
    <!-- Comment Avatar -->
    <div class="shy_comment-avatar">
      <img src="http://lorempixel.com/200/200/people">
    </div>

    <form class="shy_form" name="form" ng-submit="form.$valid && cmntCtrl.addComment()" novalidate>
      <div class="shy_form-row">
        <textarea class="shy_input" ng-model="cmntCtrl.comment.text"  placeholder="댓글로 이야기를 나눠보세요" required></textarea>
      </div>


      <div class="shy_form-row">
        <input type="submit" value="올리기">
      </div>
    </form>
  </div>

  <!-- Comments List -->
  <div class="shy_comments">
    <!-- Comment -->
   

    <!-- Comment - Dummy -->
    <div class="shy_comment"><!-- for each 돌리는 div  -->
      <!-- Comment Avatar -->
      <div class="shy_comment-avatar">
        <img src="" alt="프로필">
      </div>

      <!-- Comment Box -->
      <div class="shy_comment-box">
        <div class="shy_comment-text">짧은 댓글 test1</div>
        <div class="shy_comment-footer">
          <div class="shy_comment-info">
            <span class="shy_comment-author">
              <a href="">유저명</a>
            </span>
            <span class="shy_comment-date">댓글작성시간</span>
          </div>

          <div class="shy_comment-actions">
            <a href="#"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true" ></i></a>
          </div>
        </div>
        

      </div>
	
	               
      
    </div><!-- for each 돌리는 div끝  -->

		<div align="center"><a class="button" href="#" style="color:white; ">
					read more
				</a>
   </div>
  </div>
</div>
    <!--new댓글창 end  -->
    
    <!-- end .flex-content-->
  </article>
  
  
  <!-- post foreach 마무리  -->
  	
  	
  </c:forEach>
  </c:if>
  
  <div align="center"><a class="readmore" href="#" style="color:white; " >
					더 읽기
				</a><br><br>
   </div>
	</main> <!-- 한 개의 shy 끝  -->
               
               
               
          </div>
          
      </div>

</div>
