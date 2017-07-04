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
    public String myInfoEditEnd(HttpServletRequest req, HttpSession session) throws IOException {
		
	
		
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
	
	
	// 댓글 갯수 세기
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
	
	// 임시 메인라인
	@RequestMapping(value="/mainlinej.shy", method={RequestMethod.GET})
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
	@RequestMapping(value="/goCommentEdit.shy", method={RequestMethod.POST})
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
	@RequestMapping(value="/goCommentDelete.shy", method={RequestMethod.POST})
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
	@RequestMapping(value="/goBlameEnd.shy", method={RequestMethod.GET})
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

}
