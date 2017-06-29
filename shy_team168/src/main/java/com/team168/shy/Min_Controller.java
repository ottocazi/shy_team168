package com.team168.shy;


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

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.Min_Service;


@Controller
@Component
public class Min_Controller {

	@Autowired
	
	private Min_Service service;
	
	@RequestMapping(value="/min.shy", method={RequestMethod.GET})
    public String goMypage(HttpServletRequest req) {
    	
		return "smin/busipage.tiles";
    	
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
    
    
    
	
	
}











