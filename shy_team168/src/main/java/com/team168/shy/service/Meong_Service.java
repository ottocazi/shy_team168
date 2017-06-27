package com.team168.shy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.Meong_DAO;
import com.team168.shy.model.ShyMemberVO;

@Service
public class Meong_Service implements Interface_CommonService  {
	
	@Autowired
	private Meong_DAO dao;

	public int addregistorEnd(HashMap<String, String> map) {
		int n = dao.addregistorEnd(map);
		return n;
	}

	public int loginEnd(HashMap<String, Object> map) {
		int n = dao.loginEnd(map);
		return n;
	}

	public ShyMemberVO getLoginMember(String email) {
		ShyMemberVO loginuser = dao.getLoginMember(email);
		return loginuser;
	}

	public void loginsert(HashMap<String, Object> map) {
		dao.loginsert(map);
		
	}
	
	public void logoutinsert(HashMap<String, Object> map) {
		dao.logoutinsert(map);
		
	}

	public String gettotaluser() {
		String totaluser = dao.gettotaluser();
		return totaluser;
	}

	public String getmentotal() {
		String mentotal = dao.getmentotal();
		return mentotal;
	}

	public String getwomantotal() {
		String womantotal = dao.getwomantotal();
		return womantotal;
	}

	public String gettodaytotal() {
		String todaytotal = dao.gettodaytotal();
		return todaytotal;
	}

	public List<HashMap<String, String>> getshyList(HashMap<String, String> map) {
		List<HashMap<String, String>> shyList = dao.getshyList(map);
		return shyList;	
	}

	public int getTotalCount(HashMap<String, String> map) {
		int count = dao.getTotalCount(map);
		return count;
	}

	public String memocount(String idx) {
		String memocount = dao.getmemocount(idx);
		return memocount;
	}

	public List<HashMap<String, Object>> getshyList() {
		List<HashMap<String, Object>> shyList = dao.getshyList();
		return shyList;
	}

	public int shystatusDown(HashMap<String, String> map) {
		int n = dao.shystatusDown(map);
		return n;
	}

	public int shystatusUp(HashMap<String, String> map) {
		int n = dao.shystatusUp(map);
		return n;
	}

	public List<HashMap<String, Object>> gettongkeList() {
		List<HashMap<String, Object>> tkList = dao.gettongkeList();
		return tkList;
	}

	public List<HashMap<String, Object>> gettongkeList2() {
		List<HashMap<String, Object>> tkList2 = dao.gettongkeList2();
		return tkList2;
	}



}
