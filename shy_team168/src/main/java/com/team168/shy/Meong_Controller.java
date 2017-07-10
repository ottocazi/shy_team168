package com.team168.shy;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.Meong_Service;

@Controller
@Component
public class Meong_Controller {
	
	@Autowired
	private Meong_Service service;

	// 회원가입
	@RequestMapping(value="/addregistorEnd.shy", method={RequestMethod.POST})
    public String test(HttpServletRequest req, HttpSession session, ShyMemberVO svo) {
    	
		String joinname = req.getParameter("name");
		String joinemail = req.getParameter("email");
		String joinpwd = req.getParameter("pwd");
		String joinchkpwd = req.getParameter("chkpwd");

    	HashMap<String, String> map = new HashMap<String, String>();

    	map.put("joinname", joinname);
    	map.put("joinemail", joinemail);
    	map.put("joinpwd", joinpwd);
    	map.put("joinchkpwd", joinchkpwd);
    	
    	int n = 0;
    	
    	n = service.addregistorEnd(map);
    	
		   String msg = "";
		   String loc = "";
		   String type = "";	
		   String title = "";   
		   
		   if(n==1) {
			   msg = "다시한번 로그인해주십쇼~";
			   loc = "javascript:history.back();";
			   type = "success";
			   title = "Shy가입을 축하드립니다~~";
			   // or 추가정보입력하시겠습니까?
		   }

		   
/*		   아직 유효성검사 안했으므로
		   else {
			   msg = "회원가입페이지로 이동하시겠습니까?";
			   loc = "";
			   type = "error";
			   title = "회원가입 실패하였습니다!!";
		   }
*/	
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
		   req.setAttribute("type", type);
		   req.setAttribute("title", title);
		   
    	return "ddung_alert.notiles";
    }
	
	// 아이디 중복체크(ajax활용)
	@RequestMapping(value="/CheckEmail.shy", method={RequestMethod.POST})
    @ResponseBody
    public int CheckEmail(HttpServletRequest req) {
    	
		String joinemail = req.getParameter("joinemail");
//		System.out.println("검사할 id값은 "+joinemail);
		req.setAttribute("joinemail", joinemail);
		int n = 0;
		
//		System.out.println("joinemail 은 ==> " + joinemail);	

		n = service.CheckEmail(joinemail);
//		System.out.println("n 은 ==> " + n);
		
    	return n;
    	
    }
	
    // 로그인 완료 요청 
    @RequestMapping(value="/loginEnd.shy", method={RequestMethod.POST})
    public String loginEnd(HttpServletRequest req, ShyMemberVO loginuser, HttpSession session) throws UnknownHostException {
    	
    	String email = req.getParameter("email");
    	String pwd = req.getParameter("pwd");
    	String title = "";
    	String type = "";
    	String msg = "";
    	String loc = "";
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();

    	map.put("email", email);
    	map.put("pwd", pwd);

    	int n = service.loginEnd(map);
    	
    	req.setAttribute("n", n);
    	
    	if(n == 1) {
    		loginuser = service.getLoginMember(email);
    		session.setAttribute("loginuser", loginuser);	
    	}
    	else if(n == 0) {
    		title = "암호가 틀립니다 !!";
    		type = "error";
    		msg = "아이디와 암호를 다시입력하세요~";
    		loc = "javascript:history.back()";
    		
    		req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "ddung_alert.notiles";
    	}
    	else {
    		title = "아이디가 존재하지 않습니다.!!";
    		type = "error";
    		msg = "회원가입부터 하세요~~";
    		loc = "javascript:history.back()";

			req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "ddung_alert.notiles";
    	}
   	
    	InetAddress inetAddress = InetAddress.getLocalHost();

    	String user_ip = inetAddress.getHostAddress();
    	int user_seq = loginuser.getIdx();
    	
    	Date now = new Date();
   	 	String today = String.format("%tF %tT", now, now);

    	map.put("user_ip", user_ip);
    	map.put("user_seq", user_seq);
    	map.put("today", today);
    	
    	service.loginsert(map);
/*    	
    	System.out.println("email ==> " + email);
    	if(email.equalsIgnoreCase("admin")){
        	req.setAttribute("loc", "admin.shy");
        	return "msg.notiles";
    	}
    	*/
    	req.setAttribute("loc", "mainline.shy");
    	return "msg.notiles";
    	
    }
	
	// 로그아웃
    @RequestMapping(value="/logout.shy", method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpSession session, ShyMemberVO loginuser) throws UnknownHostException {
    	/*    	
    	String email = req.getParameter("email");
		loginuser = service.getLoginMember(email);
		session.setAttribute("loginuser", loginuser);
    	*/
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	InetAddress inetAddress = InetAddress.getLocalHost();

    	String user_ip = inetAddress.getHostAddress();
    	int user_seq = loginuser.getIdx();
    	
    	Date now = new Date();
   	 	String today = String.format("%tF %tT", now, now);
    	
   	 	map.put("user_ip", user_ip);
   	 	System.out.println("user_ip 는 "+user_ip);
   	 	map.put("user_seq", user_seq);
   	 	System.out.println("user_seq 는 "+user_seq);
   	 	map.put("today", today);
   	 	System.out.println("today 는 "+today);
   	 	
   	 	service.logoutinsert(map);

    	session.invalidate();
    	
    	return "maeng9/logout.notiles";
    }
	 
	// 관리자 페이지요청
    @RequestMapping(value="/admin.shy", method={RequestMethod.GET})
    public String admin(HttpServletRequest req, HttpSession session){
    	
    	Calendar calendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
    	String today = String.format("%04d-%02d-%02d", calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH));
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("today", today);
    	
    	String totaluser = service.gettotaluser();   // 총 사용자수
    	String mentotal = service.getmentotal();     // 총 남자 사용자수
    	String womantotal = service.getwomantotal(); // 총 여자 사용자수
    	String todaytotal = service.gettodaytotal(map); // 오늘방문자 수
    	String todaytotalshymemo = service.gettodaytotalshymemo(map); // 오늘 회원 게시물 수
    	String todaytotalgrpboard = service.gettodaytotalgrpboard(map); // 오늘 그룹 게시물 수
    			
    	req.setAttribute("totaluser", totaluser);
    	req.setAttribute("mentotal", mentotal);
    	req.setAttribute("womantotal", womantotal);
    	req.setAttribute("todaytotal", todaytotal);
    	req.setAttribute("todaytotalshymemo", todaytotalshymemo);
    	req.setAttribute("todaytotalgrpboard", todaytotalgrpboard);

    	return "maeng9/admin.notiles";
    }
    
    // 관리자 공지사항(미정) 페이지요청
    @RequestMapping(value="/gesipan.shy", method={RequestMethod.GET})
    public String gesipan(HttpServletRequest req, HttpSession session){

    	String pageNo = req.getParameter("pageNo"); // 회원페이징처리
    	
    	int totalCount = 0;
    	int sizePerPage = 5; 
    	int currentShowPageNo = 1;
    	int totalPage = 0; 
    	
    	int start = 0;
    	int end = 0;
    	int startPageNo = 0;

    	int loop = 0;
    	int blocksize = 5;
    	
    	if(pageNo == null) {
    		currentShowPageNo = 1;    		
    	}
    	else {
    		currentShowPageNo = Integer.parseInt(pageNo); 
    	}
   
    	start = ((currentShowPageNo - 1) * sizePerPage) + 1;
    	end = start + sizePerPage - 1;
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	
    	map.put("start", String.valueOf(start) );
    	map.put("end", String.valueOf(end) );
    	
    	List<HashMap<String, String>> shyList = service.getshyList(map); 
   	
			 for(int i=0; i<shyList.size(); i++){
    		
	    		 String idx = shyList.get(i).get("IDX");
	    		 String result = service.memocount(idx);
	    		 
	    		 shyList.get(i).put("MEMOCOUNT", result);
	    		 
			 }
    	
    	totalCount = service.getTotalCount(map);
    	totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	
    	String pagebar = "";
    	pagebar += "<ul>";
    	
        loop = 1;

        startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
    	
        // **** 이전5페이지 만들기 ****
        if(startPageNo == 1) {
        	pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
        }
        else {
        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize);		
        }        
            	
        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
        while( !(loop > blocksize ||
        		 startPageNo > totalPage) ) {
        	if(startPageNo == currentShowPageNo) {
        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
        	}
        	else {
	        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo);
        	}
        	
        	loop++;
        	startPageNo++;
        	
        }// end of while--------------------
                
        // **** 다음5페이지 만들기 ****
        if(startPageNo > totalPage) {
        	pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
        }
        else {
        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize);	
        }
        pagebar += "</ul>";
    	
        req.setAttribute("pagebar", pagebar);
    	req.setAttribute("shyList", shyList);
    	
    //----------------------------------------------------------------------------------------------
    	
    	String pageNo2 = req.getParameter("pageNo2"); // 회원페이징처리
    	
    	int totalCount2 = 0;
    	int sizePerPage2 = 5; 
    	int currentShowPageNo2 = 1;
    	int totalPage2 = 0; 
    	
    	int start2 = 0;
    	int end2 = 0;
    	int startPageNo2 = 0;

    	int loop2 = 0;
    	int blocksize2 = 5;
    	
    	if(pageNo2 == null) {
    		currentShowPageNo2 = 1;    		
    	}
    	else {
    		currentShowPageNo2 = Integer.parseInt(pageNo2); 
    	}
   
    	start2 = ((currentShowPageNo2 - 1) * sizePerPage2) + 1;
    	end2 = start2 + sizePerPage2 - 1;
    	
    	HashMap<String, String> map2 = new HashMap<String, String>();
    	
    	map2.put("start2", String.valueOf(start2) );
    	map2.put("end2", String.valueOf(end2) );
    	
    	List<HashMap<String, String>> adminList = service.getadminList(map); 
   	  	
    	totalCount2 = service.getTotalAdminCount(map);
    	totalPage2 = (int)Math.ceil((double)totalCount2/sizePerPage2);
    	
    	String pagebar2 = "";
    	pagebar2 += "<ul>";
    	
        loop2 = 1;

        startPageNo2 = ((currentShowPageNo2 - 1)/blocksize2)*blocksize2 + 1;
    	
        // **** 이전5페이지 만들기 ****
        if(startPageNo2 == 1) {
        	pagebar2 += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize2);
        }
        else {
        	pagebar2 += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo2=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo2-1, blocksize2);		
        }        
            	
        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
        while( !(loop2 > blocksize2 ||
        		 startPageNo2 > totalPage2) ) {
        	if(startPageNo2 == currentShowPageNo2) {
        		pagebar2 += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo2);	
        	}
        	else {
	        	pagebar2 += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo2=%d'>%d</a>&nbsp;&nbsp;", startPageNo2, startPageNo2);
        	}
        	
        	loop2++;
        	startPageNo2++;
        	
        }// end of while--------------------
                
        // **** 다음5페이지 만들기 ****
        if(startPageNo2 > totalPage2) {
        	pagebar2 += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize2);
        }
        else {
        	pagebar2 += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo2=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo2, blocksize2);	
        }
        pagebar2 += "</ul>";
    	
        req.setAttribute("pagebar2", pagebar2);
    	req.setAttribute("adminList", adminList);
    	
    	return "maeng9/gesipan.notiles";
    }    
		
	// 관리자 페이지 회원관리 페이지 요청
    @RequestMapping(value="/shymember.shy", method={RequestMethod.GET})
    public String shymember(HttpServletRequest req, HttpSession session){
    	    	
    	List<HashMap<String, Object>> shyList = service.getshyList(); 
			 
		req.setAttribute("shyList", shyList);
		
    	return "maeng9/shymember.notiles";
    }
	
    // 관리자 페이지 유저관리 페이지 비활성화버튼요청
    @RequestMapping(value="/shystatusDown.shy", method={RequestMethod.GET})
    public String shyleveldown(HttpServletRequest req, HttpSession session){
    	
    	String idx = req.getParameter("idx");
    	String email = req.getParameter("email");
    	
    	String title = "";
    	String type = "";
    	String msg = "";
    	String loc = "";

    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("idx", idx);
    	
    	int n = service.shystatusDown(map);
    	
    	if(n == 1) {
    		title = email + "님을 비활성화 성공!!";
    		type = "success";
    		loc = "shymember.shy";

    		req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
    	}
    	return "ddung_alert.notiles";
    }
	
    // 관리자 페이지 유저관리 페이지 활성화버튼요청
    @RequestMapping(value="/shystatusUp.shy", method={RequestMethod.GET})
    public String shylevelup(HttpServletRequest req, HttpSession session){
    	
    	String idx = req.getParameter("idx");
    	String email = req.getParameter("email");
    	
    	String title = "";
    	String type = "";
    	String msg = "";
    	String loc = "";
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("idx", idx);
    	
    	int n = service.shystatusUp(map);
    	
    	if(n == 1) {
    		title = email + "님을 활성화 성공!!";
    		type = "success";
    		loc = "shymember.shy";

    		req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
    	}
    	return "ddung_alert.notiles";
    }	
	
    // 관리자 페이지 통계상세 페이지 활성화버튼요청
    @RequestMapping(value="/tongke.shy", method={RequestMethod.GET})
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
    	System.out.println(today);
    	System.out.println(yesterday);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	
    	map.put("today", today);
    	map.put("yesterday", yesterday);
    	map.put("today2", today2);
    	map.put("yesterday2", yesterday2);
    	
    	if(today2 == null && yesterday2 == null){
    		
        	List<HashMap<String, Object>> tkList = service.gettongkeList(map);
        	List<HashMap<String, Object>> tkList2 = service.gettongkeList2(map);
        	
        	req.setAttribute("tkList", tkList);
        	req.setAttribute("tkList2", tkList2);
    				
    	}
    	else{ // 달력으로 날짜조정했을때
    		
        	List<HashMap<String, Object>> tkList = service.gettongkeList3(map);
        	List<HashMap<String, Object>> tkList2 = service.gettongkeList4(map);
        	
        	req.setAttribute("tkList", tkList);
        	req.setAttribute("tkList2", tkList2);
    	}
    	
    	//System.out.println(map);
    	
    	req.setAttribute("year", year);
    	req.setAttribute("month", month);
    	req.setAttribute("day", day);
    	
    	req.setAttribute("today2", today2);
    	req.setAttribute("yesterday2", yesterday2);
    	
    	return "maeng9/tongke.notiles";
    }	

    @RequestMapping(value="/follow.shy", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, Object>> follow(HttpServletRequest req, HttpSession session){
    	
    	ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");	
    	int idx =  loginuser.getIdx();
    	String[] idxArr = req.getParameterValues("idxArr");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("idx", idx);
    	map.put("idxArr", idxArr);
    	
    	List<HashMap<String, Object>> returnFollowList = service.follow(map);
    	
    	System.out.println(returnFollowList);
    	
    	return returnFollowList;
    	
    }
    
    @RequestMapping(value="/gesimulTK.shy", method={RequestMethod.GET})
    public String gesimulTK(HttpServletRequest req, HttpSession session){

    	
    	return "maeng9/gesimulTK.notiles";
    	
    }
    
    @RequestMapping(value="/kongyou.shy", method={RequestMethod.GET})
    public String kongyou(HttpServletRequest req, HttpSession session){

    	
    	return "maeng9/kongyou.notiles";
    	
    }
    
    // 기현이형 메인라인
	@RequestMapping(value="/mmainline.shy", method={RequestMethod.GET})
    public String mmainline(HttpServletRequest req, HttpSession session) {
		
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
//		System.out.println("myIdx = "+ myIdx);
		followlist.add(myIdx);
		
//		System.out.println("followlist의 사이즈 = "+followlist.size());
		
		// 팔로워들 + 나의 샤이 가져오기 , 유저정보 가져오기(join?), 
		List <HashMap<String, String>> shies = service.getmainshy(followlist);
		
		if(shies!=null){
			for(int i =0 ; i<shies.size(); i++){
				
				
				// 가져온 샤이의 메인 정보를 가져 오는 동안 image, 친구태그, 지역태그 유무의 status를 확인하여 그 값을 추가하거나 null값을 부여한다.
				// 페이징 처리 미완성
				if("1".equals(shies.get(i).get("simage"))){
					
					String snsno = shies.get(i).get("snsno");
//					System.out.println("snsno = "+snsno);
					String imagefile = service.imgaddr(snsno);
					
//					System.out.println("해시맵에 담기 직전의 파일명(중요) : ");
					shies.get(i).put("imageaddr", imagefile);
					
				}
				
				else if("0".equals(shies.get(i).get("simage"))){
					shies.get(i).put("imageaddr", null);
				}
				
//				System.out.println("shies.simage : "+shies.get(i).get("simage"));
//				System.out.println("shies에 들어간 imageaddr = " + shies.get(i).get("imageaddr"));
			}
		
		}
		
		
		req.setAttribute("shies", shies);
		
		return "maeng9/mmainLine.tiles";
    	
    }
	
    @RequestMapping(value="/share.shy", method={RequestMethod.POST})
    public String share(HttpServletRequest req, HttpSession session){
    	
    	String fk_idx = req.getParameter("fk_idx");
    	String snsno = req.getParameter("snsno");

    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("fk_idx", fk_idx);
    	map.put("snsno", snsno);
    	
    	int n = 0;
    	
    	n = service.AddShare(map);
    	
    	System.out.println("n값은 == " + n);
    	// n값은 == 1
    	
    	req.setAttribute("loc", "mmainline.shy");
    	
    	return "msg.notiles";
    	
    }
    
    // 게시물 통계 페이지 요청
    @RequestMapping(value="/bartongke.shy", method={RequestMethod.GET})
    public String bartongke(HttpServletRequest req, HttpSession session){
    	
    	String today2 = req.getParameter("today");
    	String yesterday2 = req.getParameter("yesterday");
//    	System.out.println("today2 는 ==> " + today2);
//    	System.out.println("yesterday2 는 ==> " + yesterday2);
    	
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
    	
    	List<HashMap<String, Object>> bartkList = service.getBarTKList(map);
    	req.setAttribute("bartkList", bartkList);
    	List<HashMap<String, Object>> bartkList2 = service.getBarTKList2(map);
    	req.setAttribute("bartkList2", bartkList2);
    	
    	/*if(today2 == null && yesterday2 == null){
    		
        	List<HashMap<String, Object>> bartkList = service.getBarTKList(map);
        	List<HashMap<String, Object>> bartkList2 = service.getBarTKList2(map);
        	
        	req.setAttribute("bartkList", bartkList);
        	req.setAttribute("bartkList2", bartkList2);
    				
    	}
    	else{ // 달력으로 날짜조정했을때
    		
        	List<HashMap<String, Object>> tkList = service.gettongkeList3(map);
        	List<HashMap<String, Object>> tkList2 = service.gettongkeList4(map);
        	
        	req.setAttribute("tkList", tkList);
        	req.setAttribute("tkList2", tkList2);
    	}*/
    	
    	//System.out.println(map);
    	
    	req.setAttribute("year", year);
    	req.setAttribute("month", month);
    	req.setAttribute("day", day);
    	
    	req.setAttribute("today2", today2);
    	req.setAttribute("yesterday2", yesterday2);

    	return "maeng9/bartongke.notiles";
    }	
    
    // 게시물관리 페이지 요청
    @RequestMapping(value="/adminshymemo.shy", method={RequestMethod.GET})
    public String adminshymemo(HttpServletRequest req, HttpSession session){
    	
    	List<HashMap<String, Object>> memoList = service.getshymemoList(); 
		 
		req.setAttribute("memoList", memoList);
    	
    	return "maeng9/adminshymemo.notiles";	
    }
	
    // 관리자 페이지 게시물관리 페이지 비활성화버튼요청
    @RequestMapping(value="/shymemostatusDown.shy", method={RequestMethod.GET})
    public String shymemostatusDown(HttpServletRequest req, HttpSession session){
    	
    	String snsno = req.getParameter("snsno");
    	String name = req.getParameter("name");
    	
    	String title = "";
    	String type = "";
    	String msg = "";
    	String loc = "";

    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("snsno", snsno);
    	
    	int n = service.memostatusDown(map);
    	
    	if(n == 1) {
    		title = name + "님의 "+ snsno +"번 게시물을 비활성화 했습니다.";
    		type = "warning";
    		loc = "adminshymemo.shy";

    		req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
    	}
    	return "ddung_alert.notiles";
    }
	
    // 관리자 페이지 게시물관리 페이지 활성화버튼요청
    @RequestMapping(value="/shymemostatusUp.shy", method={RequestMethod.GET})
    public String shymemostatusUp(HttpServletRequest req, HttpSession session){
    	
    	String snsno = req.getParameter("snsno");
    	String name = req.getParameter("name");
    	
    	String title = "";
    	String type = "";
    	String msg = "";
    	String loc = "";
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("snsno", snsno);
    	
    	int n = service.memostatusUp(map);
    	
    	if(n == 1) {
    		title = name + "님의 "+ snsno +"번 게시물을 활성화 했습니다.";
    		type = "success";
    		loc = "adminshymemo.shy";

    		req.setAttribute("title", title);
			req.setAttribute("type", type);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
    	}
    	return "ddung_alert.notiles";
    }	
    
	
    // 관리자 페이지 게시물관리 페이지 활성화버튼요청
    @RequestMapping(value="/pietongke.shy", method={RequestMethod.GET})
    public String pietongke(HttpServletRequest req, HttpSession session){
    	
    	List<HashMap<String, Object>> pietkList = service.getpietkList();
    	req.setAttribute("pietkList", pietkList);
    	
    	List<HashMap<String, Object>> doughnutList = service.getdoughnutList();
    	req.setAttribute("doughnutList", doughnutList);
    
	
    	
    	return "maeng9/pietongke.notiles";
    }
    
    @RequestMapping(value="/shyinfo.shy", method={RequestMethod.GET})
    public String shyinfo(HttpServletRequest req, HttpSession session){
    	// 회사개요
    	return "maeng9/shyinfo.notiles";
    }	
    
    @RequestMapping(value="/shyinfomember.shy", method={RequestMethod.GET})
    public String shyinfomember(HttpServletRequest req, HttpSession session){
    	// 회사식구
    	return "maeng9/shyinfomember.notiles";
    }
    
    @RequestMapping(value="/general_elements.shy", method={RequestMethod.GET})
    public String general_elements(HttpServletRequest req, HttpSession session){
    	
    	return "maeng9/general_elements.notiles";
    }
    
    @RequestMapping(value="/icons.shy", method={RequestMethod.GET})
    public String icons(HttpServletRequest req, HttpSession session){
    	
    	return "maeng9/icons.notiles";
    }	
    
    @RequestMapping(value="/widgets.shy", method={RequestMethod.GET})
    public String widgets(HttpServletRequest req, HttpSession session){
    	return "maeng9/widgets.notiles";
    }	
    
    @RequestMapping(value="/invoice.shy", method={RequestMethod.GET})
    public String invoice(HttpServletRequest req, HttpSession session){
    	return "maeng9/invoice.notiles";
    }	

}
