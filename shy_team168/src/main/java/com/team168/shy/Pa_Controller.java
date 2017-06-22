package com.team168.shy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.team168.common.FileManager;
import com.team168.shy.model.GroupVO;
import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.PaService;


@Controller
@Component
public class Pa_Controller {

	@Autowired
	private PaService service;
	
	// ===== mypage 페이지 요청하기 (내 shy계정) ===== //
	@RequestMapping(value="/mypage.shy", method={RequestMethod.GET})
    public String goMypage(HttpServletRequest req) {
		ShyMemberVO loginuser = null;
		
		HttpSession session = req.getSession();
		loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			String msg = "♥ 먼저 로그인 하세요 ♥";
			String loc = "open.shy";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		}else{
			
			return "pa/mypage.tiles";
		}
		return "Meong_msg.notiles";
    }

	// ===== mygroups 페이지 요청하기 ===== //
	@RequestMapping(value="/mygroups.shy", method={RequestMethod.GET})
	public String goMygroups(HttpServletRequest req,HttpServletResponse res) {
		ShyMemberVO loginuser = null;
	    
		HttpSession session = req.getSession();
		loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
    		int fk_idx = loginuser.getIdx();
				
			List<GroupVO> myGrpList = service.getmyGroupList(fk_idx);
		    req.setAttribute("myGrpList", myGrpList);
				
			// 인기그룹 목록 (인기 기준 == 회원 수 많은 그룹)
			List<GroupVO> hotGrpList = service.gethotGroupList();
		    req.setAttribute("hotGrpList", hotGrpList);
		    	
		    // 신규그룹 목록 
		    List<GroupVO> newGrpList = service.getnewGroupList();
		    req.setAttribute("newGrpList", newGrpList);
		    
		}else{
			// 인기그룹 목록 (인기 기준 == 회원 수 많은 그룹)
			List<GroupVO> hotGrpList = service.gethotGroupList();
	    	req.setAttribute("hotGrpList", hotGrpList);
	    	
	    	// 신규그룹 목록 
	    	List<GroupVO> newGrpList = service.getnewGroupList();
	    	req.setAttribute("newGrpList", newGrpList);
		}
		
		return "pa/mygroups.tiles";
	    	
	}
	
	// ===== mygroups_insertFrm 페이지 요청하기 ===== //
	@RequestMapping(value="/mygroups_insertFrm.shy", method={RequestMethod.POST})
	public String goGrpinsertFrm(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
			String msg = "♥ 먼저 로그인 하세요 ♥";
			String loc = "open.shy";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
		}else{
			
			return "pa/mygroups_insertFrm.tiles";
		}
		 
		return "Meong_msg.notiles";
		
	}
	
	/*// =====3.  Ajax 로 검색어 입력시 자동글 완성하기  =====
	//  ==> jackson JSON 라이브러리와 함께 @ResponseBoady 사용하여 JSON 파싱하기 === //
    @RequestMapping(value="/wordSearchShow.shy", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, Object>> wordSearchShow(HttpServletRequest req) { 
    	
    	List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>(); 
    	
    	String colname = req.getParameter("colname");
    	String grpsearch = req.getParameter("grpsearch");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("colname", colname);
    	map.put("grpsearch", grpsearch);
    	
    	List<HashMap<String, String>> searchWordgrpList = service.searchWordGrpList(map); 
    	
    	if(searchWordgrpList != null) {
    		for(HashMap<String, String> datamap : searchWordgrpList) {
    			
    			HashMap<String, Object> submap = new HashMap<String, Object>();
    			submap.put("RESULTDATA", datamap.get("SEARCHDATA")); 
    			
    			returnmapList.add(submap);
    		}
    	}
    	
    	return returnmapList;
    }*/
    
    // ===== 그룹만들기 완료 요청 =====
    @RequestMapping(value="/mygroups_insertEnd.shy", method={RequestMethod.POST})
    public String goMakeGrp(MultipartHttpServletRequest req,HttpSession session) throws IOException {
    	
    	GroupVO grpvo = new GroupVO();
    	
    	String fk_idx = req.getParameter("fk_idx");
    	System.out.println("fk_idx"+fk_idx);
    	String gname = req.getParameter("gname");
    	String description = req.getParameter("description");
    	int status = Integer.parseInt(req.getParameter("status"));
    	MultipartFile imgfile = req.getFile("gimg");
    	System.out.println("gimg="+imgfile);
    	
    	/*HashMap<String, Object> mapGrp = new HashMap<String, Object>();
    	mapGrp.put("fk_idx", fk_idx);
    	mapGrp.put("gname", gname);
    	mapGrp.put("description", description);
    	mapGrp.put("status", status);
    	mapGrp.put("gimg", gimg);*/
    	
    	grpvo.setFk_idx(fk_idx);
    	grpvo.setGname(gname);
    	grpvo.setDescription(description);
    	grpvo.setStatus(status);
    	
    	String newgimg = null;
    	
    	if(imgfile!=null){
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"files";
			//path = "C:/github_shy_team168/shy_team168/shy_team168/src/main/webapp/resources/images/shydb";
			
			path = req.getSession().getServletContext().getRealPath("/resources/images/shydb"); // 저장할 주소
			System.out.println(path);
			
			String Orgfile = imgfile.getOriginalFilename(); // 실제파일명을 얻어옴
			byte[] bytes = imgfile.getBytes();
			
			String newFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			newFilename += System.nanoTime();
			newFilename += Orgfile;
			System.out.println("newFilename = "+ newFilename);
			// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
			File dir = new File(path);
			if(!dir.exists())
				dir.mkdirs();

			String pathname = path + File.separator + newFilename;

			FileOutputStream fos = new FileOutputStream(pathname);
			fos.write(bytes);
			fos.close();
			
			grpvo.setGimg(newFilename);
			
    	}else{
    		grpvo.setGimg(newgimg);
    	}
    	
    	int n = service.grpinsert(grpvo);
    	
    	if(n>0){ 
    		
    		if(grpvo!=null){
    			
    			grpvo = service.getGroup(); // 제일 최근 insert된 tbl_group을 가져온다.
    			
    			int fk_groupno = grpvo.getGroupno(); 
        		System.out.println("fk_groupno="+fk_groupno);
        		
        		String fk_groupidx = grpvo.getFk_idx();
        		
        		HashMap<String, Object> map = new HashMap<String, Object>();
            	map.put("fk_groupno", fk_groupno);
            	map.put("fk_groupidx", fk_groupidx);
            	
            	service.gmemberinsert(map);
    		}
    		req.setAttribute("title", "그룹만들기");
    		req.setAttribute("type", "success");
    		req.setAttribute("msg", "그룹생성!");
    		req.setAttribute("loc", "mygroups.shy");
    	}else{
    		req.setAttribute("title", "그룹만들기");
    		req.setAttribute("type", "error");
    		req.setAttribute("msg", "그룹생성실패!");
    		req.setAttribute("loc", "mygroups_insertFrm.shy");
    	}
    	
    	return "Meong_msg.notiles";
    	
    }
    
    // ===== 그룹 디테일 페이지 요청하기 ===== //
 	@RequestMapping(value="/mygroups_detail.shy", method={RequestMethod.GET})
     public String goGrpDetail(HttpServletRequest req) {
 		
 		String str_groupno = req.getParameter("groupno"); // 해당 그룹번호 가져오기
 		//System.out.println("str_groupno="+str_groupno); // 확인용
 		
 		if(str_groupno!=null){
 			int groupno = Integer.parseInt(str_groupno);
 			HashMap<String, String> grpvomap = service.getGroupDetail(groupno);
 			req.setAttribute("grpvomap", grpvomap);
 			
 			// ===== 그룹 가입멤버 가져오기  =====
 			List<HashMap<String, String>> gmemberList = service.getGroupMember(groupno);
 			req.setAttribute("gmemberList", gmemberList);
 			
 			// ===== 그룹글 목록 가져오기  =====
 			List<HashMap<String, String>> gboardList = service.getGroupBoard(groupno);
 			req.setAttribute("gboardList", gboardList);
 			
 			return "pa/mygroups_detail.tiles";
 			
 		}else{
 			req.setAttribute("title", "그룹보기");
    		req.setAttribute("type", "error");
    		req.setAttribute("msg", "잘못된 접근입니다!");
    		req.setAttribute("loc", "mygroups.shy");
    		
    		return "Meong_msg.notiles";
 		}
     	
     }
 	
 	// ===== 그룹게시판 글쓰기  =====
    @RequestMapping(value="/gboardWrite.shy", method={RequestMethod.POST})
    public String goGboardWrite(MultipartHttpServletRequest req) throws IOException {
    	
    	HttpSession session = req.getSession();
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
		String msg = "♥ 먼저 로그인 하세요 ♥";
		String loc = "open.shy";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "Meong_msg.notiles";
		
		}else{
			int idx = loginuser.getIdx();
			System.out.println("idx="+idx);
			String str_groupno = req.getParameter("groupno");
			
			HashMap<String, Object> chckmap = new HashMap<String, Object>();
			chckmap.put("idx", idx);
			chckmap.put("str_groupno", str_groupno);
			
	    	String str_gpdetailno = service.getGmemberidx(chckmap);
			System.out.println("str_gpdetailno="+str_gpdetailno);
	    	
	    	MultipartFile uploadimg= req.getFile("uploadfile");
	    	System.out.println("uploadfile="+uploadimg); //출력해보기
	    	String gcontent = req.getParameter("gcontent");
	    	
	    	if(str_gpdetailno!=null&&uploadimg!=null){
	    		int gpdetailno = Integer.parseInt(str_gpdetailno);
	    		
	    		String root = session.getServletContext().getRealPath("/"); 
				String path = root + "resources"+File.separator+"files";
				
				path = req.getSession().getServletContext().getRealPath("/resources/images/shydb"); // 저장할 주소
				System.out.println(path);
				
				String Orgfile = uploadimg.getOriginalFilename(); // 실제파일명을 얻어옴
				byte[] bytes = uploadimg.getBytes();
				
				String uploadfile = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				uploadfile += System.nanoTime();
				uploadfile += Orgfile;
				System.out.println("newFilename = "+ uploadfile);
				// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
				File dir = new File(path);
				if(!dir.exists())
					dir.mkdirs();

				String pathname = path + File.separator + uploadfile;

				FileOutputStream fos = new FileOutputStream(pathname);
				fos.write(bytes);
				fos.close();
	    		
	    		HashMap<String, Object> map = new HashMap<String, Object>();
	        	map.put("gpdetailno", gpdetailno);
	        	map.put("uploadfile", uploadfile);
	        	map.put("gcontent", gcontent);
	        	
	    		int n = service.gboardWrite(map);
	    		
	    		if(n>0){
	    			int groupno = Integer.parseInt(str_groupno);
	    			
	    			req.setAttribute("title", "그룹게시글쓰기");
	        		req.setAttribute("type", "success");
	        		req.setAttribute("msg", "글쓰기성공!");
	        		req.setAttribute("loc", "mygroups_detail.shy?groupno="+groupno);
	        		
	    		}else{
	        		req.setAttribute("title", "그룹게시글쓰기");
	        		req.setAttribute("type", "error");
	        		req.setAttribute("msg", "글쓰기실패!");
	        		req.setAttribute("loc", "javascript.location(0);");
	        	}
	    	}else if(str_gpdetailno==null){
	    		String msg = "♥ 가입된 그룹회원만 글쓰기가 가능합니다. ♥";
	    		String loc = "mygroups_detail.shy?groupno="+str_groupno;
	    		
	    		req.setAttribute("msg", msg);
	    		req.setAttribute("loc", loc);
	    		
	    		return "Meong_msg.notiles";
	    	}
    	
		}
    	return "Meong_msg.notiles";
    }
    
    // ===== 그룹가입하기 완료 요청 =====
    @RequestMapping(value="/gmemberjoin.shy", method={RequestMethod.POST})
    public String goGmemberjoin(GroupVO grpvo, HttpServletRequest req) {
    	
    	int check = 0;
    	
		String groupno = req.getParameter("groupno");
		HttpSession session = req.getSession();
		ShyMemberVO loginuser = (ShyMemberVO) session.getAttribute("loginuser");

		if (loginuser == null) {
			String msg = "♥ 먼저 로그인 하세요 ♥";
			String loc = "open.shy";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

		} else {
			int fk_groupidx = loginuser.getIdx();
			System.out.println("idx=" + fk_groupidx);

			if (groupno != null) {
				int fk_groupno = Integer.parseInt(groupno);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fk_groupno", fk_groupno);
				map.put("fk_groupidx", fk_groupidx);

				// ===== 그룹회원인지 아닌지 먼저 확인  =====
				check = service.gmemberCheck(map);
				
				if(check==0){ // 회원이 아니면 0
					service.gmemberinsert(map);
					
					// ===== 그룹회원수 1증가하기  =====
					service.gmemberUpdate(fk_groupno);
					
					req.setAttribute("title", "그룹가입하기");
					req.setAttribute("type", "success");
					req.setAttribute("msg", "그룹가입!");
					req.setAttribute("loc", "mygroups_detail.shy?groupno=" + fk_groupno);
				}else{ // 회원이면 1 
					req.setAttribute("title", "그룹가입하기");
					req.setAttribute("type", "warning");
					req.setAttribute("msg", "이미 회원이십니다!");
					req.setAttribute("loc", "mygroups_detail.shy?groupno=" + fk_groupno);
				}
				
			} else {
				req.setAttribute("title", "그룹가입하기");
				req.setAttribute("type", "error");
				req.setAttribute("msg", "그룹가입실패!");
				req.setAttribute("loc", "mygroups_detail.shy?groupno=" + groupno);
			}

		}
		return "Meong_msg.notiles";
    }
    
}
