<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/jquery-ui.js"></script> 

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/myInfoEdit.js"></script> 

<script>

$( document ).ready(function() {
   
	$(".payhidden").hide();
	$("#lesspay").hide();
	
});

function morepayrecord(){
	
	$(".payhidden").show();
	$("#morepay").hide();
	$("#lesspay").show();
	
}

function lesspay(){
	
	$(".payhidden").hide();
	$("#morepay").show();
	$("#lesspay").hide();
	
}


function delaccount() {
	
	msg = "대표 계좌를 삭제하시겠습니까?"
	if(confirm(msg)!=0){
		
		alert("삭제되었습니다.");
		$("#1account").text("등록된 대표 계좌가 없습니다");
		
	}else{
		
	}
	
}

function gobankshy(number){
	
	var place = "payplace"+number;
	var price = "payprice"+number;
	var ttext = $("."+place).text();
	var ttext2 = $("#"+price).text();
	ttext = "'" + ttext + "' 에서의 shy-pay!";
	
	$("#shypay").val(ttext);
	$("#shyprice").val(ttext2);
	
	 $("#shyprice").show();
	 $("#shypay").show();
	 $("#pricecheck").show();
	 $("#pricecheck2").show();
	
	pay_shynow();
	
}

</script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/juno/myInfoEdit.css"/> 

<title>myInfoEdit</title>

</head>

<body>

<div class="container">
  <div class="jumbotron" style="background-color: rgba(10,10,10, 0.05);">
    <h2 class="">shy 뱅킹 관리</h1>
    <h6 class=""  style="margin-top: 2em;">
    	<span style="font-weight: bold;">${getMemberVO.name}</span>님의 회원정보입니다.<br/>
    	회원님의 계좌, 거래내역 등의 금융 정보는 개인정보처리방침과 금융결제원의 약관에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
    	<a>개인정보처리방침</a>
    </h6>
    
    <div class="row" style="margin-top: 2em;">
      
      
      <div class="col-md-12">
        	<div class="bs-example" data-example-id="simple-table">
			    <table class="table nofill table-striped" style="width: 100%;">
					
					<tbody class="table-hover">
						
						<tr class="fisrtcol" style="border-top:2px solid #27303e;">
						
							<td class="text-left colname" >대표계좌</td>
							<td class="text-left">
							
							
							<span id="1account">테스트 뱅크(은행코드 : 092)  *** 23 ** 213 *******</span>
							
							<br>
							<button type="button" class="info_edit_btn show_more_cancle_btn" onclick="delaccount();">대표계좌 삭제</button>
				            
				            
				            
			                
			                </td>
			               
						</tr>
					
						
						
						
						<tr>
							<td class="text-left colname">추가등록계좌</td>
							<td class="text-left">
				                <span>테스트 뱅크(은행코드 : 092)  1** 33 ** 213 ****323</span><br/>
				                <span>테스트 뱅크(은행코드 : 092)  1** 33 ** 213 ****523</span><br/>
				                <br/>
				                <!-- <span>
					                $hy 페이 서비스는 해당 서비스의 마이페이지에서 수신 여부를 설정할 수 있습니다.<br/>
					                주요 공지사함 및 이벤트 당첨 안내등은 <span style="color: red;">수신 동의 여부에 관계없이 발송</span>되며, 이메일 수신동의 상태의 반영은 최대 2일이 소요될 수 있습니다.
				                </span> -->
				                <button type="button" class="info_edit_btn show_more_btn">상세보기</button>
				                <div class="hiddenpart">
				                	
				                <br/><span>금융결제원에서 등록하신 비밀번호를 입력하세요</span><br/>
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name" id="column_name" value="email"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="password" class="inputcol" id="id_email" name="email" value="${getMemberVO.email}" />
				                <button type="button" class="info_edit_btn">확인</button><br/>
				                
				                <button type="button" class="info_edit_btn show_more_cancle_btn">닫기</button>
				                
				                </div>
			                </td>
						</tr>
						
						
						
						<tr>
							<td class="text-left colname">결제내역조회</td>
							<td class="text-left">
								
								
				                <table class="table nofill table-striped" style="width:90%; font-size: 11pt;">
				                <tr>
				                <td>2017년 7월 7일 오후 8시 25분 </td><td style="border-left: 1px solid #ddd;" class="payplace1">gs25 선유도점</td><td style="border-left: 1px solid #ddd;" id="payprice1">5,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(1);"></i></td>
				                </tr>
				                <tr>
				                <td>2017년 7월 7일 오후 3시 18분 </td><td style="border-left: 1px solid #ddd;" class="payplace2">카카오택시</td><td style="border-left: 1px solid #ddd;" id="payprice2">8,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(2);"></i></td>
				                </tr>
				                <tr>
				                <td>2017년 7월 5일 오후  6시 55분 </td><td style="border-left: 1px solid #ddd;" class="payplace3">오레노라멘</td><td style="border-left: 1px solid #ddd;" id="payprice3">7,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(3);"></i></td>
				                </tr>
				                <tr>
				                <td>2017년 7월 3일 오후 12시 33분 </td><td style="border-left: 1px solid #ddd;" class="payplace4">버거킹 당산역점</td><td style="border-left: 1px solid #ddd;" id="payprice4">5,100원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(4);"></i></td>
				                </tr>
				                <tr>
				                <td>2017년 7월 3일 오전 1시 15분 </td><td style="border-left: 1px solid #ddd;" class="payplace5">세븐일레븐 능안공원점</td><td style="border-left: 1px solid #ddd;" id="payprice5">1,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(5);" ></i></td>
				                </tr>
				                <tr class="payhidden">
				                <td>2017년 7월 2일 오후 2시 56분 </td><td style="border-left: 1px solid #ddd;" class="payplace6">테스트</td><td style="border-left: 1px solid #ddd;" id="payprice6">132,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(6);"></i></td>
				                </tr>
				                <tr class="payhidden">
				                <td>2017년 7월 1일 오전 9시 5분 </td><td style="border-left: 1px solid #ddd;" class="payplace7">테스트</td><td style="border-left: 1px solid #ddd;" id="payprice7">9,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(7);"></i></td>
				                </tr>
				                <tr  class="payhidden">
				                <td>2017년 7월 1일 오전 9시 5분 </td><td style="border-left: 1px solid #ddd;" class="payplace8">테스트</td><td style="border-left: 1px solid #ddd;" id="payprice8">6,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(8);"></i></td>
				                </tr>
				                <tr  class="payhidden">
				                <td>2017년 7월 1일 오전 9시 5분 </td><td style="border-left: 1px solid #ddd;" class="payplace9">테스트</td><td style="border-left: 1px solid #ddd;" id="payprice9">999,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(9);"></i></td>
				                </tr>
				                <tr  class="payhidden">
				                <td>2017년 7월 1일 오전 9시 5분 </td><td style="border-left: 1px solid #ddd;" class="payplace10">갑부테스트</td><td style="border-left: 1px solid #ddd;" id="payprice10">200,999,000원</td>
				                <td><i class="fa fa-pencil-square-o" aria-hidden="true" onclick="gobankshy(10);"></i></td>
				                </tr>
				                
				                </table>
				                <br/><button type="button" id ="morepay" class="info_edit_btn show_more_btn" onclick ="morepayrecord();">더보기</button>
				               <button type="button" id ="lesspay" class="info_edit_btn " onclick="lesspay();">닫기</button>
				             
				                
			                </td>
						</tr>
						
						
						
						<tr>
							<td class="text-left colname">잔액확인</td>
							<td class="text-left"><span></span>
				                <button type="button" class="info_edit_btn show_more_btn" style="margin-top: 0px;">잔액조회하기</button>
				                <div class="hiddenpart" style="display: block;">
				                	
								    <button type="button" class="info_edit_btn show_more_cancle_btn">취소</button>
								</div>
			                </td>
						</tr>
						
						
						
						<tr>
							<td class="text-left colname">송금하기</td>
							<td class="text-left">
				                <span style="font-size: 12pt;">서비스 준비중입니다 :)</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart" style="max-width: 80%;">
				                        <button type="button" class="info_edit_btn show_more_cancle_btn">송금취소</button>
				                </div>
			                </td>
						</tr>
						
						<tr>
							<td class="text-left colname">송금요청하기</td>
							<td class="text-left">
				                송금을 부탁할 샤이 멤버를 부르세요! <br>
				                <input type="text" class="inputcol"/>
				                <br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart">
				                
				         
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
			                </td>
						</tr>
						
						
				
					</tbody>
				</table>
			</div>
        </div>
        
    </div>
  </div>
</div>



</body>
</html>