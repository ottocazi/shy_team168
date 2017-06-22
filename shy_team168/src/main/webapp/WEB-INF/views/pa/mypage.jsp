<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/mypage.css">

<script type="text/javascript">

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
            <h2 style="display: -webkit-inline-box;">${sessionScope.loginuser.email}</h2>
            <input type="button" class="proedit" value="Follow" />
            <hr>
            <span>게시물&nbsp; 10개</span>&nbsp;&nbsp;
            <span>팔로우&nbsp; 6명</span>&nbsp;&nbsp;
            <span>그룹&nbsp; 1개</span>&nbsp;&nbsp;
            <input type="button" class="proedit" value="프로필편집" />
            <c:if test="${sessionScope.loginuser.myintro != null}">
            <p style="padding-top:30px;">
                ${sessionScope.loginuser.myintro}
            </p>
            </c:if>
            <c:if test="${sessionScope.loginuser.myintro == null}">
            <p style="padding-top:30px;">
               	 자기소개가 없습니다.
            </p>
            </c:if>
         </div>
      </div>
      
      <div class="showMypage">

          <div id="myTabContent" class="tab-content">
               <div role="tabpanel" class="tab-pane fade active in" id="shy" aria-labelledby="#tab1">
               <article class="card-50">
                  <figure>
                     <!-- <img src="https://source.unsplash.com/XPvhzVIeETM/800x600"> -->
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
          </div>
          
      </div>

</div>
