package com.team168.shy;

import java.util.ArrayList;  
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
		      
		      int totalCount = 0;        // 총게시물 건수
		      int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
		      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
		      
		      int start = 0;             // 시작 행 번호
		      int end = 0;               // 끝 행 번호
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
		      
		      start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
		      end = start + sizePerPage - 1;
		      
		      String search = req.getParameter("search");
		     // RowBounds rowbounds = new RowBounds(start, end);

		    	
		    	
		    	HashMap<String, String> map = new HashMap<String, String>();
		    	//map.put("search", search);
		    	
		    	// ===== #109. 페이징 처리를 위해 start, end 를 map 에 추가하여 DB에서 select 되어지도록 한다. ===== 
		    	map.put("start", String.valueOf(start) ); // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
		    	map.put("end", String.valueOf(end) );     // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
		    	
		    	
		    	
		    	List<HashMap <String, String>> plist = service.peoplesearch(search);
		    	List<HashMap <String, String>> glist = service.groupsearch(search);
		   
		    	totalCount = service.mTotalCount(map);
		    	
		 
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
		    	
		        req.setAttribute("pagebar", pagebar);

		        req.setAttribute("search", search);
		    	
		    	
		    	req.setAttribute("plist", plist);
		    	req.setAttribute("glist", glist);

		    	
		    	return "smin/searchlist.tiles";
		    	
		    }
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	

    // ===== #148. Ajax 로 검색어 입력시 자동글 완성하기 3 =====
//  ==> jackson JSON 라이브러리와 함께 @ResponseBoady 사용하여 JSON 파싱하기 === //
	
    /*   @ResponseBody란?
	     메소드에 @ResponseBody Annotation이 되어 있으면 return 되는 값은 View 단을 통해서 출력되는 것이 아니라 
	     HTTP Response Body에 바로 직접 쓰여지게 된다. 
		
	     그리고 jackson JSON 라이브러리를 사용할때 주의해야할 점은 
	     메소드의 리턴타입은 행이 1개 일경우 HashMap<K,V> 이거나 
	                                    Map<K,V> 이고 
		                    행이 2개 이상일 경우 List<HashMap<K,V>> 이거나
		                                    List<Map<K,V>> 이어야 한다.
		                    행이 2개 이상일 경우  ArrayList<HashMap<K,V>> 이거나
		                                     ArrayList<Map<K,V>> 이면 안된다.!!!
	     
	     이와같이 jackson JSON 라이브러리를 사용할때의 장점은 View 단이 필요없게 되므로 간단하게 작성하는 장점이 있다. 
	*/
    /*
    @RequestMapping(value="/wordSearchShow.shy", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, Object>> wordSearchShow(HttpServletRequest req) { 
    	
    	List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>(); 
    	
    	String colname = req.getParameter("colname");
    	String search = req.getParameter("search");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("colname", colname);
    	map.put("search", search);
    	
    	List<HashMap<String, String>> searchWordCompleteList = service.searchWordCompleteList(map); 
    	
    	if(searchWordCompleteList != null) {
    		for(HashMap<String, String> datamap : searchWordCompleteList) {
    			
    			HashMap<String, Object> submap = new HashMap<String, Object>();
    			submap.put("RESULTDATA", datamap.get("SEARCHDATA")); 
    			
    			returnmapList.add(submap);
    		}
    	}
    	
    	return returnmapList;
    }
    */
    
	
	
	
	
}
