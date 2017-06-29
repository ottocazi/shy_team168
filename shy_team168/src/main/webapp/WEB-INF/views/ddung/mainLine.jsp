<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- DDD -->

<!-- 타임라인소스 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ddung/timelinestyle.css">

<!-- 코멘트박스 소스 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ddung/commentboxstyle.css">

<!-- 아이콘 통일 소스주소: http://materializecss.com/icons.html -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->


<!-- <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'> -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
  
    $(document).ready(function(){
    	$('.bt-love_chg').hide();
    	countComment();
      
       //getLike();
       
       
       
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
       
       <c:if test="${shies!=null}">
        
        <c:forEach items="${shies}" var="shies">
        // alert('${shies.snsno}');
        snsnoArr.push('${shies.snsno}');
        </c:forEach>
        
        </c:if>
        
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
   
    
    
    function openComment(snsno) {
	   
	   var commentbox = document.getElementById('commentbox'+snsno);

	   if(commentbox.style.display=='none'){
		   
		   
		   $.ajax({
	            url: "/shy/getComments.shy",
	            type: "POST",
	            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
	            data: {snsno:snsno},
	            success: function(data) { // 성공했을 때의 처리 콜백함수
	            	
	            	commentbox.style.display = 'block';
	            	var html = '';
	            	
	    			$.each(data, function(i, comments){
	    				//alert(entry.cmtcontent);
	    				
	    				html += '<div id="shy_comment_ajax' + comments.cmtno
	    					 + '" class="shy_comment">'
	    					 + '<div class="shy_comment-avatar">'
	    					 + '<img src="<%=request.getContextPath() %>/resources/images/shydb/'
	    					 + comments.myimg
	    					 + '"></div>'
	    					 + '<div class="shy_comment-box">'
	    					 + '<div class="shy_comment-text">'
	    					 + comments.cmtcontent
	    					 + '</div>'
	    					 + '<div class="shy_comment-footer">'
	    				 	 + '<div class="shy_comment-info">'
	    				 	 + '<a href="#"> <span class="shy_comment-author">';
    				if (comments.name==null){
	    				html += comments.email+ '</span></a>';
	    			}
	    			else {
	    			 	html	+= comments.name+ '</span></a>'; 
 				 	}
	    				html	+= '<span class="shy_comment-date">'
	    					 + comments.updatetime+'</span>'
	    					 + '</div>'
	    					 + '<div class="shy_comment-actions">'
							 + ' <a href="#"><i class="fa fa-exclamation-triangle fa-2x" '
							 + ' aria-hidden="true"></i></a> '
	    					 + '</div>'
	    					 + '</div>'
	    					 + '</div></div>';   
	    			
	    				/*html END*/ 
	    				
	    				
	    				
	    			});
	               
	    			$("#shy_comment_ajax" + snsno).html(html);
	               
	            },
	            error: function() { // 에러가 발생했을 때의 콜백함수
	                alert("error");
	            }
	        });
		   
		    
	    }else{
	        commentbox.style.display = 'none';
	    }

	}
    
    /* ajax 로 댓글 갯수 읽어 오기 */
   	function countComment() {
   		var snsnoArr = new Array();
   		<c:if test="${shies!=null}">
   		
   		<c:forEach items="${shies}" var="shies">
   		// alert('${shies.snsno}');
   		snsnoArr.push('${shies.snsno}');
   		</c:forEach>
   		</c:if>
   		// alert(snsnoArr);
   		
   		jQuery.ajaxSettings.traditional = true;
   		
   		$.ajax({
   			url: "/shy/getCommentCount.shy",
    		type: "GET",
    		data: {snsnoArr:snsnoArr},
    		dataType: "JSON",  
    		success: function(data){
    			
    			var html;
    			
    			$.each(data, function(entryIndex, entry){
    			//	alert(entry.snsno);
    				
    				
    				html = "댓글(" + entry.cnt + ")";
    				
    				$("#comment" + entry.snsno).html(html);
    				
    			});
    		//	getCommentList();
    		},
    		error: function(){
 				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
 		    }
   		});
    } 
    
    
    
    
    
 function insertReply(shyidx){
    	
	   	var myidx = $('#myidx'+shyidx).val();
    	var replycontent = $('#replycontent'+shyidx).val();
    	
    	var form_data = {myidx : myidx,
                   		 shyidx   : shyidx,
                   		 replycontent   : replycontent };
    	
    	$.ajax({
    		url: "/shy/insertreply.shy",
    		type: "GET",
    		data: form_data ,
    		dataType: "text", 
    		success: function(data) {
    			alert('success');
    			alert($('#replycontent'+shyidx).val());
    			$('#replycontent'+shyidx).val("");
    			countComment();
    			//getCommentList();
    		},
    		error: function(){
				  //alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				  alert('ajax 오류');
		    }
    			
    	}); 
    }
    
     </script>
</head>
<body>




	<main role="main"><!--지우지 마세요  --> <c:if test="${shies==null}">
  	새 글을 써 보시거나, 친구를 추가해 보세요!
  </c:if> <c:if test="${shies!=null}">
		<c:forEach items="${shies}" var="shies" varStatus="status">

			<article class="card-60 social">
				<figure>

					<img
						src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr}"
						alt="shy" id="nike">

				</figure>
				<!-- end figure-->
				<div class="flex-content">

					<header>
						<p class="user">
							<a class="button follow" href="#" title="Follow"> Follow </a>
							<c:if test="${shies.myimg != null}">
								<img class="avatar-32"
									src="<%=request.getContextPath() %>/resources/images/shydb/${shies.myimg }"
									alt="Avatar">
							</c:if>
							<c:if test="${shies.myimg == null}">
								<img class="avatar-32"
									src="http://magazine.nicktv.it/wp-content/uploads/sites/11/2016/09/Spongebob-Finalmente-Si-Mangia.gif"
									alt="Avatar">
							</c:if>
							<strong> <a title="Full Name" href="#"> <span
									style="font-size: 12pt; margin: 0; color: black;"> <c:if
											test="${shies.name!=null }">
	                ${shies.name }
	                </c:if> <c:if test="${shies.name==null }">
                  	${shies.email }
                  	</c:if>

								</span>
							</a>
							</strong> <span>${shies.sdatedtime} &middot; <a href="">@파파파</a> 님과
								함께
							</span>
						</p>
					</header>


					<p class="subinfo">

						<a class="location" title="Location" href=""> 당산역 맥도날드 앞 사거리에서
							shy </a>

					</p>



					<p>${shies.scontent}</p>
					<footer>
						<p>
							<a class="bt-love" title="Love"
								onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','1','snsno')"
								id="bt-love${shies.snsno }"> Love </a> <a class="bt-love_chg"
								title="Love" id="love${shies.snsno }"> </a> <a class="bt-share"
								title="Share" href="#"> 공유하기 </a> <a
								href="javascript:openComment('${shies.snsno}');"
								class="bt-comment" title="Comment" id="comment${shies.snsno}">
							</a>



						</p>
					</footer>
				</div>

				<!--new댓글창  -->



				<div id="commentbox${shies.snsno }" class="shy_comments-app"
					style="margin-top: 0; display: none;">
					<!--ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl"  -->



					<!-- Form -->
					<div class="shy_comment-form">
						<!-- Comment Avatar -->
						<div class="shy_comment-avatar">
							<img
								src="<%=request.getContextPath() %>/resources/images/shydb/${shies.myimg }"
								style="display: block; height: 100%; width: 100%;">
						</div>

						<form class="shy_form" name="insertReplyform" id="insertReplyform">
							<input type="hidden" id="myidx${shies.snsno }"
								value="${loginuser.idx }" />
							<div class="shy_form-row">
								<textarea class="shy_input" id="replycontent${shies.snsno }"
									placeholder="댓글로 이야기를 나눠보세요" required></textarea>
							</div>


							<div class="shy_form-row">
								<input type="button" id="replybutton" value="올리기"
									onclick="insertReply(${shies.snsno});" />
							</div>
						</form>
					</div>

					<!-- Comments List -->

					<div class="shy_comments" id="dd_shycomment">
						<input type="hidden" name="snsno" id="snsno${shies.snsno}"
							value="${shies.snsno}" />
						<!-- Comment -->

						<!-- Comment - Dummy -->
						<div id="shy_comment_ajax${shies.snsno}" class="shy_comment">
							<%-- 
							<!-- for each 돌리는 div  -->
							<!-- Comment Avatar -->
							<div class="shy_comment-avatar">
								<img src="" alt="사진 읎어용">
							</div>

							<!-- Comment Box -->
							<div class="shy_comment-box">
								<div class="shy_comment-text">짧은 댓글 test1
									${cmtVO.cmtcontent}</div>
								<div class="shy_comment-footer">
									<div class="shy_comment-info">
										<span class="shy_comment-author"> <a href="">유저명</a>
										</span> <span class="shy_comment-date">댓글작성시간</span>
									</div>

									<div class="shy_comment-actions">
										<a href="#"><i class="fa fa-exclamation-triangle fa-2x"
											aria-hidden="true"></i></a>
									</div>
								</div>


							</div>

 --%>

						</div>
						<!-- for each 돌리는 div끝  -->


						<!-- <div align="center">
							<a class="button" href="#" style="color: white;"> read more </a>
						</div> -->
					</div>
				</div>
				<!--new댓글창 end  -->

				<!-- end .flex-content-->
			</article>


			<!-- post foreach 마무리  -->
		</c:forEach>
	</c:if>



	<div align="center">
		<a class="button" href="#" style="color: white;"> 더 읽기 </a><br> <br>
		=======
	</div>


	</main>
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







	<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->

	<!-- <script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script> -->

</body>
</html>