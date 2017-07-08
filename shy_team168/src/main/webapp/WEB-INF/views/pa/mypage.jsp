<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/mypage.css">

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
        //follow();
        
        $('#showFlwList').hide();
        
        
        $('#showFlwList').click(function(e){
           $('#showFlwList').hide(); 
        });
       
        $('.flwList').click(function(e){
        	 var idx = "${mymap.idx}";
        	 
            // 팔로우목록 Ajax 불러오기
             $.ajax({
                 url: "/shy/myfollowList.shy",
                 type: "GET",
                 dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
                 data: {idx:idx},
                 success: function(data) { // 성공했을 때의 처리 콜백함수
                       var Result="";
                    
                       if(data.lenght == null){  
                   		Result = "<span style='color: #000;cursor: pointer;'>&nbsp;&nbsp;팔로우가 없습니다&nbsp;&nbsp;</span>";
                       }else{
                    	   
                       $.each(data,function(entryIndex,entry){
                    	var html = "<img src='/shy/resources/images/shydb/"+entry.myimg+"' style='width:30px; hegiht:30px;'/>"
                        	 	 + "<span>"+entry.email+"&nbsp;&nbsp;Following..</span>";
           	
           					Result += "<span style='cursor: pointer;'>" + html + "</span><br/>";
                    		
                       });
                       }
                       $("#showFlwList").html(Result).show(); 
                 },
                 error: function() { // 에러가 발생했을 때의 콜백함수
                     alert("flwListError");
                 }
             });
            
        });
        
        var content = document.getElementById('showMypage').innerHTML;
        
        var splitedArray = content.split(' '); // 공백을 기준으로 문자열을 자른다.
    	var linkedContent = ' ';
    	for(var word in splitedArray)
    	{
    	  word = splitedArray[word];
    	
    	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
    	   {
    	      word = '<a style=\'color:#8888DD;font-weight:bold;\' href=\'#\'>'+word+'</a>';
    	   }
    	   linkedContent += word+' ';
    	}
    	document.getElementById('showMypage').innerHTML = linkedContent; 

       
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
       var idx = "${mymap.idx}";
       
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
            data: {snsnoArr:snsnoArr,
            		idx:idx},
            success: function(data) { // 성공했을 때의 처리 콜백함수
               var snsnoObjArr = [];
               
               $.each(data,function(entryIndex,entry){
                  snsnoObjArr.push([entry.snsno,Number(entry.totalcount),Number(entry.mylikestat),Number(entry.likeno) ]);
                  if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 1){
                        $('#bt-love'+entry.snsno).hide();
                        $('#love'+entry.snsno).empty();
                        
                        var html = entry.totalcount;
                        $('#love'+entry.snsno).html(html).show();
                        
                  }else if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 0){
                	  	var html = entry.totalcount;
                	  	$('#bt-love'+entry.snsno).html(html).show();
                	  	$('#love'+entry.snsno).hide();
                	  	
                  }else{
                       $('#bt-love'+entry.snsno).show();
                       $('#love'+entry.snsno).hide();
                   } 
               });
               
            },
            error: function() { // 에러가 발생했을 때의 콜백함수
                alert("getLikeError");
            }
        });
       
   }
    
    function getLikeAjax(snsno){
    	//alert("snsno"+snsno);
        var snsnoArr = new Array();
        snsnoArr.push("snsno");
         
        var idx = "${mymap.idx}";
        
        jQuery.ajaxSettings.traditional = true;
       
        // 좋아요목록 Ajax 불러오기
         $.ajax({
             url: "/shy/likeList.shy",
             type: "GET",
             dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
             data: {snsnoArr:snsnoArr,
            	    idx:idx},
             success: function(data) { // 성공했을 때의 처리 콜백함수
                var snsnoObjArr = [];
                
                $.each(data,function(entryIndex,entry){
                   snsnoObjArr.push([entry.snsno,Number(entry.totalcount),Number(entry.mylikestat),Number(entry.likeno) ]);
                   if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 1){
                         $('#bt-love'+entry.snsno).hide();
                         $('#love'+entry.snsno).empty();
                         
                         var html = entry.totalcount;
                         $('#love'+entry.snsno).html(html).show();
                         
                   }else if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 0){
                 	  	var html = entry.totalcount;
                 	  	$('#bt-love'+entry.snsno).html(html).show();
                 	  	$('#love'+entry.snsno).hide();
                 	  	
                   }else{
                        $('#bt-love'+entry.snsno).show();
                        $('#love'+entry.snsno).hide();
                    } 
                });
                
             },
             error: function() { // 에러가 발생했을 때의 콜백함수
                 alert("getLikeAjaxError");
             }
         });
        
    }
  
	function follow() {
   		
   		jQuery.ajaxSettings.traditional = true; /* data: {idxArr:idxArr}, 이렇게 쓸라면 트루로 해줘야함 */
   		
   		$.ajax({
   			url: "/shy/pafollow.shy",
    		type: "GET",
    		dataType: "JSON", 
    		success: function(data){
    			//alert("follow");
    			var html;
    			$.each(data, function(entryIndex, entry){
	    			
	    			var FOLLOWCHECK = entry.FOLLOWCHECK;
					if(FOLLOWCHECK == 1){
						html = " <button class='bt' onClick='unFollow("+ entry.IDX + ");'>UnFollow</button>";
					}
					else {
						html = "<button class='bt' onClick='goFollow("+ entry.IDX + ");'>Follow</button>";
					}
					
					$("#follow").html(html);
    				
    			});
    		//	getCommentList();
    		},
    		error: function(){
 				  alert("follow() error!"); 
 		    }
   		});
    }; 
    
</script>
<script>
var pageNo = 1;

function moreList(){ // 더 읽기	
	var idx = "${mymap.idx}";
	pageNo += 1;
	
    $.ajax({
        type: 'GET'
        , async: false
        , url: "/shy/mypageList.shy"
        , data: {pageNo: pageNo,
        	     idx: idx}
        , beforeSend: function() {
             $('#ajax_load_indicator').show().fadeIn('slow');  // div가 나타는 속도
          }
        , success: function(data) {
        	 
            var result = "";
            var end;
            var snsno = "";
            
            $.each(data,function(entryIndex,entry){
            	
      		  var  html = "<div class='mycard myIncard'><div class='flex-content'>";
      		  
      	     			  if(entry.simage!=0){ // 이미지가 있으면
      	     				html += "<figure class='snip1584'><img src='/shy/resources/images/shydb/"+entry.imageaddr+"'>"
      	     				     +  "<figcaption><h5>"+entry.scontent+"</h5><h3>"
      	     		    		 + "<a class='bt-love' title='Love' onclick='goLike('${sessionScope.loginuser.idx }','"+entry.snsno+"','snsno')' id='bt-love"+entry.snsno+"'> Love </a>" 
      	     					 + "<a class='bt-love_chg' title='Love' id='love"+entry.snsno+"' onclick='goUnlike('${sessionScope.loginuser.idx }','"+entry.snsno+"','snsno')'></a>" 
      	     					 + "<a class='bt-share' title='Share' href='#'>공유하기</a>" 
      	     					 + "<a href='javascript:openComment('"+entry.snsno+"');' class='bt-comment' title='Comment' id='comment"+entry.snsno+"'></a>"
      	     					 + "</h3></figcaption></figure>";
      	     			  }else{ // 이미지가 없으면
      	     				html += "<div style='min-height: 125px; margin-top: 100px; position: relative;'>"+entry.scontent+"<h3>"
  	     		    		 	 + "<a class='bt-love' title='Love' onclick='goLike('${sessionScope.loginuser.idx }','"+entry.snsno+"','snsno')' id='bt-love"+entry.snsno+"'> Love </a>" 
  	     					 	 + "<a class='bt-love_chg' title='Love' id='love"+entry.snsno+"' onclick='goUnlike('${sessionScope.loginuser.idx }','"+entry.snsno+"','snsno')'></a>" 
  	     					 	 + "<a class='bt-share' title='Share' href='#'>공유하기</a>" 
  	     					 	 + "<a href='javascript:openComment('"+entry.snsno+"');' class='bt-comment' title='Comment' id='comment"+entry.snsno+"'></a>"
  	     					 	 + "</h3></div>";
   	            		   }
      	     			  
      	     			    html += "<div class='footer'><span style='height: 50px; padding:10px; text-align:center; color: gray; font-size: 9pt;'>"
      	     			  	       +entry.sdatedtime+"</span></div></div></div>";
				    
      				result += html;
      				$('#readmore').remove();
      			
      				end = entry.end;
      				snsno += entry.snsno;
      	 	});
            	 getLikeAjax(snsno);
            	 
	             //goLike(idx,likeseq,seqcolum);
	             //goUnlike(idx,likeseq,seqcolum);
	            
          	////
  			if(end == 1) {
  				$(result).appendTo('#ajax_load_indicator');
  			}
  			////
  			else {
  				result += "<div id='readmore' align='center' style='margin: 5%'><a class='readmore' href='javascript:moreList();' style='color:white;'>더 읽기</a></div>";
  	            $(result).appendTo('#ajax_load_indicator');
  			}
          }
        , error: function(data) {
        	alert("moreListError");
          }
        , complete: function(data) { 
        	
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

.flex-content img{
	width: 300px;
	height: 420px;
}

</style>
</head>
<body>
<div id="mypage" align="center">
      
      <form name="mypageFrm">
      <div class="myProfile" style="text-align: left">
         <div class="pimg">
         <c:if test="${mymap.myimg != null}">
            <img src="<%=request.getContextPath() %>/resources/images/shydb/${mymap.myimg }">
         </c:if>
         <c:if test="${mymap.myimg == null}"> 
            <img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
         </c:if>
         </div>
         <div class="myIntro">
            <h2 style="display: -webkit-inline-box;">${mymap.email}</h2>
            <div id="follow"></div>
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
               </c:if> 명</span>&nbsp;&nbsp;

            <span>그룹&nbsp; 1개</span>&nbsp;&nbsp;
            <button class="proedit" onclick="goEdit();">프로필편집</button>
            
            <div id="showFlwList"></div>
            
            <c:if test="${mymap.myintro != null}">
            <p style="padding-top:30px;">
                ${mymap.myintro}
            </p>
            </c:if>
            <c:if test="${mymap.myintro == null}">
            <p style="padding-top:30px;">
               	 자기소개가 없습니다.
            </p>
            </c:if>
         </div>
      </div>
      </form>
      
 <div class="showMypage" id="showMypage">

               
  
  <c:if test="${myshyList==null}">
  	아직 등록된 글이 없습니다.
  	친구들에게 shy 해보세요!!
  </c:if>
  
  <c:if test="${myshyList!=null}">
  <div id="allbox">
  <c:forEach items="${myshyList }" var="shies" varStatus="status">
  <div class="mycard myIncard">
  	<div class="flex-content">
     
    <c:if test="${shies.simage!=0 }">
      <figure class="snip1584"><img src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr }" >
  		<figcaption>
    	<h5>${shies.scontent }</h5>
    	<h3>
    	<a class="bt-love" title="Love" onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')" id="bt-love${shies.snsno }"> Love </a> 
		 <a class="bt-love_chg" title="Love" id="love${shies.snsno }" onclick="goUnlike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')"> </a> 
		 <a class="bt-share" title="Share" href="#"> 공유하기 </a> 
		 <a href="javascript:openComment('${shies.snsno}');" class="bt-comment" title="Comment" id="comment${shies.snsno}"> </a>
		 </h3>
		 
  	  </figcaption>
	  </figure>
      
    </c:if> 
  	<c:if test="${shies.simage==0 }">
   
      <div style="min-height: 125px; margin-top: 100px; position: relative;">
       	${shies.scontent }
    	<h3>
    	<a class="bt-love" title="Love" onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')" id="bt-love${shies.snsno }"> Love </a> 
		 <a class="bt-love_chg" title="Love" id="love${shies.snsno }" onclick="goUnlike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')"> </a> 
		 <a class="bt-share" title="Share" href="#"> 공유하기 </a> 
		 <a href="javascript:openComment('${shies.snsno}');" class="bt-comment" title="Comment" id="comment${shies.snsno}"> </a>
		 </h3>
      </div>
     
     </c:if>
      <div class="footer">
      <span style="height: 50px; padding:10px; text-align:center; color: gray; font-size: 9pt;">${shies.sdatedtime }</span>
      </div>
      
     </div>
    </div>
  
  </c:forEach>
  
  <div id="ajax_load_indicator" style="display:none;">
  </div>
  
  
  </div> 
  
 
  
  <c:if test="${myshyCount > 6}">
  <div id="readmore" align="center" style="margin: 5%">
  <a class="readmore" href="javascript:moreList();" style="color:white;">더 읽기</a>
	</div>
  </c:if>	
  <c:if test="${myshyCount < 6}">
  </c:if>
  </c:if>
  		
   
<!--	</main>  한 개의 shy 끝  -->
</div> <!-- end div id=showMypage -->

</div>
