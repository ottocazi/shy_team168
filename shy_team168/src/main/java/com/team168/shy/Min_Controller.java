package com.team168.shy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team168.shy.service.DDung_Service;


@Controller
@Component
public class Min_Controller {

	@Autowired
	private DDung_Service serv100;
	
	@RequestMapping(value="/min.shy", method={RequestMethod.GET})
    public String goMypage(HttpServletRequest req) {
    	
		return "smin/busipage.tiles";
    	
    }
	
	
	
	
	
	
}
