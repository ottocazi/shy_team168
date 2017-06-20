package com.team168.shy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team168.shy.model.GroupVO;
import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.PaService;


@Controller
@Component
public class Pa_Controller {

	@Autowired
	private PaService service;
	
	// ===== mypage 페이지 요청하기 (내 shy계정) ===== //
	@RequestMapping(value="/mypage.shy", method={RequestMethod.GET})
    public String goMypage(HttpServletRequest req) {
    	
		return "pa/mypage.tiles";
    	
    }

	// ===== mygroups 페이지 요청하기 ===== //
	@RequestMapping(value="/mygroups.shy", method={RequestMethod.GET})
	public String goMygroups(HttpServletRequest req,HttpServletResponse res) {
		ShyMemberVO loginuser = null;
	    
		HttpSession session = req.getSession();
		loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
    		int fk_idx = loginuser.getIdx();
				
			List<GroupVO> myGrpList = service.getmyGroupList(fk_idx);
		    req.setAttribute("myGrpList", myGrpList);
				
			// 인기그룹 목록 (인기 기준 == 회원 수 많은 그룹)
			List<GroupVO> hotGrpList = service.gethotGroupList();
		    req.setAttribute("hotGrpList", hotGrpList);
		    	
		    // 신규그룹 목록 
		    List<GroupVO> newGrpList = service.getnewGroupList();
		    req.setAttribute("newGrpList", newGrpList);
		    
		}else{
			// 인기그룹 목록 (인기 기준 == 회원 수 많은 그룹)
			List<GroupVO> hotGrpList = service.gethotGroupList();
	    	req.setAttribute("hotGrpList", hotGrpList);
	    	
	    	// 신규그룹 목록 
	    	List<GroupVO> newGrpList = service.getnewGroupList();
	    	req.setAttribute("newGrpList", newGrpList);
		}
		
		return "pa/mygroups.tiles";
	    	
	}
	
	// ===== mygroups_insertFrm 페이지 요청하기 ===== //
	@RequestMapping(value="/mygroups_insertFrm.shy", method={RequestMethod.POST})
	public String goGrpinsertFrm(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
		String msg = "♥ 먼저 로그인 하세요 ♥";
		String loc = "open.shy";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "Meong_msg.notiles";
		
		}else{
			
		return "pa/mygroups_insertFrm.tiles";
		}    	
	}
	
	// =====3.  Ajax 로 검색어 입력시 자동글 완성하기  =====
	//  ==> jackson JSON 라이브러리와 함께 @ResponseBoady 사용하여 JSON 파싱하기 === //
	
    /*   @ResponseBody란?
	      메소드에 @ResponseBody Annotation이 되어 있으면 return 되는 값은 View 단을 통해서 출력되는 것이 아니라 
	     HTTP Response Body에 바로 직접 쓰여지게 된다. 
		
	     그리고 jackson JSON 라이브러리를 사용할때 주의해야할 점은 
	     메소드의 리턴타입은 행이 1개 일경우 HashMap<K,V> 이거나 
	                                    Map<K,V> 이고 
		                    행이 2개 이상일 경우 List<HashMap<K,V>> 이거나
		                                    List<Map<K,V>> 이어야 한다.
		                    행이 2개 이상일 경우  ArrayList<HashMap<K,V>> 이거나
		                                     ArrayList<Map<K,V>> 이면 안된다.!!!
	     
	     이와같이 jackson JSON 라이브러리를 사용할때의 장점은 View 단이 필요없게 되므로 간단하게 작성하는 장점이 있다. 
	*/
    @RequestMapping(value="/wordSearchShow.shy", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, Object>> wordSearchShow(HttpServletRequest req) { 
    	
    	List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>(); 
    	
    	String colname = req.getParameter("colname");
    	String grpsearch = req.getParameter("grpsearch");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("colname", colname);
    	map.put("grpsearch", grpsearch);
    	
    	List<HashMap<String, String>> searchWordgrpList = service.searchWordGrpList(map); 
    	
    	if(searchWordgrpList != null) {
    		for(HashMap<String, String> datamap : searchWordgrpList) {
    			
    			HashMap<String, Object> submap = new HashMap<String, Object>();
    			submap.put("RESULTDATA", datamap.get("SEARCHDATA")); 
    			
    			returnmapList.add(submap);
    		}
    	}
    	
    	return returnmapList;
    }
    
    // ===== 그룹만들기 완료 요청 =====
    @RequestMapping(value="/mygroups_insertEnd.shy", method={RequestMethod.POST})
    public String goMakeGrp(GroupVO grpvo, HttpServletRequest req) {
    	
    	int n = service.grpinsert(grpvo);
    	
    	if(n>0){ 
    		
    		if(grpvo!=null){
    			
    			grpvo = service.getGroup(); // 제일 최근 insert된 tbl_group을 가져온다.
    			
    			int fk_groupno = grpvo.getGroupno(); 
        		System.out.println("fk_groupno="+fk_groupno);
        		
        		String fk_groupidx = grpvo.getFk_idx();
        		
        		HashMap<String, Object> map = new HashMap<String, Object>();
            	map.put("fk_groupno", fk_groupno);
            	map.put("fk_groupidx", fk_groupidx);
            	
            	service.gmemberinsert(map);
    		}
    		req.setAttribute("title", "그룹만들기");
    		req.setAttribute("type", "success");
    		req.setAttribute("msg", "그룹생성!");
    		req.setAttribute("loc", "mygroups.shy");
    	}else{
    		req.setAttribute("title", "그룹만들기");
    		req.setAttribute("type", "error");
    		req.setAttribute("msg", "그룹생성실패!");
    		req.setAttribute("loc", "mygroups_insertFrm.shy");
    	}
    	
    	return "Meong_msg.notiles";
    	
    }
    
    // ===== 그룹 디테일 페이지 요청하기 ===== //
 	@RequestMapping(value="/mygroups_detail.shy", method={RequestMethod.GET})
     public String goGrpDetail(HttpServletRequest req) {
 		
 		String str_groupno = req.getParameter("groupno"); // 해당 그룹번호 가져오기
 		//System.out.println("str_groupno="+str_groupno); // 확인용
 		
 		if(str_groupno!=null){
 			int groupno = Integer.parseInt(str_groupno);
 			HashMap<String, String> grpvomap = service.getGroupDetail(groupno);
 			req.setAttribute("grpvomap", grpvomap);
 			
 			// ===== 그룹 가입멤버 가져오기  =====
 			List<HashMap<String, String>> gmemberList = service.getGroupMember(groupno);
 			req.setAttribute("gmemberList", gmemberList);
 			
 			// ===== 그룹글 목록 가져오기  =====
 			List<HashMap<String, String>> gboardList = service.getGroupBoard(groupno);
 			req.setAttribute("gboardList", gboardList);
 			
 			return "pa/mygroups_detail.tiles";
 			
 		}else{
 			req.setAttribute("title", "그룹보기");
    		req.setAttribute("type", "error");
    		req.setAttribute("msg", "잘못된 접근입니다!");
    		req.setAttribute("loc", "mygroups.shy");
    		
    		return "Meong_msg.notiles";
 		}
     	
     }
 	
 	// ===== 그룹게시판 글쓰기  =====
    @RequestMapping(value="/gboardWrite.shy", method={RequestMethod.POST})
    public String goGboardWrite(HttpServletRequest req) {
    	
    	String str_gpdetailno = req.getParameter("gpdetailno");
    	String str_groupno = req.getParameter("groupno");
    	String uploadfile = req.getParameter("uploadfile");
    	String gcontent = req.getParameter("gcontent");
    	
    	if(str_gpdetailno!=null){
    		int gpdetailno = Integer.parseInt(str_gpdetailno);
    		
    		HashMap<String, Object> map = new HashMap<String, Object>();
        	map.put("gpdetailno", gpdetailno);
        	map.put("uploadfile", uploadfile);
        	map.put("gcontent", gcontent);
        	
    		int n = service.gboardWrite(map);
    		
    		if(n>0){
    			int groupno = Integer.parseInt(str_groupno);
    			
    			req.setAttribute("title", "그룹게시글쓰기");
        		req.setAttribute("type", "success");
        		req.setAttribute("msg", "글쓰기성공!");
        		req.setAttribute("loc", "mygroups_detail.shy?groupno="+groupno);
        		
    		}else{
        		req.setAttribute("title", "그룹게시글쓰기");
        		req.setAttribute("type", "error");
        		req.setAttribute("msg", "글쓰기실패!");
        		req.setAttribute("loc", "javascript.location(0);");
        	}
    	}
    	
    	return "Meong_msg.notiles";
    	
    }
    
}
