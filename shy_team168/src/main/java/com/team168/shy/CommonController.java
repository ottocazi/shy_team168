package com.team168.shy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team168.shy.service.CommonService;

@Controller
@Component
public class CommonController {

	@Autowired
	private CommonService service;
	
	@RequestMapping(value="/open.shy", method={RequestMethod.GET})
    public String test(HttpServletRequest req) {
    	
    	return "open.notiles";
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
	
	@RequestMapping(value="/error404", method={RequestMethod.GET})
    public String error404(HttpServletResponse res) {
    	
		res.setStatus(HttpServletResponse.SC_OK);
		
    	return "404.notiles";
    	
    }
	
	
}
