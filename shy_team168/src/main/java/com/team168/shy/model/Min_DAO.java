package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Repository
public class Min_DAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	// 메인글 남기기 메소드
	public void Mainput(HashMap<String, Object> map) {
		sqlsession.insert("min.Mainput", map);
		
	}
	
	
	
	
	
	
	// ===== #113. 총 게시물 건수 구하기
		//             총 게시물 건수는 검색조건이 없을때와 있을때로 나뉘어진다. ===== 	
		public int getTotalCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("min.getTotalCount", map);
			return count;
		}
		
		
		


		public List<HashMap<String, String>> peoplesearch(String search) {
			List<HashMap<String, String>> list = sqlsession.selectList("min.peoplesearch");
			return list;
		}
		
		
		
		
		
		public List<HashMap<String, String>> groupsearch(String search) {
			List<HashMap<String, String>> list = sqlsession.selectList("min.groupsearch");
			return list;
		}
	
	
	
	
	
		// ===== #150. Ajax 로 검색어 입력시 자동글 완성하기 5 =====	
		/*@Override
		public List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map) {
			List<HashMap<String, String>> list = sqlsession.selectList("board.searchWordCompleteList", map);
			return list;
		}
		*/
		
		
		
		

    
    
}














