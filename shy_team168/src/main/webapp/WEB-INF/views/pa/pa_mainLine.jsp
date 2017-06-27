<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

     <!-- 타임라인소스 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/timelinestyle.css">

     <!-- 코멘트박스 소스 -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ddung/commentboxstyle.css">
    
    <!-- 아이콘 통일 소스주소: http://materializecss.com/icons.html -->
   <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->


    <!-- <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"> -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'> --> 
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     
    <script>
    function openComment(event) {
	
	   var commentbox = document.getElementById('commentbox'+event);
	   
	
	   if(commentbox.style.display=='none'){
		   commentbox.style.display = 'block'; 
	    }else{
	        commentbox.style.display = 'none';
	    }

	} 
   
    /* function snsLike(idx,likeseq){
    	var frm = document.likeFrm;
    	var liketype = document.getElementById('liketype').value.trim();
    	var seqcolum =  document.getElementById('seqcolum').value.trim();
    	
    	alert('idx='+idx);
    	alert('likeseq='+likeseq);
    	alert('seqcolum='+seqcolum);
    	alert('liketype='+liketype);  // 확인용 
    	
    	frm.action = "like.shy";
    	frm.method = "POST";
    	frm.idx.value = idx;
    	frm.likeseq.value = likeseq;
    	frm.liketype.value = liketype;
    	frm.seqcolum.value = seqcolum;
    	frm.submit();
    } */
    
    $(document).ready(function(){
    	
    	$('.bt-love_chg').hide();
    	
    	
   
    
    function goLike(idx,likeseq,liketype,seqcolum){
		var form_data = {idx : idx,
						 likeseq	: likeseq,
						 liketype	: liketype,
						 seqcolum	: seqcolum};
		
		/* alert(idx);
		alert(likeseq);
		alert(liketype);
		alert(seqcolum);
		alert(form_data); */
		
		 // 좋아요 Ajax 불러오기
        $.ajax({
            url: "/shy/like.shy",
            type: "GET",
            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
            data: form_data ,// 파라미터     
            success: function(data) { // 성공했을 때의 처리 콜백함수
            	
              		$('.bt-love').hide();
                  	$('.bt-love_chg').show();
            	
            },
            error: function() { // 에러가 발생했을 때의 콜백함수
                alert("error");
            }
        });
    	
	}
    
    });// end of $(document).ready() --------
     </script>
  </head>
  <body>
  
  
  
  
  <main role="main"><!--지우지 마세요  -->
  
  <c:if test="${shies==null}">
  	새 글을 써 보시거나, 친구를 추가해 보세요!
  </c:if>
  
  <c:if test="${shies!=null}">
  	<c:forEach items="${shies }" var="shies">
  	<article class="card-60 social">
    <figure>
      
      <img src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr }" alt="shy" id="nike">
      
    </figure>
    <!-- end figure-->
    <div class="flex-content">
       
 <header>
        <p class="user">
           <a class="button follow" href="#" title="Follow">
               Follow
            </a>
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

      
      <p class="subinfo">
         
             <a class="location" title="Location" href="">
               당산역 맥도날드 앞 사거리에서 shy
         </a>
   
        </p>
        
       <p>
       	${shies.scontent }

      </p>
      <footer>
        <p>
            <a class="bt-love" title="Love" onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','1','snsno')">
               Love
            </a>
            <a class="bt-love_chg" title="Love">
	               Love
	        </a>
           
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a href="javascript:openComment(${shies.snsno });"class="bt-comment" title="Comment" href="">
               댓글(33)
            </a>
        </p>
      </footer>
    </div>
    
      <!--new댓글창  -->
    
      
     <div id="commentbox${shies.snsno }" class="shy_comments-app" style="margin-top:0; display:none;" ><!--ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl"  -->
  
  
  <!-- Form -->
  <div class="shy_comment-form">
    <!-- Comment Avatar -->
    <div class="shy_comment-avatar">
      <img src="http://lorempixel.com/200/200/people">
    </div>

    <form class="shy_form" name="form" ng-submit="form.$valid && cmntCtrl.addComment()" novalidate>
      <div class="shy_form-row">
        <textarea
                  class="shy_input"
                  ng-model="cmntCtrl.comment.text"
                  placeholder="댓글로 이야기를 나눠보세요"
                  required></textarea>
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
  
  <div align="center"><a class="button" href="#" style="color:white; " >
					더 읽기
				</a><br><br>
   </div>
  <!-- 
  <article class="card-60 social">
    <figure>
      <a class="ribbon-buy popular" href="#" title="Popular">
         Hot
      </a>
      <img src="https://source.unsplash.com/ZFQh_gS5TJc/800x600" alt="La Sagrada Familia">
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
           <a class="button follow" href="#" title="Follow">
               Follow
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span>8 mins ago &middot; Barcelona</span>
        </p>
      </header>
      <h2>
Sagrada Familia .card-60
      </h2>
      <p>
        Figure 60%. Content 40%. Excerpt. 2-3 lines recommended. The style of la Sagrada Família is variously likened to Spanish Late Gothic, Catalan Modernism and to Art Nouveau or Catalan Noucentisme.
      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="#">
               Love
            </a>
            
            <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a class="bt-comment" title="Comment" href="#">
               Comment
            </a>
        </p>
      </footer>
    </div>
    end .flex-content
  </article>
  
  <article class="card-50">
    <figure>
      <a href="" title="Buy">
      <span class="ribbon-buy">
         -20%
      </span>
        
      </a>
       
          <img src="https://source.unsplash.com/XPvhzVIeETM/800x600" alt="Tapas"> 
    </figure>
    end figure
    <div class="flex-content">
       <h2>
Tapas Deluxe .card50 odd even
      </h2>
       <p class="subinfo">
         <a class="button" href="#" title="Book a table">
               Book a table
            </a>
             <a class="location" title="Location" href="">
               Cromwell Rd, London SW7 5BD.
         </a>
   
        </p>
      <ul>
        <li>
          <strong title="Type">Type:</strong>
          Spanish
        </li>
                        <li><strong title="Rating">Rating:</strong> 8/10</li>
                        <li><strong title="Price">Price:</strong> $30 and under</li>
                     </ul>
       <p>
        Tapas are a wide variety of appetizers, or snacks, in Spanish cuisine. They may be cold (such as mixed olives and cheese) or hot (such as chopitos, which are battered, fried baby squid). In select bars in Spain, tapas have evolved into an entire, sophisticated cuisine.

      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="">
               Love
            </a>
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a class="bt-comment" title="Comment" href="">
               Comment
            </a>
        </p>
      </footer>

      
    </div>
    end .flex-content
  </article>
  <article class="card-40 social">
    <figure>
      <a class="ribbon-buy popular" href="#" title="Popular">
         Hot
      </a>
      <a href="/news/international/japan"><img src="https://source.unsplash.com/2TlAsvhqiL0/800x600" alt="Woman waiting metro"></a>
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
          <a class="button" href="#" title="Share">
               Share
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span><a href="" title="Permalink">8 mins ago</a> &middot; <a href="" title="258 comments">258 comments</a></span>
        </p>
      </header>
      <a href=""><h2>
        The Tokyo Mistery .card-40
      </h2>
      <p>
         Excerpt. 2-3 lines recommended. Police are investigating the theft of hundreds of straps used by standing passengers on the Tokyo Metro system, it's been reported. Tokyo Metro Co. is providing a free smartphone application to help foreigners navigate the capital's subway system.
      </p></a>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="">
               Love
            </a>
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
         
               <span class="bt-comment" title="Comment">Comment</span>
         
            
        </p>
      </footer>
    </div>
    end .flex-content
  </article>
  <article class="card-60 social">
    <figure>
      
      <img src="https://source.unsplash.com/yvx7LSZSzeo/800x600" alt="Woman playing guitar">
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
                <a class="button followed" href="#">
               Followed
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span>32 mins ago &middot; London</span>
        </p>
      </header>
      <h2>
         Card-60 Fender Stratocaster
      </h2>
      <p>
        2-3 lines recommended. The culture within an organization is an essential part for success. The Fender Stratocaster is a model of electric guitar designed in 1954 by Leo Fender, Bill Carson, George Fullerton, and Freddie Tavares.
      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="#">
               23
            </a>

            <a class="bt-share" title="Share" href="#">
               Share
            </a>
            
                <a class="bt-comment" title="Comment">
               4
            </a>
            
        </p>
      </footer>
    </div>
    end .flex-content
    
    
    

    
  </article>
 -->


  
</main>
<!-- 좋아요 form -->
<form name="likeFrm">
<input type="hidden" name="idx" id="idx"/>
<input type="hidden" name="likeseq" id="likeseq"/> <!-- snsno 값  -->
<input type="hidden" name="liketype"/>
<input type="hidden" name="seqcolum"/>
</form>

      

 <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
  <!-- <script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script> --> 
  
  </body>
</html>