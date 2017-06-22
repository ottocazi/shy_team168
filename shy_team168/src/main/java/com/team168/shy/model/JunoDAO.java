package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JunoDAO {
	
	//	=====  의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// *** 사용자 정보 가져오기 ***
	public ShyMemberVO getMemberVO(int idx) {
		ShyMemberVO getMemberVO = sqlsession.selectOne("juno.getMemberVO", idx);
		return getMemberVO;
	}
	
	// 내 정보수정
	public int myInfoEditEnd(HashMap<String, String> map) {
		int n = sqlsession.insert("juno.myInfoEditEnd", map);
		return n;
	}
}
