<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style type="text/css">
	table, th, td {border: solid gray 1px;}
	#table {border-collapse: collapse; width: 820px;} 
	#table th, #table td {padding: 5px;}
	#table th {background-color: #DDDDDD;}
	
	a{text-decoration: none;} 
	    
</style>

 
<script type="text/javascript">
	$(document).ready(function(){
		
		searchKeep();
		
	//	===== #147. Ajax 로 검색어 입력시 자동글 완성하기 2 =====
		$("#displayList").hide();
	
	    $("#search").keyup(function(){
	    	
	    	var form_data = { colname : $("#colname").val(),  // 키값 : 밸류값 
	    	       		      search  : $("#search").val()    // 키값 : 밸류값 
	    	       		    };
	    	
	    	$.ajax({
	    		url: "/shy/wordSearchShow.shy",
	    		type: "GET",
	    		data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
	    		dataType: "JSON", 
	    		success: function(data){
	    			
	    		// ===== #152. Ajax 로 검색어 입력시 자동글 완성하기 7 ===== 
	    		   if(data.length > 0) {
	    			  // 검색된 데이터가 있는 경우.
	    			  // 조심할것은 if(data != null) 으로 하면 안된다.
	    			   var resultHTML = "";
	    			  
	    			   $.each(data, function(entryIndex, entry){
	    				   var wordstr = entry.RESULTDATA.trim();
						    // 검색어 - 영주                    aj
						    // 결과물 - 김영주 프로그래머     AJAX
                            //         김영주바둑기사        ajax 프로그래밍
                            //         영주사과
                           
                            var index = wordstr.toLowerCase().indexOf( $("#search").val().toLowerCase() ); 
						    var len = $("#search").val().length;
						    var result = "";
						    
						    result = "<span class='first' style='color: blue;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color: red; font-weight: bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color: blue;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";        
                           
							resultHTML += "<span style='cursor: pointer;'>" + result + "</span><br/>"; 	   
	    			   });
	    			  
	    			   $("#displayList").html(resultHTML);
	    			   $("#displayList").show();
	    		   }
	    		   else {
	    			  // 검색된 데이터가 없는 경우.
	    			  // 조심할것은 if(data == null) 으로 하면 안된다.
	    			   $("#displayList").hide();
	    		   }
	    			
	    		},
	    		error: function(){
	   				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	   		    }
	    	});
	    	
	    }); // end of keyup(function(){})---------
	    
	    
	    // ===== #153. Ajax 로 검색어 입력시 자동글 완성하기 8 ===== 
	    $("#displayList").click(function(event){
			var word = "";
			
			var $target = $(event.target);
			
			if($target.is(".first")) {
				word = $target.text() + $target.next().text() + $target.next().next().text();
			//	alert(word);
			}
			else if($target.is(".second")) {
				word = $target.prev().text() + $target.text() + $target.next().text();
			//	alert(word);
			}
			else if($target.is(".third")) {
				word = $target.prev().prev().text() + $target.prev().text() + $target.text();
			//	alert(word);
			}
			
			$("#search").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("#displayList").hide();
			
	    });// end of $("#displayList").click()---------	
	    
		
		
	});// end of $(document).ready()----------------------
	
	
	function goSearch(){
		
		var searchFrm = document.searchFrm;
		
		var search = $("#search").val();
		
		if(search.trim() == "") {
			alert("검색어를 입력하세요!!");
		}
		else {
			searchFrm.action = "/board/list.action";
			searchFrm.method = "GET";
			searchFrm.submit();
		}
		
	}
	
	
	function searchKeep(){
		<c:if test="${not empty colname && not empty search}">
			$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
	
	
	
	

</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>글목록</h1>
	
	<table id="table">
		<tr>
			<th style="width: 70px;" >글번호</th>
			<th style="width: 360px;" >제목</th>
			<th style="width: 70px;" >성명</th>
			<th style="width: 180px;" >날짜</th>
			<th style="width: 70px;" >조회수</th>
			
			<!-- ===== #141. 첨부파일이 있음을 보여주도록 한다. ===== -->
			<th style="width: 70px;" >파일</th>
		</tr>
		
		<c:forEach var="boardvo" items="${boardList}" varStatus="status"> 
			<tr>
				<td align="center">${boardvo.seq}</td>
				<td>
	             <!-- ===== #126. 답변글인 경우 제목앞에 공백(여백)과 함께 Re 라는 글자를 붙이도록 한다. ===== -->
	             <!-- 답변글이 아닌 원글인 경우 -->
	             <c:if test="${boardvo.depthno == 0}">
		             <c:if test="${boardvo.commentCount > 0}">			
					 <a href="<%= request.getContextPath() %>/view.action?seq=${boardvo.seq}">${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super; ">[${boardvo.commentCount}]</span></a> 
					 </c:if>
					 
					 <c:if test="${boardvo.commentCount == 0}">
					 <a href="<%= request.getContextPath() %>/view.action?seq=${boardvo.seq}">${boardvo.subject}</a>
					 </c:if>
	             </c:if>
	             
	             <!-- 답변글인 경우 --> 
	             <c:if test="${boardvo.depthno > 0}">
		             <c:if test="${boardvo.commentCount > 0}">			
					 <a href="<%= request.getContextPath() %>/view.action?seq=${boardvo.seq}"><span style="color: red; font-style: italic; padding-left: ${boardvo.depthno * 20}px;">┗Re</span>${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super; ">[${boardvo.commentCount}]</span></a> 
					 </c:if>
					 
					 <c:if test="${boardvo.commentCount == 0}">
					 <a href="<%= request.getContextPath() %>/view.action?seq=${boardvo.seq}"><span style="color: red; font-style: italic; padding-left: ${boardvo.depthno * 20}px;">┗Re</span>${boardvo.subject}</a>
					 </c:if>
	             </c:if>
	             
				 </td>
				<td>${boardvo.name}</td>
				<td align="center">${boardvo.regDate}</td>
				<td align="center">${boardvo.readCount}</td>
				
				<!-- ===== #142. 첨부파일 여부 표시하기(이미지로 표시함) ===== --> 
				<td align="center">
					<c:if test="${not empty boardvo.fileName}">
						<img src="<%= request.getContextPath() %>/resources/images/disk.gif" />
					</c:if>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<br/>
	
	<!-- ===== #115. 페이지바 보여주기 ===== -->
	<div align="center" style="width: 400px; margin-left: 100px; margin-right: auto;">
		${pagebar}
	</div>
	<br/>
	
	<!-- ===== #103. 글검색 폼 추가하기 : 제목, 내용, 글쓴이로 검색하도록 한다. ===== -->
	<form name="searchFrm">
		<select name="colname" id="colname">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="name">성명</option>
		</select>
		<input type="text" name="search" id="search" size="40px"/>
		<button type="button" onClick="goSearch();">검색</button>
	</form>
	
	<!-- ===== #146. Ajax 로 검색어 입력시 자동글 완성하기 1 ===== --> 
	<div id="displayList" style="width:302px; margin-left: 61px; border: solid 1px gray; border-top: 0px;">
	</div>   
	
	
	<div style="margin-top: 20px;">
		<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/list.action'">글목록</button>&nbsp;
		<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/add.action'">글쓰기</button>
	</div>
	
</div>







