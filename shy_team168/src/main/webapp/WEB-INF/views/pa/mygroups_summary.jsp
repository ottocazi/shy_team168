<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/groupsDetail.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/juno/myInfoEdit.css"/> 
<script>

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
        <h2 class="grpdeatil_headline">그룹개요</h2>
        <c:if test="${grpvomap.FK_IDX eq sessionScope.loginuser.idx}">
        <p style="font-size: 10pt;">그룹장이면 그룹정보를 변경해보세요!</p>
        </c:if>
        <hr />
        
        
        <div class="inrtGrpMemo" style="margin: 10px;">
		     <div class="col-md-12">
        	<div class="bs-example" data-example-id="simple-table">
			    <table class="table nofill table-striped" style="width: 100%;">
					
					<tbody class="table-hover">
						
						<tr class="fisrtcol" style="border-top:2px solid #27303e;">
							<td class="text-left colname">그룹사진</td>
							<td class="text-left">
							
								<img class="img-responsive img-circle" src="<%=request.getContextPath() %>/resources/images/shydb/${grpvomap.GIMG }" >
							
							
							<c:if test="${grpvomap.FK_IDX eq sessionScope.loginuser.idx}">
							<div class="hiddenpart">
							<input type="file" name="myimg" />
				            <button type="submit" class="info_edit_btn" >사진변경</button>
							<button type="button" class="info_edit_btn show_more_cancle_btn">삭제</button>
							</div>
			                </c:if>
			                </td>
			                
						</tr>
						
						<form name="myintroFrm" id="myintroFrm">
						<tr class="lastcol" style="border-bottom:2px solid #27303e;">
							<td class="text-left colname">그룹소개</td>
							<td class="text-left"> 
							    <c:if test="${grpvomap.FK_IDX eq sessionScope.loginuser.idx}">
								<p>변경할 그룹소개를 입력하세요.</p>
								
								
				                <fieldset style="margin-top: 30px; width: 100%; height: 50px;" >
							    	<textarea cols="35" rows="4" class="inputcol" id="id_myintro" name="myintro" tabindex="5"  style="resize: none; width: 80%;" placeholder="${grpvomap.DESCRIPTION}"></textarea>
							    
							    </fieldset><br/>
							    <div class="hiddenpart">
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
				                </c:if>
				                <c:if test="${grpvomap.FK_IDX ne sessionScope.loginuser.idx}">
				                <fieldset style="margin-top: 30px; width: 100%; height: 50px;" >
							    	<textarea cols="35" rows="4" class="inputcol" id="id_myintro" name="myintro" tabindex="5"  style="resize: none; width: 80%;" placeholder="${grpvomap.DESCRIPTION}" readonly="readonly"></textarea>
							    
							    </fieldset><br/><br/><br/>
							      </c:if>
							</td>
						</tr>
						</form>
						
						<tr>
							<td class="text-left colname">그룹장</td>
							<td class="text-left"> 
				                	<img src="<%=request.getContextPath() %>/resources/images/shydb/${grpvomap.MYIMG}" style="width: 50px;height: 50px; border-radius: 50%;"> 
				                	<c:if test="${grpvomap.NAME == null}">
				                	&nbsp;&nbsp;${grpvomap.EMAIL}
				                	</c:if>
				                	<c:if test="${grpvomap.NAME != null}">
				                	&nbsp;&nbsp;${grpvomap.NAME}
				                	</c:if>
			                </td>
						</tr>
						
						<tr class="lastcol" style="border-bottom:2px solid #27303e;">
							<td class="text-left colname">그룹회원목록</td>
							<td class="text-left">
				                <c:if test="${gmemberList!=null }">
            					<c:forEach var="gmember" items="${gmemberList }">
            					<c:if test="${gmember.MYIMG == null}">
            					<img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
            					</c:if>
            					<c:if test="${gmember.MYIMG != null}">
            					<img src="<%=request.getContextPath() %>/resources/images/shydb/${gmember.MYIMG}" style="width: 50px;height: 50px; border-radius: 50%;">
								</c:if>
								${gmember.NAME } (${gmember.EMAIL }) <button type="button">탈퇴</button><br/>
			 					</c:forEach>
								</c:if>
			                </td>
						</tr>
						
					</tbody>
				</table>
			</div>
        </div>
        </div>
		  
		      
        <hr />
       
    </div>

</div>
</form>
<%-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
 --%>


