<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/navtab.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $('#myTabs a').click(function (e) {
     e.preventDefault()
     $(this).tab('show')
   });
   
   $('#myTabs a[href="#shy"]').tab('show'); // Select tab by name
   $('#myTabs a:first').tab('show'); // Select first tab
   $('#myTabs a:last').tab('show'); // Select last tab
</script>
<style type="text/css">
.bt a:hover {
   font-weight: bold;
   background-color:#fff;
}
</style>
</head>
<body>
<div id="mypage">
      
      <div class="myProfile">
         <div class="pimg">
            <img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
         </div>
         <div class="myIntro">
            <h2 style="display: -webkit-inline-box;">userID@email.com</h2>
            <input type="button" class="proedit" value="Follow" />
            <hr>
            <span>게시물&nbsp; 10개</span>&nbsp;&nbsp;
            <span>팔로우&nbsp; 6명</span>&nbsp;&nbsp;
            <span>그룹&nbsp; 1개</span>&nbsp;&nbsp;
            <input type="button" class="proedit" value="프로필편집" />
            <p style="padding-top:30px;">
                자기소개가 없습니다.
            </p>
         </div>
      </div>
      
      <div class="showMypage">
          <ul id="myTab" class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active">
              <a data-target="#shy" id="shy-tab" role="tab" data-toggle="tab" aria-controls="shy" aria-expanded="true">
              <span class="glyphicons glyphicons-star" aria-hidden="true"></span>
              <div class="hidden-xs">내 shy</div></a></li>
              
              <li role="presentation" class="">
              <a data-target="#bank" role="tab" id="bank-tab" data-toggle="tab" aria-controls="bank" aria-expanded="false">
              <span class="glyphicons glyphicons-piggy-bank" aria-hidden="true"></span>
              <div class="hidden-xs">내 bank</div></a></li>
              
              <li role="presentation" class="">
              <a data-target="#about" role="tab" id="about-tab" data-toggle="tab" aria-controls="about" aria-expanded="false">
              <span class="glyphicons glyphicons-list-alt" aria-hidden="true"></span>
              <div class="hidden-xs">About</div></a></li>
          </ul>

          <div id="myTabContent" class="tab-content">
               <div role="tabpanel" class="tab-pane fade active in" id="shy" aria-labelledby="#tab1">
               <article class="card-50">
                  <figure>
                     <img src="https://source.unsplash.com/XPvhzVIeETM/800x600">
                  </figure>
                  <!-- end figure-->
                  <div class="flex-content">
                     <span style="font-size: 10pt; color: #BABABA; font-weight: bold; margin: 5px">32 mins ago · London</span>
                     <p class="subinfo">
                        <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar"> <span>와 함께</span>
                     </p>
                     <p>내용</p>
                     <footer>
                       <p class="bt"><a class="bt-love" title="Love" href="#">Love</a>
                        <a class="bt-share" title="Share" href="#">Share</a>
                            <a class="bt-comment" title="Comment" href="#">Comment</a>
                        </p>
                        </footer>   
                  </div>
                  <!-- end .flex-content-->
               </article>

             </div>
               <div role="tabpanel" class="tab-pane fade" id="bank" aria-labelledby="#tab2">
               </div>
               <div role="tabpanel" class="tab-pane fade" id="about" aria-labelledby="#tab3">
               </div>
          </div>
          
      </div>

</div>
