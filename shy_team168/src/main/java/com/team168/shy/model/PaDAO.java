package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaDAO {
	
	//	=====  의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	/*// ===== 5. Ajax 로 검색어 입력시 자동글 완성하기  =====	
	public List<HashMap<String, String>> searchWordGrpList(HashMap<String, String> map) {
		List<HashMap<String, String>> grplist = sqlsession.selectList("pa.searchWordgrpList", map);
		return grplist;
	}*/

	// ===== 그룹 만들기  =====
	public int grpinsert(GroupVO grpvo) {
		int n = sqlsession.insert("pa.grpinsert",grpvo);
		return n;
	}

	// ===== 그룹멤버 insert  =====
	public void gmemberinsert(HashMap<String, Object> map) {
		sqlsession.insert("pa.gmemberinsert",map);
	}
	
	// ===== 인기그룹 가져오기  =====
	public List<GroupVO> hotGrpList() {
		List<GroupVO> hotGrpList = sqlsession.selectList("pa.hotGrpList");
		return hotGrpList;
	}

	// ===== 그룹 가져오기  =====
	public GroupVO getGroup() {
		GroupVO gvo = sqlsession.selectOne("pa.selectGvo");
		return gvo;
	}

	// ===== 신규그룹 가져오기  =====
	public List<GroupVO> newGrpList() {
		List<GroupVO> newGrpList = sqlsession.selectList("pa.newGrpList");
		return newGrpList;
	}

	// ===== 내그룹 가져오기  =====
	public List<GroupVO> myGrpList(int fk_idx) {
		List<GroupVO> myGrpList = sqlsession.selectList("pa.myGrpList",fk_idx);
		return myGrpList;
	}

	// ===== 그룹 디테일 페이지 요청하기 ===== //
	public HashMap<String, String> getGroupDetail(int groupno) {
		HashMap<String, String> grpvomap = sqlsession.selectOne("pa.groupDetail",groupno);
		return grpvomap;
	}

	// ===== 그룹멤버 정보 가져오기 ===== //
	public List<HashMap<String, String>> getGroupMember(int groupno) {
		List<HashMap<String, String>> gmemberList = sqlsession.selectList("pa.gmemberList", groupno);
		return gmemberList;
	}

	// ===== 그룹게시판 글쓰기  =====
	public int gboardWrite(HashMap<String, Object> map) {
		int n = sqlsession.insert("pa.gboardWrite",map);
		return n;
	}

	// ===== 그룹글 목록 가져오기  =====
	public List<HashMap<String, String>> getGroupBoard(int groupno) {
		List<HashMap<String, String>> gboardList = sqlsession.selectList("pa.gboardList",groupno);
		return gboardList;
	}

	// ===== gpdetailno 가져오기  =====
	public String getGmemberidx(HashMap<String, Object> chckmap) {
		String str_gpdetailno = sqlsession.selectOne("pa.gmemberidx",chckmap);
		return str_gpdetailno;
	}

	// ===== 그룹회원수 1증가하기  =====
	public void gmemberUpdate(int fk_groupno) {
		sqlsession.update("pa.gmemberUpdate",fk_groupno);
	}

	// ===== 그룹회원인지 아닌지 먼저 확인  =====
	public int gmemberCheck(HashMap<String, Object> map) {
		int check =sqlsession.selectOne("pa.gmemberCheck", map);
		return check;
	}

	// ===== 나의 샤이 가져오기 , 내 정보 가져오기(join) =====
	public List<HashMap<String, String>> getMyshy(String myIdx) {
		List<HashMap<String, String>> myshyList = sqlsession.selectList("pa.myshyList",myIdx);
		return myshyList;
	}

	// ===== 이미지 가져오기 =====
	public String getImgaddr(String snsno) {
		String imgfile = sqlsession.selectOne("pa.myshyImg",snsno);
		return imgfile;
	}


}
