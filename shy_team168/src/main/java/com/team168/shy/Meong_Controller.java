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
    	
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String chkpwd = req.getParameter("chkpwd");

    	HashMap<String, String> map = new HashMap<String, String>();

    	map.put("name", name);
    	map.put("email", email);
    	map.put("pwd", pwd);
    	map.put("chkpwd", chkpwd);
    	
    	int n = 0;
    	
    	n = service.addregistorEnd(map);
    	
		   String msg = "";
		   String loc = "";
		   String type = "";	
		   String title = "";
		   
		   if(n==1) {
			   msg = "로그인페이지로 이동하시겠습니까?";
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
		   
    	return "Meong_msg.notiles";
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
			
			return "Meong_msg.notiles";
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
			
			return "Meong_msg.notiles";
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
    	
    	return "logout.notiles";
    }
	
    
	// 관리자 페이지요청
    @RequestMapping(value="/admin.shy", method={RequestMethod.GET})
    public String admin(HttpServletRequest req, HttpSession session){
    	
    	String totaluser = service.gettotaluser();   // 총 사용자수
    	String mentotal = service.getmentotal();     // 총 남자 사용자수
    	String womantotal = service.getwomantotal(); // 총 여자 사용자수
    	String todaytotal = service.gettodaytotal(); // 오늘방문자 수
    			
    	req.setAttribute("totaluser", totaluser);
    	req.setAttribute("mentotal", mentotal);
    	req.setAttribute("womantotal", womantotal);
    	req.setAttribute("todaytotal", todaytotal);

    	return "admin.notiles";
    }
    
    // 관리자 공지사항(미정) 페이지요청
    @RequestMapping(value="/gesipan.shy", method={RequestMethod.GET})
    public String gesipan(HttpServletRequest req, HttpSession session){

    	String pageNo = req.getParameter("pageNo");
    	
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

    	return "gesipan.notiles";
    }    
		
	// 관리자 페이지 회원관리 페이지 요청
    @RequestMapping(value="/shymember.shy", method={RequestMethod.GET})
    public String shymember(HttpServletRequest req, HttpSession session){
    	    	
    	List<HashMap<String, Object>> shyList = service.getshyList(); 
			 
		req.setAttribute("shyList", shyList);
		
    	return "shymember.notiles";
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
    	
    	Calendar today = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
    	int year = today.get(Calendar.YEAR);
    	int month = (today.get(Calendar.MONTH) + 1);
    	int day = today.get(Calendar.DAY_OF_MONTH);
    	String dateString = String.format("%04d-%02d-%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1, today.get(Calendar.DAY_OF_MONTH));
    	System.out.println(dateString);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	
    	map.put("dateString", dateString);
    	
    	System.out.println(map);
    	
    	List<HashMap<String, Object>> tkList = service.gettongkeList();
    	List<HashMap<String, Object>> tkList2 = service.gettongkeList2();
		
    	req.setAttribute("tkList", tkList);
    	req.setAttribute("tkList2", tkList2);
    	
    	req.setAttribute("year", year);
    	req.setAttribute("month", month);
    	req.setAttribute("day", day);
    	
    	return "tongke.notiles";
    }	
	
    @RequestMapping(value="/searchlistex.shy", method={RequestMethod.GET})
    public String searchlist(HttpServletRequest req, HttpSession session){
    	
    	ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");	
    	int idx =  loginuser.getIdx();

//    	System.out.println("idx 는 ==> " + idx);

    	List<HashMap <String, String>> plist = service.peoplesearch();
    	
    	req.setAttribute("plist", plist);
    	
    	
    	return "meong/searchlist.tiles";
    	
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

	
	
}
