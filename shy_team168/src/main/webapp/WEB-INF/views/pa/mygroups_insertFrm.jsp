<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

#insertGrp html, #insertGrp body{
	margin-left: 80px;
	font-family: "Noto Sans KR", sans-serif;
	height: 100%; 
}

.grp_form .grp_form-title{
	margin:20px;
	text-align: center;
	font-weight: bold;
	font-size: 14pt;
}

.grp_form{
	margin-top: 5.2%;
}

.grp_form .grp_form-body{
	margin: 20px;
	display: inline-block;
	text-align: left;
}

.grp_form-body div{
	margin: 10px;
}

.grp_btn{
	margin: 5px;
}

.grp_btn button{
	background-color: #fff;
	border: 1px solid gray;
}
</style>    
<script>
	function goInsert() {
		var frm = document.makegrpFrm;
		
		frm.method = "POST";
		frm.action = "mygroups_insertEnd.shy"
		frm.submit();
	}

</script>

<div id="insertGrp" align="center">
<form name="makegrpFrm" enctype="multipart/form-data">
    <div class="grp_form" align="center">
        <div class="grp_form-title">
          그룹,<br/>
                      만들기!!
        </div>
        <div class="grp_form-body">
          <div class="input-gname">
            <input type="text" placeholder="그룹명" name="gname" style="width: 400px;"/>
          </div>
          <div class="input-name">
            <input type="text" value="${sessionScope.loginuser.name}" name="name" readonly="readonly" style="width: 400px;"/>
            <input type="hidden" value="${sessionScope.loginuser.idx}" name="fk_idx"/>
          </div>
          <div class="input-status">
            <input type="radio" name="status" value="1"/>전체공개&nbsp;&nbsp;&nbsp;
            <input type="radio" name="status" value="2"/>회원공개&nbsp;&nbsp;&nbsp;
            <input type="radio" name="status" value="3"/>비공개
          </div>
          <div class="input-img">
            <input type="file"  style="width: 400px;" name="gimg"/>
            <span style="font-size: 9pt; color: navy; font-weight: bold; ">대표이미지를 선택해주세요.</span>
          </div>
          <div class="input-desc">
            <textarea placeholder="그룹설명" name="description" style="width: 400px; height: 50px"></textarea>
          </div>
        </div>
        <div class="grp_btn">
        	<button type="submit" onclick="goInsert();">생성</button>
        	<button type="reset">취소</button>
        </div>
    </div>
</form>    
</div>