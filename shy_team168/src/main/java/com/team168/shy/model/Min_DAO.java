package com.team168.shy.model;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Repository
public class Min_DAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 회원가입 인서트 해주는 메소드

	public int addregistorEnd(HashMap<String, String> map) {
		int n = sqlsession.insert("mangu.addregistorEnd", map);
		return n;
	}
	
	// 로그인 여부 알아오는 메소드
	public int loginEnd(HashMap<String, String> map) {
		int n = sqlsession.selectOne("mangu.loginEnd", map);
		return n;
	}
	
	// 로그인한 회원정보 보여주는 메소드
	public ShyMemberVO getLoginMember(String email) {
		ShyMemberVO loginuser = sqlsession.selectOne("mangu.getLoginMember", email);
		return loginuser;
	}

    
    
}
