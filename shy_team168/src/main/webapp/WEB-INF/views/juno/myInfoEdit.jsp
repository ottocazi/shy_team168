<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/jquery-ui.js"></script> 

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/juno/myInfoEdit.js"></script> 
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/juno/myInfoEdit.css"/> 

<title>myInfoEdit</title>

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
						<form name="myimgFrm" id="myimgFrm" >
						<tr class="fisrtcol" style="border-top:2px solid #27303e;">
							<td class="text-left colname">프로필사진</td>
							<td class="text-left">
							<img class="img-responsive img-circle" src="" >
							
							<input type="hidden" name="idx" value="${getMemberVO.idx}" />
							<input type="hidden" name="column_name"  />
			                <input type="hidden" name="edited_content" />
			                
							<input type="hidden" class="inputcol" id="id_myimg" name="myimg" value="${getMemberVO.myimg}" />
							<button type="button" class="info_edit_btn editPRend">사진변경</button>
							<button type="button" class="info_edit_btn">삭제</button>
							 <input type="hidden" name="column_name"  />
				             <input type="hidden" name="edited_content" />
			                </td>
						</tr>
						</form>
						
						<form name="emailFrm" id="emailFrm">
						<tr>
							<td class="text-left colname">이메일</td>
							<td class="text-left">${getMemberVO.email}
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
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="text" class="inputcol" id="id_email" name="email" value="${getMemberVO.email}" />
				                <button type="button" class="info_edit_btn">인증메일발송</button><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                
				                </div>
			                </td>
						</tr>
						</form>
						
						<form name="nameFrm" id="nameFrm">
						<tr>
							<td class="text-left colname">사용자 이름</td>
							<td class="text-left">
								
								${getMemberVO.name}
				                <br/><span style="text-decoration: line-through;">개명으로 이름이 변경된 경우에 한하여 변경이 가능합니다.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">이름변경</button>
				                
				                <div class="hiddenpart">
				                변경할 이름
				                <br/><span>변경할 이름을 입력하세요.</span><br/>
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="text" class="inputcol" id="id_name" name="name" value="${getMemberVO.name}" />
				                <button type="button" class="info_edit_btn">중복확인</button><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                <input type="hidden" name="column_name"  />
				                <input type="hidden" name="edited_content" />
				                </div>
			                </td>
						</tr>
						</form>
						
						<form name="pwdFrm" id="pwdFrm">
						<tr>
							<td class="text-left colname">비밀번호</td>
							<td class="text-left"><span></span>
				                <button type="button" class="info_edit_btn show_more_btn" style="margin-top: 0px;">수정</button>
				                <div class="hiddenpart" style="display: block;">
				                	비밀번호 변경
				                	<br/><span><a>안전한 비밀번호로 내정보를 보호</a>하세요</span>
				                	<br/><span><span style="color: red;">다른 아이디/사이트에서 사용한적 없는 비밀번호<br/> 이전에 사용한 적 없는 비밀번호</span>가 안전합니다.</span><br/>
				                	
				                	<input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                	<input type="hidden" name="column_name"  />
				                	<input type="hidden" name="edited_content" />
				                	
				                	<input placeholder="현재 비밀번호" type="password" value="${getMemberVO.pwd}"  tabindex="1"  autofocus style="margin-top: 30px;"> <br/>
				                	<input placeholder="새 비밀번호" type="password" class="inputcol" id="id_pwd" name="pwd"  tabindex="2"  style="margin-top: 30px;"> <br/>
				                	<input placeholder="새 비밀번호 확인" type="password" tabindex="2" > <br/>
				                	<button type="button" class="info_edit_btn editend">확인</button>
								    <button type="button" class="info_edit_btn show_more_cancle_btn">취소</button>
								</div>
			                </td>
						</tr>
						</form>
						
						<form name="phoneFrm" id="phoneFrm">
						<tr>
							<td class="text-left colname">연락처</td>
							<td class="text-left">${getMemberVO.phone}
				                <br/><span>아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 <br/>또는 유료 결제 등 shy로부터 알림을 받을 때 사용할 휴대전화입니다.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart" style="max-width: 80%;">
				                변경할 연락처
				                <br/><span>변경할 연락처를 입력하세요. (예: 01087644212)</span><br/>
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="text" class="inputcol" id="id_phone" name="phone" value="${getMemberVO.phone}" /><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
			                </td>
						</tr>
						</form>
						
						<form name="genderFrm" id="genderFrm">
						<tr>
							<td class="text-left colname">성별</td>
							<td class="text-left">${getMemberVO.gender}
				                <br/><span>성별이 변경된 경우에 한하여 변경이 가능합니다.</span>
				                <br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
				                <div class="hiddenpart">
				                변경할 성별
				                <br/><span>변경할 성별을 고르세요</span><br/>
				                <div id="">
				                
				                <input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                <input type="hidden" name="column_name"  />
				                <input type="hidden" name="edited_content" />
				                
				                <input type="radio" value="남" class="inputcol" name="gender" style="margin-top: 30px;"/>남&nbsp;&nbsp;
				                <input type="radio" value="여" class="inputcol" name="gender" />여
				                </div>
				                <br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
			                </td>
						</tr>
						</form>
						
						<form name="myintroFrm" id="myintroFrm">
						<tr class="lastcol" style="border-bottom:2px solid #27303e;">
							<td class="text-left colname">자기소개</td>
							<td class="text-left">${getMemberVO.myintro}
								<br/><button type="button" class="info_edit_btn show_more_btn">수정</button>
								<div class="hiddenpart">
				                변경할 자기소개
				                <br/><span>변경할 자기소개를 입력하세요.</span><br/>
				                <fieldset style="margin-top: 30px; width: 100%; height: 50px;">
				                	
				                	<input type="hidden" name="idx" value="${getMemberVO.idx}" />
				                	<input type="hidden" name="column_name"  />
			               			<input type="hidden" name="edited_content" />		
			               			
							    	<textarea cols="35" rows="4" class="inputcol" id="id_myintro" name="myintro" tabindex="5"  style="resize: none; width: 80%;">${getMemberVO.myintro}</textarea>
							    </fieldset><br/>
				                <button type="button" class="info_edit_btn editend">수정완료</button>
				                <button type="button" class="info_edit_btn show_more_cancle_btn">수정취소</button>
				                </div>
							</td>
						</tr>
						</form>
					</tbody>
				</table>
			</div>
        </div>
        
    </div>
  </div>
</div>



</body>
</html>