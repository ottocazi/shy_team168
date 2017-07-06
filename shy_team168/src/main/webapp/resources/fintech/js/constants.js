
/**
 * 호출할 서버환경 구분
 */
var svrOpts = {
	test: {
		name: 'shy : 테스트서버',
		bs_style: 'primary',
		base_web_uri: 'https://twww.open-platform.or.kr',
		base_api_uri: 'https://testapi.open-platform.or.kr',
		redirect_uri: 'http://localhost:8880/shy_FinTech_server/html/callback.html',
		client_id: 'l7xx44e66d20db084a0d85446ca30beaff9b',
		client_secret: '0f1cbba16a2840849ac0b381288dba29',
		client_info: 'shy : 핀테크 테스트용 서버 / DB '
	}
};

/**
 * 설정한 서버환경이 없을 경우 기본값
 */
var defaultEnv = 'test';

/**
 * API별 폼 데이터 기본값 설정
 */
var apis = {

	authorize: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				scope: 'login'
			})
		}
	},

	register_account: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				scope: 'inquiry'
			})
		}
	},
	
	authorize2: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				scope: 'login transfer', bg_color: '#fafafa', txt_color: '#000000', btn1_color: '#d9d9db', btn2_color: '#d9d9db', auth_type: '0'
			})
		}
	},
	
	authorize_account: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				scope: 'inquiry'
			})
		}
	},	
	
	authorize_account2: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				scope: 'login transfer', bg_color: '#fafafa', txt_color: '#000000', btn1_color: '#d9d9db', btn2_color: '#d9d9db', auth_type: '0'
			})
		}
	},	
	
	balance: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	},

	transaction_list: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				page_index: '1'
			})
		}
	},

	update_info: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
			
			})
		}
	},

	cancel: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
			
			})
		}
	},
	
	real_name: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	},
	
	deposit: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				wd_pass_phrase: '1111', wd_print_content: '출금인자 01'
			})
		}
	},

	deposit2: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				wd_pass_phrase: '1111', wd_print_content: '출금인자 01'
			})
		}
	},
	
	withdraw: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	},
	
	recheck: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	},
	
	result: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	},
	
	status: {
		defFrmVal: {
			test: $.extend(true, {}, svrOpts.test, {
				
			})
		}
	}
		
}


/**
 * Gateway 오류코드
 */
var gwRspCode = {
	O0001: { rsn: 'Request Parameter 값 오류' },
	O0002: { rsn: '요청한 Token이 유효하지 않을 경우' },
	O0003: { rsn: 'Token 사용기간이 만료되었을 경우' },
	O0004: { rsn: '신청하지 않은 API를 호출한 경우' },
	O0005: { rsn: 'API서비스가 없을 경우<br/>(해당 Token을 발급받은 ClientID(앱키)를 갖는 이용기관이 호출API 사용 계약을 맺었는지 확인 요망 )' },
	O0006: { rsn: '등록이 안된 IP로 입.출금 API 호출시' },
	O0007: { rsn: 'API 업무처리 Routing 실패시' },
	O0008: { rsn: '계약한 AccountPlan 사용량을 초과한 경우' },
	O0009: { rsn: '계약한 API 사용량을 초과한 경우' },
	O0010: { rsn: 'HTTP Method 제어' },
	O0011: { rsn: 'API 허용 scope 체크' },
	O0012: { rsn: '비로그인 계정 정보 관련 token 발급 시도 시' }
}

/**
 * Gateway 세부 오류코드
 * 		- 잘못된 파라미터 입력의 상세 원인이 주를 이룬다.
 */
var gwRspDtlCode = {
	119: { rsn: '(예) Gateway가 제공하지  않는 grant_type 값이 들어왔을 경우 등' },
	992: { rsn: 'http header에 Authorization Bearer  access_token이 없을 경우' },
	103: { rsn: '인증에 필요한 필수 파라미터값이 존재하지 않을 때 or 특정 파라미터값이 중복으로 들어왔을 경우' }, // 3000103
	201: { rsn: 'client_id가 존재하지 않을 때 or secretkey가 맞지 않을 때 or 비활성화되어 사용할 수 없을 경우' }, // xxxx201
	113: { rsn: '유효하지  않은 Authorization Code (만료 or 기사용)' }, // xxxx113
	114: { rsn: '등록한 callback url과 요청한  callback url이 맞지 않을 경우' }, // 3000114
	115: { rsn: 'scope이 맞지 않을때 (기본제공하는  scope명(oob, login, inquiry, transfer)이 맞지 않을 경우)' }, // 3000115
	116: { rsn: 'response_type 유형이 맞지  않을 경우' }, // 3000116
	110: { rsn: '만료된 session 값을 사용하였을 경우' }, // 3002110
	801: { rsn: '파라미터로 받은 사용자와 token에서 획득한 사용자가 불일치할 경우' }, // authorize2, authorize_account2의 case 3 처리를 위해 사용자정의한 코드
	802: { rsn: '기존 token의 scope와 refresh_token으로 재발급 요청하는 token의 scope가 상이함' } // refresh_token 으로 token 재발급 요청시 사용자정의 validation 추가
}

