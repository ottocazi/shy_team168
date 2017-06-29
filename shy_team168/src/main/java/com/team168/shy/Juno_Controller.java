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
	@RequestMapping(value="/myInfoEdit.shy", method={RequestMethod.GET})
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
	
	@RequestMapping(value="/myInfoEditEnd.shy", method={RequestMethod.POST})
    public String myInfoEditEnd(MultipartHttpServletRequest req, HttpSession session) throws IOException {
		
	
		
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		System.out.println("loginuser의 이름 : " + loginuser.getName());
		
		int idx = loginuser.getIdx();
		
		String str_idx = req.getParameter("idx");
		System.out.println("컨트롤에서 받은 idx : "+ str_idx);
		
		String column_name = req.getParameter("column_name");
		System.out.println("컨트롤에서 받은 column_name : " + column_name);
		
		String edited_content = req.getParameter("edited_content");
		System.out.println("컨트롤에서 받은 edited_content : " + edited_content);
		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("idx", str_idx);
    	map.put("column_name", column_name);
    	map.put("edited_content", edited_content);
    	
		int n = service.myInfoEditEnd(map);
		
		// n(정보수정 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
		// 그리고 변경되어진 정보를 보여주기 위해서 request 영역에 변경한 컬럼이름도 저장시키도록 한다.
		req.setAttribute("n", n);
		idx = Integer.parseInt(str_idx);
		ShyMemberVO getMemberVO = service.getMemberVO(idx);
	       
        req.setAttribute("getMemberVO", getMemberVO);
	       
        

		return "juno/myInfoEdit.tiles";
    	
    }
	

	@RequestMapping(value="/getCommentCount.shy", method={RequestMethod.GET})
	@ResponseBody
	public List<HashMap<String, Object>> getCommentCount(HttpServletRequest req) {

		System.out.println("댓글 개수 확인시작");
		String[] snsnoArr = req.getParameterValues("snsnoArr");
		System.out.println("길이" + snsnoArr.length);

		List<HashMap<String, Object>> returnCountList = service.getCommentCountArr(snsnoArr);
		System.out.println("사이즈"+returnCountList.size());
		
		return returnCountList;
	}
	
	@RequestMapping(value="/getCommentList.shy", method={RequestMethod.GET})
	@ResponseBody
	public List<HashMap<String, Object>> getCommentList(HttpServletRequest req) {
		
		List<HashMap<String, Object>> CommentList = service.getCommentList();
		
		
		return CommentList;
	}
	
	 // 관리자 공지사항 페이지요청
    @RequestMapping(value="/searchlistj.shy", method={RequestMethod.GET})
    public String searchlist(HttpServletRequest req, HttpSession session){
	    

    	List<HashMap <String, String>> plist = service.peoplesearch();        
		        
    	req.setAttribute("plist", plist);        
		        
		    	
    	return "juno/searchlist.tiles";
		    	
    }
    
	@RequestMapping(value="/goFollow.shy", method={RequestMethod.GET})
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
	
	@RequestMapping(value="/unFollow.shy", method={RequestMethod.GET})
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
	
	

}
