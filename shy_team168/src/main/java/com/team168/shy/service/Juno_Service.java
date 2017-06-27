package com.team168.shy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.team168.shy.model.JunoDAO;
import com.team168.shy.model.ShyMemberVO;

@Service
public class Juno_Service {
	
	//	=====  의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private JunoDAO dao;
	
	// 1. 멤버 idx 로 vo 정보 얻어오기
	public ShyMemberVO getMemberVO(int idx) {
		ShyMemberVO getMemberVO = dao.getMemberVO(idx);
		return getMemberVO;
	}
	
	// 2. 멤버 정보 수정하기
	public int myInfoEditEnd(HashMap<String, String> map) {
		int n = dao.myInfoEditEnd(map);
		return n;
	}
	
	// 댓글 수 카운트
	public List<HashMap<String, Object>> getCommentCount() {
		List<HashMap<String, Object>> returnCountList = dao.getCommentCount();
		return returnCountList;
	}
	
	// 댓글 리스트 불러오기
	public List<HashMap<String, Object>> getCommentList() {
		List<HashMap<String, Object>> CommentList = dao.getCommentList();
		return CommentList;
	}
	
	// 배열 파라미터
	public List<HashMap<String, Object>> getCommentCountArr(String[] snsnoArr) {
		List<HashMap<String, Object>> CommentList = dao.getCommentCountArr(snsnoArr);
		return CommentList;
	}

	
}
