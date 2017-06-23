package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

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
	
	// 관리자페이지 여성 총 사용자수 보여주는 메소드
	public String getwomantotal() {
		String womantotal = sqlsession.selectOne("mangu.getwomantotal");
		return womantotal;
	}

	// 관리자페이지 오늘 방문자 수 보여주는 메소드
	public String gettodaytotal() {
		String todaytotal = sqlsession.selectOne("mangu.gettodaytotal");
		return todaytotal;
	}
	
	// 관리자페이지 회원목록 보여주는 메소드
	public List<HashMap<String, String>> getshyList(HashMap<String, String> map) {
		List<HashMap<String, String>> shyList = sqlsession.selectList("mangu.getshyList", map);
		return shyList;
	}
	
	// 관리자페이지 페이징처리를 위해 총회원수 뽑아오는 메소드
	public int getTotalCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("mangu.getTotalCount", map);
		return count;
	}
	
	// 관리자페이지 회원에 대한 게시물 뽑아오는 메소드
	public String getmemocount(String idx) {
		String memocount = sqlsession.selectOne("mangu.getmemocount", idx);
		return memocount;
	}

	public List<HashMap<String, Object>> getshyList() {
		List<HashMap<String, Object>> shtList = sqlsession.selectList("mangu.shyList");
		return shtList;
	}

	public int shystatusDown(HashMap<String, String> map) {
		int n = sqlsession.insert("mangu.shystatusDown", map);
		return n;
	}

	public int shystatusUp(HashMap<String, String> map) {
		int n = sqlsession.insert("mangu.shystatusUp", map);
		return n;
	}

	public List<HashMap<String, Object>> gettongkeList() {
		List<HashMap<String, Object>> tkList = sqlsession.selectList("mangu.gettongkeList");
		return tkList;
	}

    
}
