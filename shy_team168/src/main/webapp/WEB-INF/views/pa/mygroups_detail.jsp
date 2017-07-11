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
    <a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${grpvomap.GROUPNO}">
    <c:if test="${grpvomap.GIMG!=null }">
    <div class="grpdeatil_sidebar-header header-cover" style="background-image: url(<%=request.getContextPath() %>/resources/images/shydb/${grpvomap.GIMG });">
    </div>
	</c:if>
	<c:if test="${grpvomap.GIMG==null }">
	<div class="grpdeatil_sidebar-header header-cover" style="background-image: url('http://wallpaperpulse.com/thumb/604167.jpg');">   
    </div>
    </c:if>
    </a>
    <!-- Sidebar navigation -->
    <ul class="nav grpdeatil_sidebar-nav">
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_summary.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-eye" aria-hidden="true">그룹개요</i>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_detail.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-pencil-square-o" aria-hidden="true">그룹게시글</i>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_chat.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-commenting-o" aria-hidden="true">그룹채팅</i>
            </a>
        </li>
    </ul>
</aside>


    <!-- Sidebar Constructor -->
    
    <div class="grpdeatil_constructor">
        <h2 class="grpdeatil_headline">${grpvomap.GNAME }</h2>
        <button type="button" class="grpdeatil_join" onclick="goGrpjoin('groupno');">그룹가입</button>
        <input type="hidden" value="${grpvomap.GROUPNO }" name="groupno"/>
        <p><i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;<a href="#open">${grpvomap.GCOUNT }</a>명</p>
        <div class="followList" id="open">
        <div>
            <p>
            <c:if test="${gmemberList!=null }">
            <c:forEach var="gmember" items="${gmemberList }">
            <img src="<%=request.getContextPath() %>/resources/images/shydb/${gmember.MYIMG}" style="width: 50px;height: 50px; border-radius: 50%;">
			${gmember.NAME } ${gmember.EMAIL } <button type="button">follow</button><br/>
			 </c:forEach>
			</c:if>
			</p>
			<a href="#close">닫기</a>
        </div>
    	</div>
        <hr />
        <p style="font-size: 13pt;">${grpvomap.DESCRIPTION}</p>
        <hr />
        
        
        <div class="inrtGrpMemo" style="margin: 10px;">
		      <div class="grpdetail_padding">
		        <section class="grpdetail_cd-container">
		              <div class="grpdetail_cd-timeline-picture">
		              <c:if test="${sessionScope.loginuser != null}">
		                <img src="<%=request.getContextPath() %>/resources/images/shydb/${sessionScope.loginuser.myimg}" />
		              	<h5 class="grpdetail_marginBottom0 grpdetail_marginTop0">${sessionScope.loginuser.name}</h5>
		              </c:if>
		              <c:if test="${sessionScope.loginuser == null}">  
		                <img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
		 				<h5 class="grpdetail_marginBottom0 grpdetail_marginTop0">Guest</h5>
		              </c:if>
		                <!-- <div id="summernote"></div> -->
		                <textarea id="gcontent" name="gcontent" cols="80px" rows="5px" placeholder="그룹글 쓰기!"></textarea>
		                <input type="file" name="uploadfile" style="margin: 20px;"/>
		                <div class="inrtGrpMemo_btn" align="left">
		                <button onclick="goGboard();">submit</button>
		                <button onclick="">reset</button>
		                </div>
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
		              <c:if test="${gboard.UPLOADFILE !=null}">
		                <img src="<%=request.getContextPath() %>/resources/images/shydb/${gboard.UPLOADFILE }" style="width: 500px; height: 300px;	">
		              </c:if>  
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


