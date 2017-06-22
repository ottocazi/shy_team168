package com.team168.shy.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team168.shy.model.GroupVO;
import com.team168.shy.model.PaDAO;
import com.team168.shy.model.ShyMemberVO;

@Service
public class PaService {
	
	//	=====  의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private PaDAO dao;

	/*// ===== 4. Ajax 로 검색어 입력시 자동글 완성하기  =====	
	public List<HashMap<String, String>> searchWordGrpList(HashMap<String, String> map) {
		if(!map.get("grpsearch").trim().isEmpty()) {
			List<HashMap<String, String>> grplist = dao.searchWordGrpList(map);
			return grplist;
		}
		else {
			return null;
		}
	}*/

	// ===== 그룹 만들기  =====	
	public int grpinsert(GroupVO grpvo) {
		int n = dao.grpinsert(grpvo);
		return n;
	}

	// ===== 그룹멤버 insert  =====
	public void gmemberinsert(HashMap<String, Object> map) {
		dao.gmemberinsert(map);
	}
	
	// ===== 인기그룹 가져오기  =====
	public List<GroupVO> gethotGroupList() {
		List<GroupVO> hotGrpList = dao.hotGrpList();
		return hotGrpList;
	}

	// ===== 그룹 가져오기  =====
	public GroupVO getGroup() {
		GroupVO gvo = dao.getGroup();
		return gvo;
	}

	// ===== 신규그룹 가져오기  =====
	public List<GroupVO> getnewGroupList() {
		List<GroupVO> newGrpList = dao.newGrpList();
		return newGrpList;
	}

	// ===== 내그룹 가져오기  =====
	public List<GroupVO> getmyGroupList(int fk_idx) {
		List<GroupVO> myGrpList = dao.myGrpList(fk_idx);
		return myGrpList;
	}

	// ===== 그룹 디테일 페이지 요청하기 ===== //
	public HashMap<String, String> getGroupDetail(int groupno) {
		HashMap<String, String> grpvomap = dao.getGroupDetail(groupno);
		return grpvomap;
	}

	// ===== 그룹멤버 정보 가져오기 ===== //
	public List<HashMap<String, String>> getGroupMember(int groupno) {
		List<HashMap<String, String>> gmemberList = dao.getGroupMember(groupno);
		return gmemberList;
	}

	// ===== 그룹게시판 글쓰기  =====
	public int gboardWrite(HashMap<String, Object> map) {
		int n = dao.gboardWrite(map);
		return n;
	}

	// ===== 그룹글 목록 가져오기  =====
	public List<HashMap<String, String>> getGroupBoard(int groupno) {
		List<HashMap<String, String>> gboardList = dao.getGroupBoard(groupno);
		return gboardList;
	}

	// ===== gpdetailno 가져오기  =====
	public String getGmemberidx(HashMap<String, Object> chckmap) {
		String str_gpdetailno = dao.getGmemberidx(chckmap);
		return str_gpdetailno;
	}

	// ===== 그룹회원수 1증가하기  =====
	public void gmemberUpdate(int fk_groupno) {
		dao.gmemberUpdate(fk_groupno);
	}

	// ===== 그룹회원인지 아닌지 먼저 확인  =====
	public int gmemberCheck(HashMap<String, Object> map) {
		int check = dao.gmemberCheck(map);
		return check;
	}



	
}
