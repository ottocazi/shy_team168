package com.team168.shy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team168.shy.service.WSG_Service;

@Controller
@Component
public class WSG_controller {

	@Autowired
	private WSG_Service service;
	
	@RequestMapping(value="/tutorial.shy", method={RequestMethod.GET})
    public String tutorial(HttpServletRequest req, HttpSession session) {

		return "wsg/tutorial.tiles";
		
//		tiles = top 이랑 header , footer 쓰는 애들
//		notiles == 그런거 없는 애들 
//		/shy_team168/src/main/webapp/WEB-INF/tiles/tiles-layout.xml
	
    }
	
	
}
