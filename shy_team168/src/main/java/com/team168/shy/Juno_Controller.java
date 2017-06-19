package com.team168.shy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team168.common.FileManager;
import com.team168.shy.service.DDung_Service;


@Controller
@Component
public class Juno_Controller {

	@Autowired
	private DDung_Service serv100;
	
//  ===== #130. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) =====
    @Autowired
    private FileManager fileManager;
    
	@RequestMapping(value="/myInfoEdit.shy", method={RequestMethod.GET})
    public String goMypage(HttpServletRequest req) {
    	
		return "juno/myInfoEdit.tiles";
    	
    }
	

}
