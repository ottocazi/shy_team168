package com.team168.shy.service;

import java.util.HashMap; 
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.Min_DAO;


@Service
public class Min_Service {

		@Autowired
		private Min_DAO dao;

		
		
		
		// ===== #149. Ajax 로 검색어 입력시 자동글 완성하기 4 =====	
		/*@Override
		public List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map) {
			
			if(!map.get("search").trim().isEmpty()) {
				List<HashMap<String, String>> list = dao.searchWordCompleteList(map);
				return list;
			}
			else {
				return null;
			}
			
		}*/

		
	
		
		
	
		// ===== #112. 총 게시물 건수 구하기
		//             총 게시물 건수는 검색조건이 없을때와 있을때로 나뉘어진다. ===== 
		public int gTotalCount(HashMap<String, String> map) {
			int count = dao.gTotalCount(map);
			return count;
		}

		public int mTotalCount(HashMap<String, String> map) {
			int count = dao.mTotalCount(map);
			return count;
		}
		
		
		
		
		
		
		
		


		public List<HashMap<String, String>> peoplesearch(String search) {
			
			List<HashMap <String, String>> plist = dao.peoplesearch(search );
			return plist;
		}
		
		
		public List<HashMap<String, String>> groupsearch(String search) {
			
			List<HashMap <String, String>> glist = dao.groupsearch(search );
			return glist;
		}






	
}
