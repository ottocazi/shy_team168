<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 로컬테스트 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/fintech/ext_lib/bootstrap-3.3.6-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/fintech/ext_lib/bootstrap-3.3.6-dist/css/bootstrap-theme.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/fintech/css/common.css">
<!-- 사용자정의 css -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/ext_lib/etc/ext_util.js"></script>
<!-- 외부 유틸 js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/js/constants.js"></script>
<!-- 상수 js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/fintech/js/common.js"></script>
<!-- 사용자정의 js -->

<style>
.dd_button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.dd_button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}
</style>

<script>
	/**
	 * DOM content loaded
	 */

	$(document).ready(function() {

		$(".hidden1").hide();
		$("#btnAuthCode").show();
	});
	$(function() {

		resizeResultTextArea(70);
		setDefaultFieldVal();
		bindEvents();
	});

	/**
	 * 버튼 이벤트 바인딩
	 */

	function next() {

		location.href="banking.shy";

		
	}
	function bindEvents() {

		$('#btnAuthCode').on('click', function() {
			invokeAuthorize();
		});
		$('#btnAuthCode2').on('click', function() {
			invokeAuthorize2();
		});
		$('#btnToken').on('click', function() {
			getTokenByAuthCode();
		});
		$('#btnTokenByRT').on('click', function() {
			getTokenByRT();
		});
		$('#btnUserMe').on('click', function(e) {
			getUserInfo(e);
		});
		$('#btnAccountList').on('click', function(e) {
			getUserInfo(e);
		});
		$('#btnResultClear').on('click', function(e) {
			$('#resultTextArea').val('');
		});
		$('#btnResultCopy').on('click', function(e) {
			copyClip('resultTextArea');
		});
		$('#auth_type').on('change', function(e) {
			toggleHeaderParams(e);
		}).trigger('change'); // 바인딩과 동시에 최초 1회 호출하여 일부 필드의 활성화/비활성화 반영
		bindAllChildrenSelect('.panel-body', 'input');
		bindValidateNumOnly($('#Kftc-Bfop-UserInfo'));
	}

	/**
	 * Auth type select box change 이벤트 핸들러 
	 */
	function toggleHeaderParams(e) {

		$('input[id^=Kftc-Bfop-]').attr('disabled', 'disabled');
		var $activeHeaderInputs = getActiveHeaderInputs();
		if ($activeHeaderInputs != null) {
			getActiveHeaderInputs().removeAttr('disabled');
		}
	}

	/**
	 * header 값을 넘길 목적으로 생성한 input 중에서 현재 auth_type 에 따라 활성화된 input의 집합만 선별하여 리턴한다.
	 */
	function getActiveHeaderInputs() {

		var val = $('#auth_type').val(), $hips = $('input[id^=Kftc-Bfop-]');
		switch (val) {
		case '0': // 모든 header 값을 넘기지 않는다.
			return null;
			break;
		case '1': // 몇몇 항목을 제외한 header 값을 넘긴다.
			return $hips.not('#Kftc-Bfop-AccessToken');
			break;
		case '2': // 몇몇 항목을 제외한 header 값을 넘긴다.
			return $hips
					.not('#Kftc-Bfop-UserName, #Kftc-Bfop-UserInfo, #Kftc-Bfop-UserCellNo, #Kftc-Bfop-UserEmail');
			break;
		}
	}

	/**
	 * authorize2 호출
	 */
	function invokeAuthorize() {

		/*
		 * 최초 form submit 으로 구현하려 했으나, header 값을 넘길 수가 없어서 ajax로 우회하기로 함.
		 */
		// 	var frm = $('#authCodeReqFrm')[0];
		// 	frm.action = getSvrProps('base_api_uri') + '/oauth/2.0/authorize2';
		// 	frm.target = '_blank';
		// 	frm.method = 'get';
		// 	frm.submit();
		/* 
		 * ajax로 호출 후 GW에서 invoke_type 을 보고 분기처리 하여 302 redirection이 아닌, 200 json 응답으로 location 정보를 주면, 그 location으로 프로바이더 페이지를 띄운다. 
		 */
		var frm = $('#authCodeReqFrm')[0], $frm = $(frm);
		var params = getFormParamObj('authCodeReqFrm');
		params['invoke_type'] = 'ajax'; // 이 경우, GW에서는 302 redirect 응답이 아닌 json 응답을 주도록 처리한다.
		// 	params['provider_env'] = 'local';  // 로컬서버(포탈)의 프로바이더 페이지 테스트를 할 경우 활성화

		// 현재 활성화된 header 필드만 골라서 headers 파라미터 객체를 생성한다.
		var headers = {};
		var $activeHeaderInputs = getActiveHeaderInputs();
		if ($activeHeaderInputs != null) {
			$activeHeaderInputs
					.each(function(i) {
						var input = this, $input = $(input), id = input.id, val = $input
								.val();
						if (id == 'Kftc-Bfop-UserName') {
							val = encodeURIComponent(val);
						}
						headers[id] = val;
					});
		}

		// 	dc('## params: '+js(params));
		dc('## headers: ' + js(headers));

		$.ajax({
			url : getSvrProps('base_api_uri') + '/oauth/2.0/authorize2',
			type : 'get',
			headers : headers,
			data : params
		}).done(
				function(data, textStatus, jqXHR) {
					if (isGatewayException(data)) {
						return;
					} // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
					// 		dc('## data: '+js(data));

					var tmpWin = window.open('about:blank', 'shy에 계좌등록하기',
							"height=500,width=500");
					tmpWin.location.href = data.location; // 프로바이더 페이지 호출
				});

	}

	function invokeAuthorize2() {

		/*
		 * 최초 form submit 으로 구현하려 했으나, header 값을 넘길 수가 없어서 ajax로 우회하기로 함.
		 */
		// 	var frm = $('#authCodeReqFrm')[0];
		// 	frm.action = getSvrProps('base_api_uri') + '/oauth/2.0/authorize_account2';
		// 	frm.target = '_blank';
		// 	frm.method = 'get';
		// 	frm.submit();
		/* 
		 * ajax로 호출 후 GW에서 invoke_type 을 보고 분기처리 하여 302 redirection이 아닌, 200 json 응답으로 location 정보를 주면, 그 location으로 프로바이더 페이지를 띄운다. 
		 */
		var frm = $('#authCodeReqFrm')[0], $frm = $(frm);
		var params = getFormParamObj('authCodeReqFrm');
		params['invoke_type'] = 'ajax'; // 이 경우, GW에서는 302 redirect 응답이 아닌 json 응답을 주도록 처리한다.
		// 	params['provider_env'] = 'local';  // 로컬서버(포탈)의 프로바이더 페이지 테스트를 할 경우 활성화

		// 현재 활성화된 header 필드만 골라서 headers 파라미터 객체를 생성한다.
		var headers = {};
		var $activeHeaderInputs = getActiveHeaderInputs();
		if ($activeHeaderInputs != null) {
			$activeHeaderInputs
					.each(function(i) {
						var input = this, $input = $(input), id = input.id, val = $input
								.val();
						if (id == 'Kftc-Bfop-UserName') {
							val = encodeURIComponent(val);
						}
						headers[id] = val;
					});
		}

		// 	dc('## params: '+js(params));
		dc('## headers: ' + js(headers));

		$.ajax(
				{
					url : getSvrProps('base_api_uri')
							+ '/oauth/2.0/authorize_account2',
					type : 'get',
					headers : headers,
					data : params
				}).done(
				function(data, textStatus, jqXHR) {
					if (isGatewayException(data)) {
						return;
					} // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
					// 		dc('## data: '+js(data));

					var tmpWin = window.open('about:blank', 'shy 계좌등록확인',
							"height=500,width=500");
					tmpWin.location.href = data.location; // 프로바이더 페이지 호출
				});

	}

	/**
	 * Authorization Code 발급 결과를 UI에 바인딩한다.
	 */
	function bindAuthResults(o) {

		for (key in o) {
			setElemVal(key, o);
		}
	}
</script>
</head>

<body>

	<div class="childWrap hidden1">

		<div class="panel panel-primary">

			<!-- 컨텐츠 영역의 타이틀 -->
			<div class="panel-heading">
				<h3 id="pageTitle" class="panel-title" title="authorize2">/oauth/2.0/authorize2</h3>
			</div>

			<!-- 컨텐츠 영역 -->
			<div class="panel-body">

				<!-- auth code 요청용 form -->
				<form id="authCodeReqFrm">

					<div class="fieldRow">
						<div>Client ID:</div>
						<div>
							<input type="text" class="input-sm" id="client_id"
								name="client_id"></input>
						</div>
					</div>

					<div class="fieldRow">
						<div>Client Secret:</div>
						<div>
							<input type="text" class="input-sm" id="client_secret"
								name="client_secret"></input><span> (토큰발급시 필요)</span>
						</div>
					</div>

					<div class="fieldRow">
						<div>Response Type:</div>
						<div>
							<input type="text" class="input-sm" id="response_type"
								name="response_type" style="width: 55px" value="code" />
						</div>
					</div>

					<div class="fieldRow">
						<div>Scope:</div>
						<div>
							<input type="text" class="input-sm" id="scope" name="scope"
								style="width: 150px" value="" /> 공백문자(" ")를 구분자로 하여 multi scope
							요청 가능 (예: login transfer)
						</div>
					</div>

					<div class="fieldRow">
						<div>Redirect URI:</div>
						<div>
							<input type="text" class="input-sm" id="redirect_uri"
								name="redirect_uri" style="width: 392px" />
						</div>
					</div>

					<div class="fieldRow">
						<div>Client Info:</div>
						<div>
							<input type="text" class="input-sm" id="client_info"
								name="client_info" style="width: 392px" />
						</div>
					</div>

					<div class="fieldRow">
						<div>Auth type:</div>
						<div>
							<select id="auth_type" name="auth_type" class="form-control"
								style="height: 26px; font-size: 14px; padding: 1px 3px">
								<option value="0">CASE 1 (0)</option>
								<option value="1">CASE 2 (1)</option>
								<option value="2">CASE 3 (2)</option>
							</select>
						</div>
					</div>

					<div class="fieldRow" style="height: 25px">
						<div style="width: 60px; float: left; margin-left: 145px">BG
							color:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="bg_color" name="bg_color"
								style="width: 85px" />
						</div>
						<div style="width: 70px; float: left; margin-left: 15px">TXT
							color:</div>
						<div style="float: left">
							<input type="text" class="input-sm" id="txt_color"
								name="txt_color" style="width: 85px" />
						</div>
						<div style="width: 75px; float: left; margin-left: 15px">BTN1
							color:</div>
						<div style="float: left">
							<input type="text" class="input-sm" id="btn1_color"
								name="btn1_color" style="width: 85px" />
						</div>
						<div style="width: 75px; float: left; margin-left: 15px">BTN2
							color:</div>
						<div style="float: left">
							<input type="text" class="input-sm" id="btn2_color"
								name="btn2_color" style="width: 85px" />
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- float 중단 -->

				</form>

				<form id="headerFrm">

					<div class="fieldRow">
						<div style="width: 155px; float: left; margin-left: 145px">Kftc-Bfop-UserSeqNo:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserSeqNo"
								name="Kftc-Bfop-UserSeqNo" style="width: 130px" />
						</div>
						<div style="width: 135px; float: left; margin-left: 25px">Kftc-Bfop-UserCI:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserCI"
								name="Kftc-Bfop-UserCI" style="width: 392px" />
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- float 중단 -->

					<div class="fieldRow">
						<div style="width: 155px; float: left; margin-left: 145px">Kftc-Bfop-UserName:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserName"
								name="Kftc-Bfop-UserName" style="width: 130px" />
						</div>
						<div style="width: 135px; float: left; margin-left: 25px">Kftc-Bfop-UserInfo:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserInfo"
								name="Kftc-Bfop-UserInfo" style="width: 100px" />
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- float 중단 -->

					<div class="fieldRow">
						<div style="width: 155px; float: left; margin-left: 145px">Kftc-Bfop-UserCellNo:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserCellNo"
								name="Kftc-Bfop-UserCellNo" style="width: 130px" />
						</div>
						<div style="width: 135px; float: left; margin-left: 25px">Kftc-Bfop-UserEmail:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-UserEmail"
								name="Kftc-Bfop-UserEmail" style="width: 180px" />
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- float 중단 -->

					<div class="fieldRow">
						<div style="width: 155px; float: left; margin-left: 145px">Kftc-Bfop-AccessToken:</div>
						<div style="float: left; margin-left: 10px">
							<input type="text" class="input-sm" id="Kftc-Bfop-AccessToken"
								name="Kftc-Bfop-AccessToken" style="width: 330px" />
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- float 중단 -->

				</form>

				<div class="fieldRow">
					<div>Authorization Code:</div>
					<div>
						<input type="text" class="input-sm" id="code" name="code"></input>
						<!-- <button type="button" id="shyAuthCode" class="btn btn-sm btn-primary">사용자인증</button> (authorize2) -->
					</div>
				</div>

				<div class="fieldRow">
					<div>사용자일련번호</div>
					<div>
						<input type="text" class="input-sm" id="user_seq_no"
							name="user_seq_no" style="width: 110px"></input>
					</div>
				</div>

				<div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token" name="token"></input>
						<button type="button" id="btnToken" class="btn btn-sm btn-primary">토큰발급</button>
					</div>
				</div>

				<div class="fieldRow">
					<div>Refresh Token:</div>
					<div>
						<input type="text" class="input-sm" id="refresh_token"
							name="refresh_token"></input>
						<button type="button" id="btnTokenByRT"
							class="btn btn-sm btn-primary" title="Refresh Token 을 사용한다.">토큰갱신</button>
						(Refresh Token 필요)
					</div>
				</div>

				<div class="fieldRow"
					style="display: table; width: 100%; height: 100%">
					<div style="display: table-cell; vertical-align: middle">조회
						결과</div>
					<div style="width: 100%; height: 100%">
						<button type="button" id="btnUserMe"
							class="btn btn-sm btn-primary" style="margin-left: 4px">사용자정보조회</button>
						<button type="button" id="btnAccountList"
							class="btn btn-sm btn-primary">등록계좌조회</button>
						<button type="button" id="btnResultClear"
							class="btn btn-sm btn-primary"
							style="float: right; margin-bottom: 5px; margin-left: 5px">clear</button>
						<button type="button" id="btnResultCopy"
							class="btn btn-sm btn-primary"
							style="float: right; margin-bottom: 5px">copy</button>
						<textarea id="resultTextArea" class="form-control"
							style="display: table-cell; width: 100%; height: 100%; margin-left: 3px"></textarea>
					</div>
				</div>

			</div>
			<!-- // panel-body -->

		</div>
		<!-- // panel panel-primary -->


	</div>

	<div id="dd__container" style="margin-top: 50px;">



		<div id="dd__outer">

			<div id="dd__inner" align="CENTER">
				<img
					src="<%=request.getContextPath()%>/resources/images/ddung/ACCOUNT.png" />

				<div style="margin-left: 21%;">
					<button type="button" id="btnAuthCode" class="dd_button dd_button5">본인인증/계좌등록</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" id="btnAuthCode2"
						class="dd_button dd_button5">계좌등록확인</button>
				</div>



			</div>
		</div>
	</div>

</body>
</html>