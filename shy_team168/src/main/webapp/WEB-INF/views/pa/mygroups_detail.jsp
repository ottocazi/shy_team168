<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/groupsDetail.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- include summernote css/js
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
include summernote-ko-KR
<script src="lang/summernote-ko-KR.js"></script> -->
<script>
/* $(document).ready(function() {

	 $('#summernote').summernote({
		 	onblur : function(e){
		 		$('#gcontent').html($('#summernote').code());
		 	},
		 	width : 600,
		    height : 100, // 에디터의 높이 
		    minHeight : 100,
		    maxHeight : null,
		    focus : true,
		    lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
		    });
}); */

	 

 function goGboard() {
	var frm = document.gboardFrm;
	
	frm.action = "gboardWrite.shy";
	frm.method = "POST";
	frm.submit();
}
 
 function goGrpjoin(groupno) {
	 var frm = document.gboardFrm;
		
	frm.action = "gmemberjoin.shy";
	frm.groupno = groupno;
	frm.method = "POST";
	frm.submit();
}
</script>
<form name="gboardFrm" enctype="multipart/form-data">
<div class="grpdeatil_wrapper" align="center">
<!-- Material sidebar -->
<aside id="grpdeatil_sidebar" class="grpdeatil_sidebar grpdeatil_sidebar-colored open" role="navigation">
    <!-- Sidebar header -->
    <div class="grpdeatil_sidebar-header header-cover" style="background-image: url(https://2.bp.blogspot.com/-2RewSLZUzRg/U-9o6SD4M6I/AAAAAAAADIE/voax99AbRx0/s1600/14%2B-%2B1%2B%281%29.jpg);">
        <!-- Top bar -->
        <div class="grpdeatil_top-bar"></div>
        <!-- Sidebar toggle button -->
        <button type="button" class="grpdeatil_sidebar-toggle">
            <!-- <i class="icon-material-sidebar-arrow"></i> -->
        </button>
        <!-- Sidebar brand image -->
        <div class="grpdeatil_sidebar-image">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/atom_profile_01.jpg">
        </div>
        <!-- Sidebar brand name -->
        <a data-toggle="dropdown" class="grpdeatil_sidebar-brand" href="#settings-dropdown">
             ${grpvomap.EMAIL }
            <b class="grpdeatil_caret"></b>
        </a>
    </div>

    <!-- Sidebar navigation -->
    <ul class="nav grpdeatil_sidebar-nav">
        <%-- <li class="dropdown"> 그룹장 회원정보보기 드롭다운
            <ul id="settings-dropdown" class="dropdown-menu">
                <li>
                    <a href="#" tabindex="-1">
                        ${grpvo.shymemvo.name }
                    </a>
                </li>
                <li>
                    <a href="#" tabindex="-1">
                        ${grpvo.shymemvo.myintro}
                    </a>
                </li>
                
            </ul>
        </li> --%>
        <li>
            <a href="#">
                <i class="fa fa-eye" aria-hidden="true">그룹개요</i>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fa fa-pencil-square-o" aria-hidden="true">그룹게시글</i>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fa fa-commenting-o" aria-hidden="true">그룹채팅</i>
            </a>
        </li>
    </ul>
</aside>


    <!-- Sidebar Constructor -->
    
    <div class="grpdeatil_constructor">
        <h2 class="grpdeatil_headline">${grpvomap.GNAME }</h2>
        <button type="button" onclick="goGrpjoin('groupno');">그룹가입</button>
        <input type="hidden" value="${grpvomap.GROUPNO }" name="groupno"/>
        <p><i class="fa fa-users" aria-hidden="true"></i><a href="#open">${grpvomap.GCOUNT }</a></p>
        <div class="followList" id="open">
        <div>
            <p>
            <c:if test="${gmemberList!=null }">
            <c:forEach var="gmember" items="${gmemberList }">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/atom_profile_01.jpg" style="width: 50px;height: 50px; border-radius: 50%;">
			${gmember.NAME } ${gmember.EMAIL } <button type="button">follow</button>
			 </c:forEach>
			</c:if>
			</p>
			<a href="#close">닫기</a>
        </div>
    	</div>
        <hr />
        <p>${grpvomap.DESCRIPTION}</p>
        <hr />
        
        
        <div class="inrtGrpMemo" style="margin: 10px;">
		      <div class="grpdetail_padding">
		        <section class="grpdetail_cd-container">
		              <div class="grpdetail_cd-timeline-picture">
		                <img src="${sessionScope.loginuser.myimg}" />
		              </div>
		                <h5 class="grpdetail_marginBottom0 grpdetail_marginTop0">${sessionScope.loginuser.name}</h5>
		                <p class="grpdetail_marginTop5 cd-author">현재시각</p>
		                <!-- <div id="summernote"></div> -->
		                <textarea  id="gcontent" name="gcontent" cols="80px" rows="5px" placeholder="그룹글 쓰기!"></textarea>
		                <input type="file" name="uploadfile" style="margin: 20px;"/>
		                <div class="inrtGrpMemo_btn" align="left">
		                <button onclick="goGboard();">submit</button>
		                <button onclick="">reset</button>
		              </div>
		        </section>
		      </div>
        </div>
		  
		      
        <hr />
    	<c:if test="${gboardList!=null }">
        <div class="inrtGrpMemo" style="margin: 10px;">
        <c:forEach var="gboard" items="${gboardList }">
		      <div class="grpdetail_padding">
		        <section class="grpdetail_cd-container">
		              <div class="grpdetail_cd-timeline-picture">
		                <img src="" />
		                <h5 class="grpdetail_marginBottom0 grpdetail_marginTop0">${gboard.NAME }</h5>
		              </div>
		                <img src="<%=request.getContextPath() %>/resources/images/shydb/${gboard.UPLOADFILE }" style="width: 500px; height: 300px;	">
		                <p class="grpdetail_marginTop5 cd-author">${gboard.LIKECNT }/${gboard.CMTCNT } on ${gboard.WRITEDATE}</p>
		                <p class="grpdetail_timelineText">${gboard.GCONTENT }</p>
		        </section>
		      </div>
		 </c:forEach>
        </div>
       </c:if>
       
    </div>

</div>
</form>
<%-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
 --%>


