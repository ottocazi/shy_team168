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
	// ===== 4. Ajax 로 검색어 입력시 자동글 완성하기  =====	
	/*public List<HashMap<String, String>> searchWordGrpList(HashMap<String, String> map) {
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
	public List<HashMap<String,String>> gethotGroupList() {
		List<HashMap<String,String>> hotGrpList = dao.hotGrpList();
		return hotGrpList;
	}

	// ===== 그룹 가져오기  =====
	public GroupVO getGroup(String fk_idx) {
		GroupVO gvo = dao.getGroup(fk_idx);
		return gvo;
	}

	// ===== 신규그룹 가져오기  =====
	public List<HashMap<String,String>> getnewGroupList() {
		List<HashMap<String,String>> newGrpList = dao.newGrpList();
		return newGrpList;
	}

	// ===== 내그룹 가져오기  =====
	public List<HashMap<String,String>> getmyGroupList(int fk_idx) {
		List<HashMap<String,String>> myGrpList = dao.myGrpList(fk_idx);
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

	/* ===== 나의 샤이 가져오기 , 내 정보 가져오기(join) =====
	public List<HashMap<String, String>> getMyshys(HashMap<String, Object> mymap) {
		List<HashMap<String, String>> myshyList = dao.getMyshy(mymap);
		return myshyList;
	}*/

	// ===== 이미지 가져오기 =====
	public String getImgaddr(String snsno) {
		String imgfile = dao.getImgaddr(snsno);
		return imgfile;
	}

	// ===== 좋아요 insert ===== //
	public int insertLike(HashMap<String, String> likemap) {
		int n = dao.insertLike(likemap);
		return n;
	}

	// ===== 좋아요 가져오기 ===== //
	public List<HashMap<String, String>> getmyLikeList(HashMap<String, Object> mylike) {
		List<HashMap<String, String>> likeList = dao.getmyLikeList(mylike);
		return likeList;
	}

	// ===== 좋아요 취소하기 ===== //
	public int deletetLike(HashMap<String, String> likemap) {
		int n = dao.deletetLike(likemap);
		return n;
	}

	// ===== (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기 ===== //
	public List<HashMap<String, String>> getMyshy(HashMap<String, Object> mymap) {
		List<HashMap<String, String>> myshyList = dao.getMyshy(mymap);
		return myshyList;
	}
	
	////
	// ===== (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기 ===== //
	public int getMyshyCount(String myIdx) {
		int myshyCount = dao.getMyshyCount(myIdx);
		return myshyCount;
	}
	////
	
	 // ===== 내 팔로우 가져오기  ===== //
	 public List<HashMap<String, String>> getMyfollows(String myIdx) {
	    List<HashMap<String, String>> myflwList = dao.getMyfollows(myIdx);
	    return myflwList;
	 }

	 // ===== 내 팔로우 수 가져오기  ===== //
	 public int getMyflwcnt(String myIdx) {
	    int fk_idxflwedcnt = dao.getMyflwcnt(myIdx);
	    return fk_idxflwedcnt;
	 }

	// ===== 좋아요 likeno 가져오기  ===== //
	public String getLikeno(HashMap<String, String> likemap) {
		String likeno = dao.getLikeno(likemap);
		return likeno;
	}

	// ===== 좋아요했을시, 알람 insert  ===== //
	public void insertAlarm(HashMap<String, String> likemap) {
		dao.insertAlarm(likemap);
		
	}

	// ===== 알림 가져오기 ===== //
	public List<HashMap<String, String>> getAlarmList(String myIdx) {
		List<HashMap<String, String>> myalarmList = dao.getAlarmList(myIdx);
		return myalarmList;
	}

	// ===== 알림타켓 가져오기 ===== //
	public String alarmTarget(String likeseq) {
		String alarm_target = dao.alarmTarget(likeseq);
		return alarm_target;
	}

	// ===== 알림카운트 가져오기 ===== //
	public int getAlarmCnt(String myIdx) {
		int result = dao.getAlarmCnt(myIdx);
		return result;
	}

	// ===== 알림카운트 업데이트 ===== //
	public int updateAlarm(HashMap<String, Object> resultMap) {
		int n = dao.updateAlarm(resultMap);
		return n;
	}

	// ===== 개인정보 가져오기 ===== //
	public HashMap<String, Object> getMyInfo(String myIdx) {
		HashMap<String, Object> mymap = dao.getMyInfo(myIdx);
		return mymap;
	}

	// ===== 팔로우상태 가져오기 ===== //
	/*public int getFollowing(HashMap<String, Object> pafollow) {
		int n = dao.getFollowing(pafollow);
		return n;
	}*/

}
