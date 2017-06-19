<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/jquery-ui.js"></script> 
<title>myInfoEdit</title>


   



<style type="text/css">


/*** Table Styles **/
.table td.colname {
	font-weight: bold;
}
.table td span {
	font-size: 11px;
	color: grey;
	line-height: 1px;
}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	padding:22px;
}

.table.nofill tr{
	  border-top: 1px solid #C9D1D8;
}

.table.nofill tr:first-child{
  	border-top: none;
}

.table tr:last-child{
	border-bottom: 1px solid #C9D1D8;
}

.table td{
	vertical-align: top;
	color:#576475;
	font-weight:400;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	font-size: 16px;
	background-color: white;
	width:50px;
}

.table td img{
	height: 120px;
	width: 120px;
}

.table td .info_edit_btn{
	background-color: white;
	margin-top: 30px;
	border: solid 1px grey;
	border-radius: inherit;
	font-weight: bold;
	font-size: 14px;
	width: 100px;
	height: 30px;
}

.hiddenpart {
	margin-top: 30px;
}

.table td .editend{
	background-color: rgba(247,202,201, 1);
}
.table td:first-child{
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.table td:last-child{
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	border-left: 1px solid #C9D1D8 !important;
}

.table-striped tbody > tr:nth-child(2n+2) > td, .table-striped tbody > tr:nth-child(2n+2) > th {
	background-color:#fafafa;
	border:none;
}

tbody.table-hover  tr:hover>td, .table-hover tbody tr:hover>th {
  background-color: rgba(86, 98, 108, 0.1);
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}


</style>

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
	});
	
</script> 

</head>

<body>

<div class="container">
  <div class="jumbotron" style="background-color: rgba(10,10,10, 0.05);">
    <h2 class="">회원정보수정</h1>
    <h6 class=""  style="margin-top: 2em;">
    	<span>noward</span>님의 회원정보입니다.<br/>
    	회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
    	<a>개인정보처리방침</a>
    </h6>
    
    <div class="row" style="margin-top: 2em;">
      
      
      <div class="col-md-12">
        	<div class="bs-example" data-example-id="simple-table">
			    <table class="table nofill table-striped" style="width: 100%;">
					
					<tbody class="table-hover">
						<tr class="fisrtcol" style="border-top:2px solid #27303e;">
							<td class="text-left colname">프로필사진</td>
							<td class="text-left">
							<img class="img-responsive img-circle" src="http://eduncovered.com/wp-content/uploads/2014/06/sad-frog.jpg" >
							<button type="button" class="info_edit_btn">사진변경</button>
							<button type="button" class="info_edit_btn">삭제</button>
			                </td>
						</tr>
						<tr>
							<td class="text-left colname">이메일</td>
							<td class="text-left">junorous@gmail.com
				                <br/><span>아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 이메일 주소입니다.</span><br/>
				                <input type="checkbox"><span style="margin-left: 10px;">shy의 이벤트 등 프로모션 관련 안내 메일을 수신하겠습니다.</span>
				                <br/>
				                <!-- <span>
					                $hy 페이 서비스는 해당 서비스의 마이페이지에서 수신 여부를 설정할 수 있습니다.<br/>
					                주요 공지사함 및 이벤트 당첨 안내등은 <span style="color: red;">수신 동의 여부에 관계없이 발송</span>되며, 이메일 수신동의 상태의 반영은 최대 2일이 소요될 수 있습니다.
				                </span> -->
				                <button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart">
				                변경할 이메일
				                <br/><span>변경할 이메일 주소를 입력하세요. (예: abc@gmail.com)</span><br/>
				                <input type="text" value="junorous@gmail.com" />
				                <button type="button" class="info_edit_btn">인증메일발송</button><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
				                
				                
				                
			                </td>
						</tr>
						<tr>
							<td class="text-left colname">사용자 이름</td>
							<td class="text-left">임준호
				                <br/><span style="text-decoration: line-through;">개명으로 이름이 변경된 경우에 한하여 변경이 가능합니다.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">이름변경</button>
				                <div class="hiddenpart">
				                변경할 이름
				                <br/><span>변경할 이름을 입력하세요.</span><br/>
				                <input type="text" value="임준호" />
				                <button type="button" class="info_edit_btn">중복확인</button><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
			                </td>
						</tr>
						<tr>
							<td class="text-left colname">비밀번호</td>
							<td class="text-left"><span></span>
				                <button type="button" class="info_edit_btn" style="margin-top: 0px;">수정</button>
			                </td>
						</tr>
						<tr>
							<td class="text-left colname">연락처</td>
							<td class="text-left">010-8***-***2
				                <br/><span>아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 <br/>또는 유료 결제 등 shy로부터 알림을 받을 때 사용할 휴대전화입니다.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart">
				                변경할 연락처
				                <br/><span>변경할 연락처를 입력하세요. (예: 01087644212)</span><br/>
				                <input type="text" value="01087644212" /><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
			                </td>
						</tr>
						<tr>
							<td class="text-left colname">성별</td>
							<td class="text-left">남
				                <br/><span>성별이 변경된 경우에 한하여 변경이 가능합니다.</span>
				                <br/><button type="button" class="info_edit_btn">수정</button>
			                </td>
						</tr>
						<tr class="lastcol" style="border-bottom:2px solid #27303e;">
							<td class="text-left colname">자기소개</td>
							<td class="text-left">^~^///
								<br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
								<div class="hiddenpart">
				                변경할 자기소개
				                <br/><span>변경할 자기소개를 입력하세요.</span><br/>
				                <input type="text" value="^~^///"/><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
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