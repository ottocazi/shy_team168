<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/jquery-ui.js"></script> 


<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/juno/myInfoEdit.css"/> 

<script type="text/javascript">


$(document).ready(function(){
	/* 열고 닫기 */
	$(".hiddenpart").hide();
	
	$(".show_more_btn").click(function(){
		$(this).hide();
		$(this).parent().find(".hiddenpart").show();
	});
	
	$(".show_more_cancle_btn").click(function(){
		$(this).parent().parent().find(".hiddenpart").hide();
		$(this).parent().parent().find(".show_more_btn").show();
	});
		
	
	
	
	/* 수정완료	*/
	$(".applybusiEnd").click(function(){
	
		
		
		applybusiEnd(categoryno,bname,busicontent,busicall,busimail);
		
	});
	
	
	
	
	

});


function applybusiEnd() {
	
	/*categoryno,bname,busicontent,busicall,busimail  */
	//alert("applybusiEnd() 실행");
	
		//alert("카테고리 value는 : "+$("#categoryno").val());
		/* document.applybusiFrm.bname.value = bname;
		document.applybusiFrm.busicontent.value = busicontent;
		document.applybusiFrm.busicall.value = busicall;
		document.applybusiFrm.busimail.value = busimail; */
		document.applybusiFrm.action = "/shy/applybusiEnd.shy";	
		document.applybusiFrm.method = "POST";
		document.applybusiFrm.submit(); 
		
	

	alert("submit() 완료");
}






</script>





<title>myInfoEdit</title>

</head>

<body>

<div class="container">
  <div class="jumbotron" style="background-color: rgba(10,10,10, 0.05);">
    <h2 class="">사업자 신청하기</h1>
    
		
							
    <h6 class=""  style="margin-top: 2em;">
    	Shy와 함께하는 사업! 파트너가 되어 함께 더 좋은 생활을 만들어주세요!
    </h6>
    
    <div class="row" style="margin-top: 2em;">
      
      
      <div class="col-md-12">
        	<div class="bs-example" data-example-id="simple-table">
			    <table class="table nofill table-striped" style="width: 100%;">
					
					<tbody class="table-hover" style=" font-size: 10pt; ">
						
						
						
							<form name="applybusiFrm" id="applybusiFrm">
							
						<tr class="fisrtcol" style="border-top:2px solid #27303e;">
							<td class="text-left colname">사용자 이름</td>
							<td class="text-left">
								
								${getMemberVO.name}님
								<br/><span>'사업명/상호명'을 입력해주세요.</span><br/>
								<input type="text" class="inputcol" id="bname" name="bname" />
								
				                <select name="categoryno" id="categoryno" style="width: 100px; height: 30px" > 
								<option value="1">서비스업</option>
								<option value="2">야근업</option>
								<option value="3">개발업</option>
								</select>
				                
				                
			                </td>
						</tr>
						
						
						
						
						
						
						<tr >
						
							<td class="text-left colname">사업 내용</td>
							<td class="text-left">
							
							
							
							
				            <input type="hidden" name="userseq" value="${loginuser.idx}"/>
							<textarea id="busicontent" name="busicontent" class="swal2-textarea" placeholder="성공적인 사업을 위한 당신의 멋진 설계를 보여주세요!  (야근필수)" 
							 style="width: 350px; height: 350px; font-size: 10pt;"></textarea>
							
							<br>
							<span style="font-size:12pt;">파일자료 첨부하기</span>
							<input type="file" name="myimg" />
				            
				            
				            
			                
			                </td>
			               
						</tr>
						
						
						
						
						
						
						
						
						<tr>
							<td class="text-left colname">이메일</td>
							<td class="text-left" id="secondarea">${getMemberVO.email}
				                <br/><span>가입하신 이메일입니다. 다른 이메일을 사용하시려면 아래의 '새로 입력'을 클릭해주세요.</span>
				                <br/>
				                <button type="button" class="info_edit_btn show_more_btn">새로 입력</button>
				                
				                <div class="hiddenpart email">
				                
				                <br/><span>이메일 주소를 입력하세요. (예: abc@gmail.com)</span><br/>
				                
				                <input type="hidden" name="idx"  value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name" id="column_name" value="email"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="text" class="inputcol" id="busimail" name="busimail" value="${getMemberVO.email}" />
				                <button type="button" class="info_edit_btn">인증메일발송</button><br/>
				                
				                <button type="button" class="info_edit_btn show_more_cancle_btn">확인</button>
				                
				                </div>
			                </td>
						</tr>
						
						
					
						
						
						
						
						<tr>
							<td class="text-left colname">연락처</td>
							<td class="text-left">${getMemberVO.phone}
				                <br/><span>가입하신 정보의 연락처입니다. 다른 연락처를 사용하시려면 아래의 '새로 입력'을 클릭해주세요.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">새로 입력</button>
				                <div class="hiddenpart tel" style="max-width: 80%;">
				                
				                <br/><span>변경할 연락처를 입력하세요. ( "-" 없이 입력해주세요.)</span><br/>
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name" id="column_name"  value="phone" />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="text" class="inputcol" id="busicall" name="busicall" value="${getMemberVO.phone}" /><br/>
				                
				                <button type="button" class="info_edit_btn show_more_cancle_btn">확인</button>
				                </div>
			                </td>
						</tr>
						</form>
						
						
						
						
					</tbody>
				</table>
				<button type="button" class="info_edit_btn applybusiEnd" style="float: right; padding: 20px; font-weight: bold;">신청하기</button>
			</div>
			
        </div>
        
    </div>
    
  </div>
  
</div>



</body>
</html>