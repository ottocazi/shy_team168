package com.team168.shy.service;

import java.util.HashMap;

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



}
