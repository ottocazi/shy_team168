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

	public List<HashMap<String, String>> peoplesearch() {
		List<HashMap <String, String>> plist = dao.peoplesearch();
		return plist;
	}
	
	// gofollow
	public int goFollow(HashMap<String, Object> map) {
		int result = dao.goFollow(map);
		return result;
	}
	
	// unfollow
	public int unFollow(HashMap<String, Object> map) {
		int result = dao.unFollow(map);
		return result;
	}
	
	// 임시 메인라인
	public List<HashMap<String, String>> getmainshy(List<String> followlist) {
		List<HashMap<String, String>> shies = dao.getmainshy(followlist);
		return shies;
	}

	// 임시 메인라인
	public List<String> followlist(int idx) {
		List<String> followlist = dao.followlist(idx);
		return followlist;
	}

	// 임시 메인라인
	public String imgaddr(String snsno) {
		String imgaddr = dao.imgaddr(snsno);
		return imgaddr;
	}
	
	// 댓글 수정
	public int goCommentEdit(HashMap<String, String> map) {
		int n = dao.goCommentEdit(map);
		return n;
	}
	
	// 댓글 삭제
	public int goCommentDelete(HashMap<String, String> map) {
		int n = dao.goCommentDelete(map);
		return n;
	}
	
	// 댓글 신고 ( result 1~5 / result 6 구분  )
	public int goBlameEnd(HashMap<String, Object> map) {
		int n = dao.goBlameEnd(map);
		return n;
	}
	
	// 위치 태그가 있는 snsno list 뽑아오기
	public List<HashMap<String, String>> getGeoSnsnoList(String city) {
		List<HashMap<String, String>> list = dao.getGeoSnsnoList(city);
		return list;
	}
	
	// 지역별 shy :  cnt 통계 지도
	public HashMap<String, Object> drawRegionsMap() {
		HashMap<String, Object> countRegions = dao.drawRegionsMap();
		return countRegions;
	}

	
}
