package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
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
	
	

	// 페이징 처리2
		public int mTotalCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("min.mTotalCount", map);
			return count;
		}
	
	//				===== 페이징 처리 =====			
		public int gTotalCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("min.gTotalCount", map);
			return count;
		}
		
		

		
		//    ============    검색하기
		

		public List<HashMap<String, String>> peoplesearch(HashMap<String, String> map, RowBounds rowBounds) {
			
			List<HashMap<String, String>> plist = sqlsession.selectList("min.peoplesearch", map , rowBounds);
			
			return plist;
		}
		
		
		public List<HashMap<String, String>> groupsearch(HashMap<String, String> map, RowBounds rowBounds1) {
			List<HashMap<String, String>> glist = sqlsession.selectList("min.groupsearch", map, rowBounds1 );
			return glist;
		}






		// *** 사용자 정보 가져오기 ***
	public ShyMemberVO getMemberVO(int idx) {
		ShyMemberVO getMemberVO = sqlsession.selectOne("min.getMemberVO", idx);
		return getMemberVO;
	}



	// 내 정보수정
		public int applybusiEnd(HashMap<String, String> map) {
			int n = sqlsession.insert("min.applybusiEnd", map);
			return n;
		}






		public HashMap<String, String> getgeoinfo(String geoidx) {
			
			HashMap<String, String> geomap = sqlsession.selectOne("min.getgeoinfo", geoidx);
			return geomap;
		}






		public List<HashMap<String, String>> getgeolist(HashMap<String, String> geomap) {
			
			List<HashMap<String, String>> geolist = sqlsession.selectList("min.getgeolist", geomap);
			return geolist;
		}





		// ===== 이미지 가져오기 =====
		public String getImgaddr(String snsno) {
			String imgfile = sqlsession.selectOne("pa.myshyImg",snsno);
			return imgfile;
		}





		// ===== (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기 ===== //
		public List<HashMap<String, String>> getMyshy(HashMap<String, Object> mymap) {
			List<HashMap<String, String>> myshyList = sqlsession.selectList("pa.getmyshyList",mymap);
			return myshyList;
		}



		// ===== 내 팔로우 수 가져오기 ===== //
		public int getMyflwcnt(String myIdx) {
			int fk_idxflwedcnt = sqlsession.selectOne("pa.getflwCnt", myIdx);
			return fk_idxflwedcnt;
		}




		// =====  나의 샤이 개수 가져오기 , 내 정보 개수 가져오기 ===== //
		public int getMyshyCount(String myIdx) {
			int myshyCount = sqlsession.selectOne("pa.getmyshyCount",myIdx);
			return myshyCount;
		}
		////
		
		
		

		public String getGain(String myIdx) {
			
			String getgain = sqlsession.selectOne("min.getgain", myIdx);
			return getgain;
		}






		public List<HashMap<String, String>> nearMap(HashMap<String, String> geomap) {
			List <HashMap<String, String>>  selectNearMap = sqlsession.selectList("min.selectNearMap", geomap);
			return selectNearMap;
		}





		

    
    
}














