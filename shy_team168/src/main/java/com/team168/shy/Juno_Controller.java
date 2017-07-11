package com.team168.shy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team168.common.FileManager;
import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.Juno_Service;


@Controller
@Component
public class Juno_Controller {

	@Autowired
	private Juno_Service service;
	
	//  ===== #130. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) =====
    @Autowired
    private FileManager fileManager;
    
    
    // == 마이페이지 불러오기 == 
	@RequestMapping(value="/myInfoEdit.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String goMypage(HttpServletRequest req) {
    	
		HttpSession session = req.getSession();
	       
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		System.out.println("loginuser의 이름 : " + loginuser.getName());
		
		int idx = loginuser.getIdx();
		/*String str_idx = req.getParameter("idx");
		int idx = Integer.parseInt(str_idx);
		int idx = 33;*/
		System.out.println("int idx : "+idx);
		
		// idx 로 memberVO 얻어오기 
		ShyMemberVO getMemberVO = service.getMemberVO(idx);
	        
        req.setAttribute("getMemberVO", getMemberVO);
	       
        return "juno/myInfoEdit.tiles";

    }
	
	@RequestMapping(value="/myInfoEditEnd.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String myInfoEditEnd(HttpServletRequest req, HttpSession session) throws IOException {
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		int idx = loginuser.getIdx();
		String str_idx = req.getParameter("idx");
		String column_name = req.getParameter("column_name");
		String edited_content = req.getParameter("edited_content");
		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("idx", str_idx);
    	map.put("column_name", column_name);
    	map.put("edited_content", edited_content);
    	
		int n = service.myInfoEditEnd(map);
		req.setAttribute("n", n);
		
		idx = Integer.parseInt(str_idx);
		ShyMemberVO getMemberVO = service.getMemberVO(idx);
	       
        
        if("name".equalsIgnoreCase(column_name)) {
        	loginuser.setName(edited_content);
        	
        }
        
        req.setAttribute("getMemberVO", getMemberVO);
	    
        return "juno/myInfoEdit.tiles";
    }
	
	
	// 댓글 갯수 세기
	@RequestMapping(value="/getCommentCount.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<HashMap<String, Object>> getCommentCount(HttpServletRequest req) {

		System.out.println("댓글 개수 확인시작");
		String[] snsnoArr = req.getParameterValues("snsnoArr");
		System.out.println("길이" + snsnoArr.length);

		List<HashMap<String, Object>> returnCountList = service.getCommentCountArr(snsnoArr);
		System.out.println("사이즈"+returnCountList.size());
		
		return returnCountList;
	}
	
	@RequestMapping(value="/getCommentList.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<HashMap<String, Object>> getCommentList(HttpServletRequest req) {
		
		List<HashMap<String, Object>> CommentList = service.getCommentList();
		
		
		return CommentList;
	}
	
	 // 관리자 공지사항 페이지요청
    @RequestMapping(value="/searchlistj.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String searchlist(HttpServletRequest req, HttpSession session){
	    

    	List<HashMap <String, String>> plist = service.peoplesearch();        
		        
    	req.setAttribute("plist", plist);        
		        
		    	
    	return "juno/searchlist.tiles";
		    	
    }
    
	@RequestMapping(value="/goFollow.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> goFollow(HttpServletRequest req, HttpSession session) {
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");	
    	int idx =  loginuser.getIdx();
    	System.out.println("idx : " + idx);
		
    	String str_fk_idxflwed = req.getParameter("fk_idxflwed");
    	int fk_idxflwed = Integer.parseInt(str_fk_idxflwed);
    	System.out.println("fk_idxflwed : "+fk_idxflwed);
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("idx", idx);
    	map.put("fk_idxflwed", fk_idxflwed);
    	
		int result = service.goFollow(map);
		
		if(result==0){
			
		}
		
		HashMap<String, Object> returnresult = new HashMap<String, Object>();
    	map.put("result", result);
		return returnresult;
	}
	
	@RequestMapping(value="/unFollow.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> unFollow(HttpServletRequest req, HttpSession session) {
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");	
    	int idx =  loginuser.getIdx();
    	System.out.println("idx : " + idx);
		
    	String str_fk_idxflwed = req.getParameter("fk_idxflwed");
    	int fk_idxflwed = Integer.parseInt(str_fk_idxflwed);
    	System.out.println("fk_idxflwed : "+fk_idxflwed);
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("idx", idx);
    	map.put("fk_idxflwed", fk_idxflwed);
    	
		int result = service.unFollow(map);
		
		if(result==0){
			
		}
		HashMap<String, Object> returnresult = new HashMap<String, Object>();
    	map.put("result", result);
		return returnresult;
	}
	
	// 임시 메인라인
	@RequestMapping(value="/mainlinej.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String mainline(HttpServletRequest req, HttpSession session) {

		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		session.setAttribute("loginuser", smvo);
		
		if(smvo==null){
			
			System.out.println("null이오");
			req.setAttribute("type", "question");
			req.setAttribute("msg", "활동이 감지되지 않아 로그아웃되었습니다.  :)");
			req.setAttribute("loc", req.getContextPath()+"/");
			return "ddung_alert.notiles";
			
		}
		
		// 로그인 유저의 팔로우 명단 가져오기 
		List <String> followlist = service.followlist(smvo.getIdx());
		
		
		// 팔로워 명단에 내 계정도 추가해서 내 계정의 글들도 같이 볼수 있도록 하기
		String myIdx = Integer.toString(smvo.getIdx());
		System.out.println("myIdx = "+ myIdx);
		followlist.add(myIdx);
		
		System.out.println("followlist의 사이즈 = "+followlist.size());
		
		// 팔로워들 + 나의 샤이 가져오기 , 유저정보 가져오기(join?), 
		List <HashMap<String, String>> shies = service.getmainshy(followlist);
		
		if(shies!=null){
			for(int i =0 ; i<shies.size(); i++){
				
				
				// 가져온 샤이의 메인 정보를 가져 오는 동안 image, 친구태그, 지역태그 유무의 status를 확인하여 그 값을 추가하거나 null값을 부여한다.
				// 페이징 처리 미완성
				if("1".equals(shies.get(i).get("simage"))){
					
					String snsno = shies.get(i).get("snsno");
					System.out.println("snsno = "+snsno);
					String imagefile = service.imgaddr(snsno);
					
					System.out.println("해시맵에 담기 직전의 파일명(중요) : ");
					shies.get(i).put("imageaddr", imagefile);
					
				}
				
				else if("0".equals(shies.get(i).get("simage"))){
					shies.get(i).put("imageaddr", null);
				}
				
				System.out.println("shies.simage : "+shies.get(i).get("simage"));
				System.out.println("shies에 들어간 imageaddr = " + shies.get(i).get("imageaddr"));
			}
		
		}
		
		req.setAttribute("shies", shies);
		return "juno/mainLine.tiles";
    	
    }
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/goCommentEdit.shy", method={RequestMethod.GET,RequestMethod.POST})
    public int goCommentEdit(HttpServletRequest req, HttpSession session) throws IOException {
		
	
		
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		System.out.println("loginuser의 이름 : " + loginuser.getName());
		
		int idx = loginuser.getIdx();
		
		String snsno = req.getParameter("snsno");
		System.out.println("컨트롤에서 받은 snsno : "+ snsno);
		
		String cmtno = req.getParameter("cmtno");
		System.out.println("컨트롤에서 받은 cmtno : " + cmtno);
		
		String cmtcontent = req.getParameter("cmtcontent");
		System.out.println("컨트롤에서 받은 cmtcontent : " + cmtcontent);
		
		String str_fk_idx = req.getParameter("fk_idx");
		System.out.println("컨트롤에서 받은 fk_idx : "+ str_fk_idx);
		int fk_idx = Integer.parseInt(str_fk_idx);
		
		if(fk_idx != idx){
			System.out.println("다른 사람 글은 삭제못함.");
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("snsno", snsno);
    	map.put("cmtno", cmtno);
    	map.put("cmtcontent", cmtcontent);
    	map.put("fk_idx", str_fk_idx);
    	int n = 0;
    	System.out.println("컨트롤 리턴 전 n 값 : "+n);
		n = service.goCommentEdit(map);
		
		// n(정보수정 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
		// 그리고 변경되어진 정보를 보여주기 위해서 request 영역에 변경한 컬럼이름도 저장시키도록 한다.
		/*req.setAttribute("n", n);*/
		System.out.println("컨트롤 리턴 후 n 값 : "+n);
		return n;
    	
    }
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/goCommentDelete.shy", method={RequestMethod.GET,RequestMethod.POST})
    public int goCommentDelete(HttpServletRequest req, HttpSession session) throws IOException {
		
	
		
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		System.out.println("loginuser의 이름 : " + loginuser.getName());
		
		int idx = loginuser.getIdx();
		
		String snsno = req.getParameter("snsno");
		System.out.println("컨트롤에서 받은 snsno : "+ snsno);
		
		String cmtno = req.getParameter("cmtno");
		System.out.println("컨트롤에서 받은 cmtno : " + cmtno);
		
		String str_fk_idx = req.getParameter("fk_idx");
		System.out.println("컨트롤에서 받은 fk_idx : "+ str_fk_idx);
		int fk_idx = Integer.parseInt(str_fk_idx);
		
		if(fk_idx != idx){
			System.out.println("다른 사람 글은 삭제못함.");
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("snsno", snsno);
    	map.put("cmtno", cmtno);
    	map.put("fk_idx", str_fk_idx);
    	int n = 0;
    	System.out.println("컨트롤 리턴 전 n 값 : "+n);
		n = service.goCommentDelete(map);
		
		// n(정보수정 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
		// 그리고 변경되어진 정보를 보여주기 위해서 request 영역에 변경한 컬럼이름도 저장시키도록 한다.
		/*req.setAttribute("n", n);*/
		System.out.println("컨트롤 리턴 후 n 값 : "+n);
		return n;
    	
    }
	
	// 댓글 신고
	@RequestMapping(value="/goBlameEnd.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> goBlameEnd(HttpServletRequest req, HttpSession session) {
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");	
    	int idx =  loginuser.getIdx();
    	System.out.println("idx : " + idx);
		
    	String str_fk_idx= req.getParameter("fk_idx");
    	int fk_idx = Integer.parseInt(str_fk_idx);
    	System.out.println("fk_idx : "+fk_idx);
    	
    	String snsno = req.getParameter("snsno");
    	String cmtno = req.getParameter("cmtno");
    	String str_result = req.getParameter("result");
    	String value = req.getParameter("value");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("idx", idx);
    	map.put("fk_idx", fk_idx);
    	map.put("snsno", snsno);
    	map.put("cmtno", cmtno);
    	map.put("result", str_result);
    	map.put("value", value);
    	
		int n = service.goBlameEnd(map);
		
		if(n==0){
			
		}
		
		HashMap<String, Object> returnN = new HashMap<String, Object>();
    	map.put("n", n);
		return returnN;
	}
	
	// 임시 관리자 페이지요청
    @RequestMapping(value="/adminj.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String admin(HttpServletRequest req, HttpSession session){
    	
//    	String totaluser = service.gettotaluser();   // 총 사용자수
//    	String mentotal = service.getmentotal();     // 총 남자 사용자수
//    	String womantotal = service.getwomantotal(); // 총 여자 사용자수
//    	String todaytotal = service.gettodaytotal(); // 오늘방문자 수
//    			
//    	req.setAttribute("totaluser", totaluser);
//    	req.setAttribute("mentotal", mentotal);
//    	req.setAttribute("womantotal", womantotal);
//    	req.setAttribute("todaytotal", todaytotal);

    	return "adminj.notiles";
    }
    
    // 임시 관리자 페이지 GeoShy
    @RequestMapping(value="/GeoShy.shy", method={RequestMethod.GET,RequestMethod.POST})
    public String tongke(HttpServletRequest req, HttpSession session){
    	
    	String today2 = req.getParameter("today");
    	String yesterday2 = req.getParameter("yesterday");
    	System.out.println("today2 는 ==> " + today2);
    	System.out.println("yesterday2 는 ==> " + yesterday2);
    	
    	Calendar calendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
    	int year = calendar.get(Calendar.YEAR);
    	int month = (calendar.get(Calendar.MONTH) + 1);
    	int day = calendar.get(Calendar.DAY_OF_MONTH);
    	String today = String.format("%04d-%02d-%02d", calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH));
    	String yesterday = String.format("%04d-%02d-%02d", calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH) - 1);
    	//System.out.println(yesterday);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	
    	map.put("today", today);
    	map.put("yesterday", yesterday);
    	map.put("today2", today2);
    	map.put("yesterday2", yesterday2);
    	
//    	if(today2 == null && yesterday2 == null){
//    		
//        	List<HashMap<String, Object>> tkList = service.gettongkeList(map);
//        	List<HashMap<String, Object>> tkList2 = service.gettongkeList2(map);
//        	
//        	req.setAttribute("tkList", tkList);
//        	req.setAttribute("tkList2", tkList2);
//    				
//    	}
//    	else{ // 달력으로 날짜조정했을때
//    		
//        	List<HashMap<String, Object>> tkList = service.gettongkeList3(map);
//        	List<HashMap<String, Object>> tkList2 = service.gettongkeList4(map);
//        	
//        	req.setAttribute("tkList", tkList);
//        	req.setAttribute("tkList2", tkList2);
//    	}
    	
    	//System.out.println(map);
    	
    	req.setAttribute("year", year);
    	req.setAttribute("month", month);
    	req.setAttribute("day", day);
    	
    	req.setAttribute("today2", today2);
    	req.setAttribute("yesterday2", yesterday2);
    	
    	return "GeoShy.notiles";
    }
    
    @RequestMapping(value="/drawRegionsMap.shy", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> drawRegionsMap(HttpServletRequest req, HttpServletResponse res) {
		System.out.println(" drawRegionsMap 컨트롤 시작 !");
		
		// city, cnt
		HashMap<String, Object> countRegions = service.drawRegionsMap(); // 
		
		System.out.println("리턴값 countRegions : "+countRegions);
		return countRegions;
	}
    
    @RequestMapping(value="/geodetail.shy", method={RequestMethod.POST})
    public String geodetail(HttpServletRequest req, HttpServletResponse res) {
		
    	String selectedRegion = req.getParameter("selectedRegion");
    	String sivalue = req.getParameter("sivalue");
    	
    	System.out.println("selectedRegion : "+selectedRegion);
    	System.out.println("sivalue : "+sivalue);
    	
    	int iselectedRegion =Integer.parseInt(selectedRegion.substring(3));
    	System.out.println("iselectedRegion : "+iselectedRegion);
    	
    	@SuppressWarnings("unused")
		double lat;
    	@SuppressWarnings("unused")
		double lng;
    	@SuppressWarnings("unused")
		int zoom = 0;
    	String city = "";
    	// 참고 사이트 : http://www.mapnall.com/ko/%EC%A7%80%EB%8F%84-%ED%95%9C%EA%B5%AD_1072678.html
    	// 지역 선택 페이지 소스보기
    	switch (iselectedRegion) {
    	// 0.서울
		case 11: lat = 37.583330000000000000; lng = 127.000000000000000000; zoom = 11; city="서울";
			break;
		// 1.부산
		case 26: lat = 35.133330000000000000; lng = 129.050000000000000000; zoom = 11; city="부산";
			break;
		// 2.대구
		case 27: lat = 35.800000000000000000; lng = 128.550000000000000000; zoom = 11; city="대구";
			break;
		// 3.대전
		case 30: lat = 36.333330000000000000; lng = 127.416670000000000000; zoom = 6; city="대전";
			break;
		// 4.광주
		case 29: lat = 35.166670000000000000; lng = 126.916670000000000000; zoom = 11; city="광주";
			break;
		// 5.인천
		case 28: lat = 37.450000000000000000; lng = 126.416110000000000000; zoom = 11; city="인천";
			break;
		// 6.울산
		case 31: lat = 35.566670000000000000; lng = 129.266670000000000000; zoom = 6; city="울산";
			break;
		// 7.충청북도
		case 43: lat = 36.821530000000000000; lng = 127.656850000000000000; zoom = 8; city="충청북도";
			break;
		// 8.충청남도
		case 44: lat = 36.500000000000000000; lng = 127.000000000000000000; zoom = 9; city="충청남도";
			break;
		// 9.강원도
		case 42: lat = 37.750000000000000000; lng = 128.250000000000000000; zoom = 8; city="강원도";
			break;
		// 10.경기도
		case 41: lat = 37.600000000000000000; lng = 127.250000000000000000; zoom = 8; city="경기도";
			break;
		// 11.경상북도
		case 47: lat = 36.333330000000000000; lng = 128.750000000000000000; zoom = 8; city="경상북도";
			break;
		// 12.경상남도
		case 48: lat = 35.250000000000000000; lng = 128.250000000000000000; zoom = 8; city="경상남도";
			break;
		// 13.제주도
		case 49: lat = 33.416670000000000000; lng = 126.500000000000000000; zoom = 10; city="제주도";
			break;
		// 14.전라북도
		case 45: lat = 35.750000000000000000; lng = 127.250000000000000000; zoom = 9; city="전라북도";
			break;
		// 15.전라남도
		case 46: lat = 34.750000000000000000; lng = 127.000000000000000000; zoom = 8; city="전라남도";
			break;

		default: // 0.서울
			lat = 37.583330000000000000; lng = 127.000000000000000000; zoom = 11;
			break;
		}
    	
    	System.out.println("lat : "+lat);
    	System.out.println("lng : "+lng);
    	System.out.println("zoom : "+zoom);
    	
    	List<HashMap<String, String>> GeoSnsnoList = service.getGeoSnsnoList(city);
    	
    	System.out.println("GeoSnsnoList : "+GeoSnsnoList);
    	
    	req.setAttribute("GeoSnsnoList", GeoSnsnoList);
    	
    	req.setAttribute("selectedRegion", selectedRegion);
    	req.setAttribute("sivalue", sivalue);
    	req.setAttribute("lat", lat);
    	req.setAttribute("lng", lng);
    	req.setAttribute("zoom", zoom);
		return "testmap.notiles";
	}
    
    
}
