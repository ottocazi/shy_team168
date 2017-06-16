package com.team168.shy;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.DDung_Service;


@Controller
@Component
public class DDung_Controller {

	@Autowired
	private DDung_Service service;
	
	@RequestMapping(value="/mainline.shy", method={RequestMethod.GET})
    public String goMainTimeline(HttpServletRequest req, HttpSession session) {

		
		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		session.setAttribute("loginuser", smvo);
		
		return "ddung/mainLine.tiles";
    	
    }
	
	@RequestMapping(value="/shynow.shy", method={RequestMethod.POST})
    public String shynow(HttpServletRequest req, HttpSession session) {

		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		int iidx = smvo.getIdx();
		System.out.println("iidx"+iidx);
		
		String idx = req.getParameter("userseq");
		String content = req.getParameter("content");
		String ftag = req.getParameter("ftag");
		
		String ftagstatus = "0";
		if(ftag!=null){
			ftagstatus = "1";
		}
		
		idx = "32";
		
		System.out.println("ftag = "+ftag);
		System.out.println("content = "+content);
		System.out.println("idx= "+idx);
		System.out.println("ftagstatus = "+ftagstatus);
		
		HashMap<String, String> shyform = new HashMap<String, String>();
		
		shyform.put("fk_idx", idx);
		shyform.put("scontent", content);
		shyform.put("stagfollow", ftagstatus);
		
		service.shyup(shyform);
		
		req.setAttribute("loc", "javascript:history.go(-1)");
		return "msg.notiles";
		
    	
    }
}
