package com.team168.shy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.GroupVO;
import com.team168.shy.model.PaDAO;

@Service
public class PaService {
	
	//	=====  의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private PaDAO dao;

	// ===== 4. Ajax 로 검색어 입력시 자동글 완성하기  =====	
	public List<HashMap<String, String>> searchWordGrpList(HashMap<String, String> map) {
		if(!map.get("grpsearch").trim().isEmpty()) {
			List<HashMap<String, String>> grplist = dao.searchWordGrpList(map);
			return grplist;
		}
		else {
			return null;
		}
	}

	// ===== 그룹 만들기  =====	
	public int grpinsert(GroupVO grpvo) {
		int n = dao.grpinsert(grpvo);
		return n;
	}

	// ===== 인기그룹 가져오기  =====
	public List<GroupVO> gethotGroupList() {
		List<GroupVO> hotGrpList = dao.hotGrpList();
		return hotGrpList;
	}
}
