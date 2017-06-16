<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



  
  
  
  
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
    function openComment() {
	
	   var commentbox = document.getElementById('commentbox');
	   
	
	   if(commentbox.style.display=='none'){
		   commentbox.style.display = 'block';
	    }else{
	        commentbox.style.display = 'none';
	    }

	} 
     
     </script>
  </head>
  <body>
  

  
  <main role="main"><!--지우지 마세요  -->
  
  <article class="card-60 social">
    <figure>
      
      <img src="https://source.unsplash.com/GgEtIbD0hVo/800x600" alt="Nike Shoes">
      
    </figure>
    <!-- end figure-->
    <div class="flex-content">
       
 <header>
        <p class="user">
           <a class="button follow" href="#" title="Follow">
               Follow
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  <span style="font-size: 12pt; margin:0; color:black;">username</span>
               </a>
            </strong>
          <span>8 mins ago &middot; <a href="">@파파파</a> 님과 함께</span>
        </p>
      </header>

      
      <p class="subinfo">
         
             <a class="location" title="Location" href="">
               당산역 맥도날드 앞 사거리에서 shy
         </a>
   
        </p>
        
            
     
      
       <p>
       	내가 이거신으면 호날두다!

      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="">
               Love
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

    <form class="shy_form" name="form" action="" method="" novalidate>
      <div class="shy_form-row">
        <textarea
                  class="shy_input"
                  ng-model="cmntCtrl.comment.text"
                  placeholder="댓글로 이야기를 나눠보세요"
                  required></textarea>
      </div>
<!-- 
      <div class="shy_form-row">
        <input
               class="shy_input"
               ng-class="shy_{ disabled: cmntCtrl.comment.anonymous }"
               ng-disabled="cmntCtrl.comment.anonymous"
               ng-model="cmntCtrl.comment.author"
               ng-required="!cmntCtrl.comment.anonymous"
               placeholder="Email"
               type="email">
      </div> -->

      <!-- <div class="shy_form-row text-right">
        <input
               id="comment-anonymous"
               ng-change="cmntCtrl.anonymousChanged()"
               ng-model="cmntCtrl.comment.anonymous"
               type="checkbox">
        <label for="comment-anonymous">Anonymous</label>
      </div> -->

      <div class="shy_form-row">
        <input type="submit" value="올리기">
      </div>
    </form>
  </div>

  <!-- Comments List -->
  <div class="shy_comments">
    <!-- Comment -->
   

    <!-- Comment - Dummy -->
    <div class="shy_comment"><!-- 댓글 양식 for each 돌리는 div  -->
      <!-- Comment Avatar -->
      <div class="shy_comment-avatar" style="margin-left:0;">
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

		<div align="center"><a class="button" href="#" >
					read more
				</a>
   </div>
  </div>
</div>
    <!--new댓글창 end  -->
    
    <!-- end .flex-content-->
  </article>
  
  
  <!-- post foreach 마무리  -->
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


      

 <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
  <!-- <script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script> --> 
  
  </body>
</html>