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
	$(".editend").click(function(){
		var column_name = $(this).parent().find("#column_name").val();
		alert(column_name);
		var edited_content = $("#id_"+column_name).val();
		
		
		alert("바뀔내용 : " + edited_content);
		
		var form_name = column_name + "Frm";
		alert("form_name : "+form_name);
		
		test();
		if(column_name =="myimg"){
			
			document.myimgFrm.action ="myInfoEditEnd.shy";
			document.myimgFrm.method="post";
			document.myimgFrm.submit();
		} else {
			myInfoEditEnd(column_name,edited_content,form_name);
		}
	});
	

});


function myInfoEditEnd(column_name,edited_content,form_name) {
	
	
	
	alert("myInfoEditEnd() 실행");
	alert(column_name);
//	if(column_name == 'myimg') {
//		document.myimgFrm.column_name.value = column_name;
//		document.myimgFrm.edited_content.value = edited_content;
//		document.myimgFrm.action = "/shy/myInfoEditEnd.shy";	
//		document.myimgFrm.method = "POST";
//		document.myimgFrm.submit();
//	} else 
		if(column_name == 'email') {
		document.emailFrm.column_name.value = column_name;
		document.emailFrm.edited_content.value = edited_content;
		document.emailFrm.action = "/shy/myInfoEditEnd.shy";	
		document.emailFrm.method = "POST";
		document.emailFrm.submit();
	} else if(column_name == 'name') {
		document.nameFrm.column_name.value = column_name;
		document.nameFrm.edited_content.value = edited_content;
		document.nameFrm.action = "/shy/myInfoEditEnd.shy";	
		document.nameFrm.method = "POST";
		document.nameFrm.submit();
	} else if(column_name == 'pwd') {
		document.pwdFrm.column_name.value = column_name;
		document.pwdFrm.edited_content.value = edited_content;
		document.pwdFrm.action = "/shy/myInfoEditEnd.shy";	
		document.pwdFrm.method = "POST";
		document.pwdFrm.submit();
	} else if(column_name == 'phone') {
		document.phoneFrm.column_name.value = column_name;
		document.phoneFrm.edited_content.value = edited_content;
		document.phoneFrm.action = "/shy/myInfoEditEnd.shy";	
		document.phoneFrm.method = "POST";
		document.phoneFrm.submit();
	} else if(column_name == 'gender') {
		document.genderFrm.column_name.value = column_name;
		document.genderFrm.edited_content.value = edited_content;
		document.genderFrm.action = "/shy/myInfoEditEnd.shy";	
		document.genderFrm.method = "POST";
		document.genderFrm.submit();
	} else if(column_name == 'myintro') {
		document.myintroFrm.column_name.value = column_name;
		document.myintroFrm.edited_content.value = edited_content;
		document.myintroFrm.action = "/shy/myInfoEditEnd.shy";	
		document.myintroFrm.method = "POST";
		document.myintroFrm.submit();
	}
	

	alert("submit() 완료");
}

function test() {
	alert("test function 실행");
}