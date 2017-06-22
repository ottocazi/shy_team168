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

	// ===== 5. Ajax 로 검색어 입력시 자동글 완성하기  =====	
	public List<HashMap<String, String>> searchWordGrpList(HashMap<String, String> map) {
		List<HashMap<String, String>> grplist = sqlsession.selectList("pa.searchWordgrpList", map);
		return grplist;
	}

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


}