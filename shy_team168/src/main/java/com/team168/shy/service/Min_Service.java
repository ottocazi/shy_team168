package com.team168.shy.service;

import java.util.HashMap; 
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.Min_DAO;
import com.team168.shy.model.ShyMemberVO;


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
		
		
		
		
		
		
		
		


		public List<HashMap<String, String>> peoplesearch(HashMap<String, String> map, RowBounds rowBounds) {
			
			List<HashMap <String, String>> plist = dao.peoplesearch(map, rowBounds );
			return plist;
		}
		
		
		public List<HashMap<String, String>> groupsearch(HashMap<String, String> map, RowBounds rowBounds1 ) {
			
			List<HashMap <String, String>> glist = dao.groupsearch(map, rowBounds1 );
			return glist;
		}

		// 1. 멤버 idx 로 vo 정보 얻어오기
	public ShyMemberVO getMemberVO(int idx) {
		ShyMemberVO getMemberVO = dao.getMemberVO(idx);
		return getMemberVO;
	}

	
	// 2. 멤버 정보 수정하기
		public int applybusiEnd(HashMap<String, String> map) {
			int n = dao.applybusiEnd(map);
			return n;
		}

		
		
		
		// 사업자 페이지 정보불러오기
		
		public HashMap<String, String> getgeoinfo(String geoidx) {
			
			HashMap<String, String> geomap = dao.getgeoinfo(geoidx);
			return geomap;
		}

		public List<HashMap<String, String>> getgeoList(HashMap<String, String> geomap) {
			List<HashMap<String, String>> geolist = dao.getgeolist(geomap);
			return geolist;
		}


		// ===== (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기 ===== //
		public int getMyshyCount(String myIdx) {
			int myshyCount = dao.getMyshyCount(myIdx);
			return myshyCount;
		}
		////

		// ===== 내 팔로우 수 가져오기  ===== //
	 public int getMyflwcnt(String myIdx) {
	    int fk_idxflwedcnt = dao.getMyflwcnt(myIdx);
	    return fk_idxflwedcnt;
	 }

	 
	// ===== (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기 ===== //
		public List<HashMap<String, String>> getMyshy(HashMap<String, Object> mymap) {
			List<HashMap<String, String>> myshyList = dao.getMyshy(mymap);
			return myshyList;
		}

		// ===== 이미지 가져오기 =====
		public String getImgaddr(String snsno) {
			String imgfile = dao.getImgaddr(snsno);
			return imgfile;
		}

		public String getGain(String myIdx) {
			String getgain = dao.getGain(myIdx);
			return getgain;
		}


		public List<HashMap<String, String>> nearMap(double distance, HashMap<String, String> geomap) {
			List <HashMap<String, String>>  selectNearMap = dao.nearMap(distance, geomap);
			return selectNearMap;
		}

		
		
		
		
		
		



	
}
