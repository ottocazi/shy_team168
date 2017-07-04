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
	
	// 댓글 카운트 리스트
	public List<HashMap<String, Object>> getCommentCount() {
		List<HashMap<String, Object>> returnCountList = sqlsession.selectList("juno.getCommentCount");
		return returnCountList;
	}
	
	// 댓글 리스트 불러오기
	public List<HashMap<String, Object>> getCommentList() {
		List<HashMap<String, Object>> CommentList = sqlsession.selectList("juno.getCommentList");
		return CommentList;
	}
	
	// 배열 파라미터 리스트
	public List<HashMap<String, Object>> getCommentCountArr(String[] snsnoArr) {
		List<HashMap<String, Object>> CommentList = sqlsession.selectList("juno.getCommentCountArr" , snsnoArr);
		return CommentList;
	}

	public List<HashMap<String, String>> peoplesearch() {
		List<HashMap<String, String>> plist = sqlsession.selectList("juno.peoplesearch");
		
		return plist;
	}
	
	// gofollow
	public int goFollow(HashMap<String, Object> map) {
		int result = sqlsession.insert("juno.goFollow", map);
		return result;
	}
	
	// unfollow
	public int unFollow(HashMap<String, Object> map) {
		int result = sqlsession.update("juno.unFollow", map);
		return result;
	}
	
	// 임시 메인라인
	public List<HashMap<String, String>> getmainshy(List<String> followlist) {
		List<HashMap<String, String>> shies = sqlsession.selectList("juno.shiesj", followlist);
		return shies;
	}

	// 임시 메인라인
	public List<String> followlist(int idx) {
		List<String> followlist = sqlsession.selectList("juno.followlistj", idx);
		return followlist;
	}

	// 임시 메인라인
	public String imgaddr(String snsno) {
		String imgaddr = sqlsession.selectOne("juno.imgaddrj", snsno);
		return imgaddr;
	}
	
	// 댓글 수정
	public int goCommentEdit(HashMap<String, String> map) {
		int n = sqlsession.update("juno.goCommentEdit", map);
		return n;
	}
	
	// 댓글 삭제
	public int goCommentDelete(HashMap<String, String> map) {
		int n = sqlsession.update("juno.goCommentDelete", map);
		return n;
	}
	
	// 댓글 신고
	public int goBlameEnd(HashMap<String, Object> map) {
		int n = sqlsession.insert("juno.goBlameEnd", map);
		return n;
	}
}
