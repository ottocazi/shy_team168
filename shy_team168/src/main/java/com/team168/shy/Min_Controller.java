package com.team168.shy;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.Min_Service;


@Controller
@Component
public class Min_Controller {

	@Autowired
	
	private Min_Service service;
	
	
	

	@RequestMapping(value="/place.shy", method={RequestMethod.GET})
    public String goStore(HttpServletRequest req, HttpSession session) throws IOException {
		
	
		String geoidx = req.getParameter("geoidx");
		
		
 		
		
		
		System.out.println("컨트롤에서 받은 geoidx : " + geoidx);
		
		HashMap<String, String> geomap = service.getgeoinfo(geoidx);
		
		List <HashMap<String, String>> geolist = service.getgeoList(geomap);

		
		double distance = 1.2;
		geomap.put("distance", Double.toString(distance));
		
		if(geomap.get("latitude").equalsIgnoreCase("X")){
			
		}
		
		else{
			List <HashMap<String, String>>  selectNearMap = service.nearMap(geomap);
			selectNearMap.add(0, geomap);
			req.setAttribute("selectNearMap", selectNearMap);
		}
		
		
		/*System.out.println("selectNearMap.size() : " + selectNearMap.size());
		
		
		
		System.out.println("selectNearMap.size() : " + selectNearMap.size());*/
		
		
		
		
		
		
		
		
		req.setAttribute("geomap", geomap);
		req.setAttribute("geolist", geolist);
		
		 
		/*System.out.println("selectNearMap[0] : " + selectNearMap.get(0).get("latitude"));*/
		
		return "smin/busipage.tiles";
    	
    }
	
	
	
	

	@RequestMapping(value="/geo.shy", method={RequestMethod.GET})
    public String geoPage(HttpServletRequest req) {
    	
		return "testmap.notiles";
    	
    }
	
	@RequestMapping(value="/geotest.shy", method={RequestMethod.GET})
    public String geoPage2(HttpServletRequest req) {
    	
		
		return "geotest.notiles";
    	
    }
	
	
	// == 마이페이지 불러오기 == 
		@RequestMapping(value="/applybusi.shy", method={RequestMethod.GET})
	    public String applybusi(HttpServletRequest req) {
	    	
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
		       
	        return "smin/applybusi.tiles";

	    }
	

		@RequestMapping(value="/applybusiEnd.shy", method={RequestMethod.POST})
	    public String applybusiEnd(HttpServletRequest req, HttpSession session) throws IOException {
			
		
			
			ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
			System.out.println("loginuser의 이름 : " + loginuser.getName());
			
			int idx = loginuser.getIdx();
			
			String str_idx = req.getParameter("idx");
			System.out.println("컨트롤에서 받은 idx : "+ str_idx);
			
			String categoryno = req.getParameter("categoryno");
			System.out.println("컨트롤에서 받은 categoryno : " + categoryno);
			
			String bname = req.getParameter("bname");
			System.out.println("컨트롤에서 받은 bname : " + bname);
			

			String busicontent = req.getParameter("busicontent");
			System.out.println("컨트롤에서 받은 busicontent : " + busicontent);

			String busicall = req.getParameter("busicall");
			System.out.println("컨트롤에서 받은 busicall : " + busicall);

			String busimail = req.getParameter("busimail");
			System.out.println("컨트롤에서 받은 busimail : " + busimail);
			
			
			HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("idx", str_idx);
	    	map.put("categoryno", categoryno);
	    	map.put("bname", bname);
	    	map.put("busicontent", busicontent);
	    	map.put("busicall", busicall);
	    	map.put("busimail", busimail);
	    	
			int n = service.applybusiEnd(map);
			
			// n(정보수정 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
			// 그리고 변경되어진 정보를 보여주기 위해서 request 영역에 변경한 컬럼이름도 저장시키도록 한다.
			req.setAttribute("n", n);
			idx = Integer.parseInt(str_idx);
			ShyMemberVO getMemberVO = service.getMemberVO(idx);
		       
	        req.setAttribute("getMemberVO", getMemberVO);
		       
	        

			return "smin/applybusi.tiles";
	    	
	    }
	
	
	
	
	
	 // 관리자 공지사항 페이지요청
    @RequestMapping(value="/searchlist.shy", method={RequestMethod.GET})
    public String searchlist(HttpServletRequest req, HttpSession session){
	    
    		
		   // ===== #108. 페이징 처리하기 =====
		   // 페이징처리는 URL 주소창에 예를들어 /list.action?pageNo=3 와 같이 해주어야 한다.
		    	
		      String pageNo = req.getParameter("pageNo");
		      String pageNo1 = req.getParameter("pageNo1");
		      
		      
		      int totalCount = 0;        // 총게시물 건수
		      int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
		      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
		      
		      int start = 0;             // 시작 행 번호
		      int offset = 0;        // 끝 행 번호
		      int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
		    
		      int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
		      int blocksize = 5;  // "페이지바" 에 보여줄 페이지의 갯수 
		      
		      if(pageNo == null) {
		    	  currentShowPageNo = 1;
		    	  
		      }
		      else {
		    	  currentShowPageNo = Integer.parseInt(pageNo);
		    	  // GET 방식으로 파라미터 pageNo 에 넘어온 값을
		    	  // 현재 보여주고자 하는 페이지로 설정한다.
		      }
		      
		      start = (currentShowPageNo - 1) * sizePerPage;
		       offset = sizePerPage;
		       
		      RowBounds rowBounds = new RowBounds(start, offset);

		      
		      /////////////////////////////////////////////////////////////////////////////////
		      
		      int totalCount1 = 0;        // 총게시물 건수
		      int sizePerPage1 = 10;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
		      int currentShowPageNo1 = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		      int totalPage1 = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
		      
		      int start1 = 0;             // 시작 행 번호
		      int offset1 = 0;        // 끝 행 번호
		      int startPageNo1 = 0;       // 페이지바에서 시작될 페이지 번호 
		    
		      int loop1 = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
		      int blocksize1 = 5;  // "페이지바" 에 보여줄 페이지의 갯수 
		      
		      if(pageNo1 == null) {
		    	  currentShowPageNo1 = 1;
		    	  
		      }
		      else {
		    	  currentShowPageNo1 = Integer.parseInt(pageNo1);
		    	  // GET 방식으로 파라미터 pageNo 에 넘어온 값을
		    	  // 현재 보여주고자 하는 페이지로 설정한다.
		      }
		      
		      start1 = (currentShowPageNo1 - 1) * sizePerPage1;
		       offset1 = sizePerPage1;
		       
		      RowBounds rowBounds1 = new RowBounds(start1, offset1);

		      ////////////////////////////////////////////////////////////////////////////////////////
		      
		      
		      
		      
		      
		      
		     
		      String search = req.getParameter("search");
		    	
		    	HashMap<String, String> map = new HashMap<String, String>();
		    	map.put("search", search);
		    	
		    	
		    	List<HashMap <String, String>> plist = service.peoplesearch(map,rowBounds);
		    	List<HashMap <String, String>> glist = service.groupsearch(map,rowBounds1);
		   
		    	totalCount = service.mTotalCount(map);
		    	totalCount1 = service.gTotalCount(map);
		 
		    	
		    	
		    	
		    	totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		    	
		    	String pagebar = "";
		    	pagebar += "<ul>";
		    	
		    	
		        loop = 1;
		        
		        // **** !!! 페이지바의 시작 페이지번호(startPageNo)값 만들기 --- 공식임 !!!!
		        startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
		  
		        
		        // **** 이전5페이지 만들기 ****
		        if(startPageNo == 1) {
		        	// 첫 페이지바에 도달한 경우
		        	pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
		        }
		        else {
		        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
		        	
		        	if(search == null) {
		        		// 검색어가 없는 경우
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, search, blocksize); // 검색어 있는 경우        		
		        	}	
		        }        
		            	
		        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
		        while( !(loop > blocksize ||
		        		 startPageNo > totalPage) ) {
		        	
		        	if(startPageNo == currentShowPageNo) {
		        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
		        	}
		        	else {
			        	if(search == null) {
			        		// 검색어가 없는 경우
			        		pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
			        	}
			        	else{
			        		// 검색어가 있는 경우
			        	    pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo,  search, startPageNo); // 검색어 있는 경우        		
			        	}
		        	}
		        	
		        	loop++;
		        	startPageNo++;
		        	
		        }// end of while--------------------
		                
		        // **** 다음5페이지 만들기 ****
		        if(startPageNo > totalPage) {
		        	// 마지막 페이지바에 도달한 경우
		        	pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
		        }
		        else {
		        	// 마지막 페이지바가 아닌 경우
		        	
		        	if(search == null) {
		        		// 검색어가 없는 경우
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, search, blocksize); // 검색어 있는 경우        		
		        	}	
		        }
		        
		        
		        pagebar += "</ul>";
		        
		        
		        
		        
		        
		        
		        

		    	totalPage1 = (int)Math.ceil((double)totalCount1/sizePerPage1);
		    	
		    	String pagebar1 = "";
		    	pagebar1 += "<ul>";
		    	
		    	
		        loop1 = 1;
		        
		        // **** !!! 페이지바의 시작 페이지번호(startPageNo)값 만들기 --- 공식임 !!!!
		        startPageNo1 = ((currentShowPageNo1 - 1)/blocksize1)*blocksize1 + 1;
		  
		        
		        // **** 이전5페이지 만들기 ****
		        if(startPageNo1 == 1) {
		        	// 첫 페이지바에 도달한 경우
		        	pagebar1 += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize1);
		        }
		        else {
		        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
		        	
		        	if(search == null) {
		        		// 검색어가 없는 경우
		        		pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo1-1, blocksize1); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo1-1, search, blocksize1); // 검색어 있는 경우        		
		        	}	
		        }        
		            	
		        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
		        while( !(loop1 > blocksize1 ||
		        		 startPageNo1 > totalPage1) ) {
		        	
		        	if(startPageNo1 == currentShowPageNo1) {
		        		pagebar1 += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo1);	
		        	}
		        	else {
			        	if(search == null) {
			        		// 검색어가 없는 경우
			        		pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d'>%d</a>&nbsp;&nbsp;", startPageNo1, startPageNo1); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
			        	}
			        	else{
			        		// 검색어가 있는 경우
			        	    pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo1,  search, startPageNo1); // 검색어 있는 경우        		
			        	}
		        	}
		        	
		        	loop1++;
		        	startPageNo1++;
		        	
		        }// end of while--------------------
		                
		        // **** 다음5페이지 만들기 ****
		        if(startPageNo1 > totalPage1) {
		        	// 마지막 페이지바에 도달한 경우
		        	pagebar1 += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize1);
		        }
		        else {
		        	// 마지막 페이지바가 아닌 경우
		        	
		        	if(search == null) {
		        		// 검색어가 없는 경우
		        		pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo1, blocksize1); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar1 += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo1=%d&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo1, search, blocksize1); // 검색어 있는 경우        		
		        	}	
		        }
		        
		        
		        pagebar1 += "</ul>";
		        
		        
		        req.setAttribute("pagebar", pagebar);
		        req.setAttribute("pagebar1", pagebar1);

		        
		        
		        
		        
		        req.setAttribute("search", search);
		    	
		    	
		    	req.setAttribute("plist", plist);
		    	req.setAttribute("glist", glist);

		    	
		    	return "smin/searchlist.tiles";
		    	
		    }
    
    
    
	
    
    
 // ===== mypage 페이지 요청하기 (내 shy계정) ===== //
 	@RequestMapping(value="/gainpage.shy", method={RequestMethod.GET})
     public String Gainpage(HttpServletRequest req,HttpSession session) {
 		
 		
 		String myIdx = req.getParameter("myIdx");
 		req.setAttribute("myIdx", myIdx);
		
 		String getgain = service.getGain(myIdx);
 		req.setAttribute("getgain", getgain);
 		
		System.out.println("컨트롤에서 받은 myIdx : " + myIdx);
 			// 기본 페이지번호를 1으로 설정하고
 	        int pageNo = 1;
 	 
 	        // 넘어온 파라미터가 있다면
 	        // 해당 파라미터를 int형으로 캐스팅후 변수에 대입
 	        if(req.getParameter("pageNo") != null){
 	        pageNo = Integer.parseInt(req.getParameter("pageNo"));
 	        }
 	        
 	        int sizePerPage = 6;
 	        
 	        int start = (pageNo - 1) * sizePerPage + 1;
 	        int end = pageNo * sizePerPage;
 	        
 			// 나의 샤이 개수 가져오기 , 내 정보 개수 가져오기 
 			int myshyCount = service.getMyshyCount(myIdx);
 			req.setAttribute("myshyCount", myshyCount);
 			
 			// 팔로우 수 가져오기
 	        int fk_idxflwedcnt = service.getMyflwcnt(myIdx);
 	        req.setAttribute("fk_idxflwedcnt", fk_idxflwedcnt);
 			
 			HashMap<String, Object> mymap = new HashMap<String, Object>();
 			mymap.put("myIdx", myIdx);
 			mymap.put("start", String.valueOf(start));
 			mymap.put("end", String.valueOf(end));
 			
 			//mymap.put("myshyCount", String.valueOf());
 			
 			// 나의 샤이 가져오기 , 내 정보 가져오기(join)
 			List <HashMap<String, String>> myshyList = service.getMyshy(mymap);
 			
 			
 			if(myshyList!=null){
 				for(int i =0 ; i<myshyList.size(); i++){
 					
 					
 					// 가져온 샤이의 메인 정보를 가져 오는 동안 image, 친구태그, 지역태그 유무의 status를 확인하여 그 값을 추가하거나 null값을 부여한다.
 					// 페이징 처리 미완성
 					if("1".equals(myshyList.get(i).get("simage"))){
 						
 						String snsno = myshyList.get(i).get("snsno");
 						System.out.println("snsno = "+snsno);
 						// 이미지 가져오기
 						String imgfile = service.getImgaddr(snsno);
 						
 						System.out.println("해시맵에 담기 직전의 파일명(중요) : ");
 						myshyList.get(i).put("imageaddr", imgfile);
 						
 					}
 					
 					else if("0".equals(myshyList.get(i).get("simage"))){
 						myshyList.get(i).put("imageaddr", null);
 					}
 					
 					System.out.println("shies.simage : "+myshyList.get(i).get("simage"));
 					System.out.println("shies에 들어간 imageaddr = " + myshyList.get(i).get("imageaddr"));
 				}
 			
 			}
 			req.setAttribute("myshyList", myshyList);
 			
 			return "smin/gainpage.tiles";
 		
 		}
 	
	
    
 // ===== mypage 페이지 요청하기 (Ajax) ===== //
 	@RequestMapping(value = "/gainpageList.shy", method = { RequestMethod.POST })
 	@ResponseBody
 	public List<HashMap<String, String>> GainpageAjax(HttpServletRequest req,HttpSession session) { 

 		// 기본 페이지번호를 1으로 설정하고
         int pageNo = 1;
  
         // 넘어온 파라미터가 있다면
         //if (req.getParameter("page") != null) {
  
             // 해당 파라미터를 int형으로 캐스팅후 변수에 대입
         pageNo = Integer.parseInt(req.getParameter("pageNo"));
         //}
         
         int sizePerPage = 6;
         
         int start = (pageNo - 1) * sizePerPage + 1;
         int end = pageNo * sizePerPage;


         String myIdx = req.getParameter("myIdx");
         System.out.println("컨트롤에서 받은 myIdx : " + myIdx);
 		
 		
 		req.setAttribute("myIdx", myIdx);

 		HashMap<String, Object> mymap = new HashMap<String, Object>();
 		mymap.put("myIdx", myIdx);
 		mymap.put("start", String.valueOf(start));
 		mymap.put("end", String.valueOf(end));
 		
 		// (페이징 처리한 것)나의 샤이 가져오기 , 내 정보 가져오기
 		List<HashMap<String, String>> myshyList = service.getMyshy(mymap);
 		
 		////
 		// 나의 샤이 개수 가져오기 , 내 정보 개수 가져오기 
 		int myshyCount = service.getMyshyCount(myIdx);
 		////
 		
 		if (myshyList != null) {
 			for (int i = 0; i < myshyList.size(); i++) {

 				// 가져온 샤이의 메인 정보를 가져 오는 동안 image, 친구태그, 지역태그 유무의 status를
 				// 확인하여 그 값을 추가하거나 null값을 부여한다.
 				// 페이징 처리 미완성
 				if ("1".equals(myshyList.get(i).get("simage"))) {

 					String snsno = myshyList.get(i).get("snsno");
 					System.out.println("snsno = " + snsno);
 					// 이미지 가져오기
 					String imgfile = service.getImgaddr(snsno);

 					System.out.println("해시맵에 담기 직전의 파일명(중요) : ");
 					myshyList.get(i).put("imageaddr", imgfile);

 				}

 				else if ("0".equals(myshyList.get(i).get("simage"))) {
 					myshyList.get(i).put("imageaddr", null);
 				}
 				
 				if (myshyCount != (start + i)) {
 					myshyList.get(i).put("end", "0");
 				}
 				
 				else {
 					myshyList.get(i).put("end", "1");
 				}

 				System.out.println("shies.simage : " + myshyList.get(i).get("simage"));
 				System.out.println("shies에 들어간 imageaddr = " + myshyList.get(i).get("imageaddr"));
 			}

 		}
 		
 		
 		return myshyList;

 	}
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
    
    
    
}


















