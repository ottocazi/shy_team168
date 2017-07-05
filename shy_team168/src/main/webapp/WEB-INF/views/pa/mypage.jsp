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
   		
        getLike();
        
        $('#showFlwList').hide();
        
        
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
    
    function goLike(idx,likeseq,seqcolum){
      var form_data = {idx : idx,
                   likeseq   : likeseq,
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
    
    function goUnlike(idx,likeseq,seqcolum){
        var form_data = {idx : idx,
                     likeseq   : likeseq,
                     seqcolum   : seqcolum};
        
         // 좋아요 Ajax 불러오기
          $.ajax({
              url: "/shy/unlike.shy",
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
                  snsnoObjArr.push([entry.snsno,Number(entry.totalcount),Number(entry.mylikestat),Number(entry.likeno) ]);
                  if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 1){
                        $('#bt-love'+entry.snsno).hide();
                        $('#love'+entry.snsno).empty();
                        
                        var html = "<span>"+entry.totalcount+"</span>";
                        $('#love'+entry.snsno).html(html).show();
                        
                  }else if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 0){
                	  	var html = "<span>"+entry.totalcount+"</span>";
                	  	$('#bt-love'+entry.snsno).html(html).show();
                	  	$('#love'+entry.snsno).hide();
                	  	
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

<script>
var pageNo = 1;
	
function moreList(){
	
	
	
	pageNo += 1;
	
    $.ajax({
        type: 'POST'
        , async: false
        , url: "/shy/mypageList.shy"
        , data: {pageNo: pageNo}
        , beforeSend: function() {
             $('#ajax_load_indicator').show().fadeIn('slow');  // div가 나타는 속도
          }
        , success: function(data) {
        	 
            var result = "";
            var end;
            	
            $.each(data,function(entryIndex,entry){
              
      		  var  html = "<article class='card-60 social'>";
      	     			  if(entry.imageaddr!=null){
      	     				html += "<img src='/shy/resources/images/shydb/"+entry.imageaddr+"' alt='shy' id='nike'>"; 
      	     			  }
      	     			  html += "<div class='flex-content'><p style='text-align: left'>"+entry.scontent+"</p><footer><p>";
            			  if(entry.slikecnt==0){
            			 html += "<a class='bt-love' title='Love' onclick='goLike('${sessionScope.loginuser.idx }','"+
            			  entry.snsno+"','1','snsno')' id='bt-love"+entry.snsno+"'>"; 
	            			  if(entry.snsnocnt==0){ 
	            				  html +="Love </a>";
	            			  }else{
	            				  html += entry.snsnocnt+"</a>";
	            			  }
            			  }else{
            		     html += "<a class='bt-love_chg' title='Love' id='love"+entry.snsno+"' onclick='goUnlike('${sessionScope.loginuser.idx }','"+
            			  entry.snsno+"','snsno')'>"+entry.snsnocnt+"</a>" ;
            			  }
            			  html += "<a class='bt-share' title='Share' href='#'> 공유하기 </a>"+
				      	  "<a href='javascript:openComment('"+
            			  entry.snsno+"');' class='bt-comment' title='Comment' id='comment"+
            			  entry.snsno+"'> </a>"+
				          "</p></footer></div></article>";
				          
      			result += "<div class='mycard myIncard'>"+html+"</div>";
      			$('#readmore').remove();
      			
      			end = entry.end;
      	 	});
            
          	////
  			if(end == 1) {
  				$(result).appendTo('#ajax_load_indicator');
  			}
  			////
  			else {
  				result += "<div id='readmore' align='center'><a class='readmore' href='javascript:moreList();' style='color:white;'>더 읽기</a></div>";
  	            $(result).appendTo('#ajax_load_indicator');
  			}
          }
        , error: function(data) {
        	alert("error");
          }
        , complete: function(data) { 
        	//$('.readmore').hide();
            //$('#ajax_load_indicator').fadeOut('slow');
        	//getLike();
        	
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
               <c:if test="${myshyCount==0}" >
               0
               </c:if>
               <c:if test="${myshyCount>0}" >
               ${myshyCount }
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
               
  
  <c:if test="${myshyList==null}">
  	아직 등록된 글이 없습니다.
  	친구들에게 shy 해보세요!!
  </c:if>
  
  <c:if test="${myshyList!=null}">
  
  <c:forEach items="${myshyList }" var="shies" varStatus="status">
  <div class="mycard myIncard">
  	<article class="card-60 social">
    
      
      <img src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr }" alt="shy" id="nike">
  
    <div class="flex-content">
      <p style="text-align: left">
       	${shies.scontent }
      </p>
    
       
      <footer>
        <p>
         <a class="bt-love" title="Love" onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')" id="bt-love${shies.snsno }"> Love </a> 
		 <a class="bt-love_chg" title="Love" id="love${shies.snsno }" onclick="goUnlike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')"> </a> 
		 <a class="bt-share" title="Share" href="#"> 공유하기 </a> 
		 <a href="javascript:openComment('${shies.snsno}');" class="bt-comment" title="Comment" id="comment${shies.snsno}"> </a>
        </p>
      </footer>
    </div>

  </article>
  
  
  	
  </div> 
  </c:forEach>
  <div id="ajax_load_indicator" style="display:none">
  </div>
  
  <c:if test="${myshyCount > 6}">
  <div id="readmore" align="center"><a class="readmore" href="javascript:moreList();" style="color:white;">더 읽기</a>
	</div>
  </c:if>	
  <c:if test="${myshyCount < 6}">
  </c:if>
  </c:if>
  		
   
<!--	</main>  한 개의 shy 끝  -->
	


               
               
          </div>
          
      </div>

</div>
