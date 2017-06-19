package com.team168.shy;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
//    	System.out.println("n 값은? == " + n);
//    	n 값은? == 1
    	
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
    	
    	HashMap<String, String> map = new HashMap<String, String>();

    	map.put("email", email);
    	map.put("pwd", pwd);

    	int n = service.loginEnd(map);

    	req.setAttribute("n", n);
    	
    	if(n==1) {
    		loginuser = service.getLoginMember(email);
    		session.setAttribute("loginuser", loginuser);
    	}

    	return "loginEnd.notiles";
    }
	
	
	// 로그아웃
    @RequestMapping(value="/logout.shy", method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpSession session) {

    	session.invalidate();
    	
    	return "logout.notiles";
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
