package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
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
	
/*	// 로그아웃한 회원 로그기록 인서트해주는 메소드
	public void logoutinsert(HashMap<String, Object> map) {
		sqlsession.insert("mangu.logoutinsert", map);
		
	}*/
	
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
	public String gettodaytotal(HashMap<String, Object> map) {
		String todaytotal = sqlsession.selectOne("mangu.gettodaytotal", map);
		return todaytotal;
	}
	
	// 관리자페이지 오늘 회원 게시물 수 보여주는 메소드
	public String gettodaytotalshymemo(HashMap<String, Object> map) {
		String todaytotalshymemo = sqlsession.selectOne("mangu.gettodaytotalshymemo", map);
		return todaytotalshymemo;
	}
	
	// 관리자페이지 오늘 그룹 게시물 수 보여주는 메소드
	public String gettodaytotalgrpboard(HashMap<String, Object> map) {
		String todaytotalgrpboard = sqlsession.selectOne("mangu.gettodaytotalgrpboard", map);
		return todaytotalgrpboard;
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
/*
	public List<HashMap<String, Object>> gettongkeList() {
		List<HashMap<String, Object>> tkList = sqlsession.selectList("mangu.gettongkeList");
		return tkList;
	}*/
/*
	public List<HashMap<String, Object>> gettongkeList2() {
		List<HashMap<String, Object>> tkList2 = sqlsession.selectList("mangu.gettongkeList2");
		return tkList2;
	}
*/
	public List<HashMap<String, String>> plist() {
		List<HashMap<String, String>> plist = sqlsession.selectList("mangu.plist");
		return plist;
	}

	public List<HashMap<String, Object>> getFollowListArr(HashMap<String, Object> map) {
		List<HashMap<String, Object>> FollowList = sqlsession.selectList("mangu.getFollowListArr" , map);
		return FollowList;
	}

	public List<HashMap<String, Object>> gettongkeList(HashMap<String, String> map) {
		List<HashMap<String, Object>> tkList = sqlsession.selectList("mangu.gettongkeList" , map);
		return tkList;
	}

	public List<HashMap<String, Object>> gettongkeList2(HashMap<String, String> map) {
		List<HashMap<String, Object>> tkList2 = sqlsession.selectList("mangu.gettongkeList2" , map);
		return tkList2;
	}

	public List<HashMap<String, String>> getadminList(HashMap<String, String> map) {
		List<HashMap<String, String>> adminList = sqlsession.selectList("mangu.getadminList", map);
		return adminList;
	}

	public List<HashMap<String, Object>> gettongkeList3(HashMap<String, String> map) {
		List<HashMap<String, Object>> tkList3 = sqlsession.selectList("mangu.gettongkeList3" , map);
		return tkList3;
	}

	public List<HashMap<String, Object>> gettongkeList4(HashMap<String, String> map) {
		List<HashMap<String, Object>> tkList4 = sqlsession.selectList("mangu.gettongkeList4" , map);
		return tkList4;
	}

	public int CheckEmail(String joinemail) {
		int n = sqlsession.selectOne("mangu.CheckEmail", joinemail);
		return n;
	}

	public List<String> followlist(int idx) {
		List<String> followlist = sqlsession.selectList("mangu.followlist", idx);
		return followlist;
	}

	public List<HashMap<String, String>> getmainshy(List<String> followlist) {
		List<HashMap<String, String>> shies = sqlsession.selectList("mangu.shies", followlist);
		return shies;
	}

	public String imgaddr(String snsno) {
		String imgaddr = sqlsession.selectOne("mangu.imgaddr", snsno);
		return imgaddr;
	}

	public int AddShare(HashMap<String, Object> map) {
		int n = sqlsession.insert("mangu.AddShare", map);
		return n;
	}

	public List<HashMap<String, Object>> getBarTKList(HashMap<String, String> map) {
		List<HashMap<String, Object>> bartkList = sqlsession.selectList("mangu.getBarTKList" , map);
		return bartkList;
	}

	public List<HashMap<String, Object>> getBarTKList2(HashMap<String, String> map) {
		List<HashMap<String, Object>> bartkList2 = sqlsession.selectList("mangu.getBarTKList2" , map);
		return bartkList2;
	}

	public List<HashMap<String, Object>> getshymemoList() {
		List<HashMap<String, Object>> memoList = sqlsession.selectList("mangu.getshymemoList");
		return memoList;
	}

	public int memostatusDown(HashMap<String, String> map) {
		int n = sqlsession.update("mangu.memostatusDown", map);
		return n;
	}

	public int memostatusUp(HashMap<String, String> map) {
		int n = sqlsession.update("mangu.memostatusUp", map);
		return n;
	}

	public List<HashMap<String, Object>> getpietkList() {
		List<HashMap<String, Object>> pietkList = sqlsession.selectList("mangu.getpietkList");
		return pietkList;
	}

	public List<HashMap<String, Object>> getdoughnutList() {
		List<HashMap<String, Object>> doughnutList = sqlsession.selectList("mangu.getdoughnutList");
		return doughnutList;
	}

	public int getTotalAdminCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("mangu.getTotalAdminCount", map);
		return count;
	}



}
