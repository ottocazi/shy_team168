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
public class Meong_DAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 회원가입 인서트 해주는 메소드
	public int addregistorEnd(HashMap<String, String> map) {
		int n = sqlsession.insert("mangu.addregistorEnd", map);
		return n;
	}
	
	// 로그인 여부 알아오는 메소드
	public int loginEnd(HashMap<String, Object> map) {
		int n = sqlsession.selectOne("mangu.loginEnd", map);
		return n;
	}
	
	// 로그인한 회원정보 보여주는 메소드
	public ShyMemberVO getLoginMember(String email) {
		ShyMemberVO loginuser = sqlsession.selectOne("mangu.getLoginMember", email);
		return loginuser;
	}
	
	// 로그인한 회원 로그기록 인서트해주는 메소드
	public void loginsert(HashMap<String, Object> map) {
		sqlsession.insert("mangu.loginsert", map);
		
	}
	
	// 로그아웃한 회원 로그기록 인서트해주는 메소드
	public void logoutinsert(HashMap<String, Object> map) {
		sqlsession.insert("mangu.logoutinsert", map);
		
	}
	
	// 관리자페이지 총사용자수 보여주는 메소드
	public String gettotaluser() {
		String totaluser = sqlsession.selectOne("mangu.gettotaluser");
		return totaluser;
	}
	
	// 관리자페이지 남성 총 사용자수 보여주는 메소드
	public String getmentotal() {
		String mentotal = sqlsession.selectOne("mangu.getmentotal");
		return mentotal;
	}

	public String getwomantotal() {
		String womantotal = sqlsession.selectOne("mangu.getwomantotal");
		return womantotal;
	}

	public String gettodaytotal() {
		String todaytotal = sqlsession.selectOne("mangu.gettodaytotal");
		return todaytotal;
	}


    
    
}
