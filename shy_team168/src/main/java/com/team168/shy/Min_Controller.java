package com.team168.shy;

import java.util.ArrayList;  
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    	String pageNo1 = req.getParameter("pageNo1");
    	String pageNo2 = req.getParameter("pageNo2");
    	
    	/* 첫번째 페이징 처리 -----------------------------------------------*/
    	int totalCount1 = 0;
    	int sizePerPage1 = 5; 
    	int currentShowPageNo1 = 1;
    	int totalPage1 = 0; 
    	
    	int start1 = 0;
    	int end1 = 0;
    	int startPageNo1 = 0;

    	int loop1 = 0;
    	int blocksize1 = 5;
    	
    	
    	/* 두번째 페이징 처리 -----------------------------------------------*/
    	int totalCount2 = 0;
    	int sizePerPage2 = 5; 
    	int currentShowPageNo2 = 1;
    	int totalPage2 = 0; 
    	
    	int start2 = 0;
    	int end2 = 0;
    	int startPageNo2 = 0;

    	int loop2 = 0;
    	int blocksize2 = 5;
    	
    	
    	/* 첫번째 페이징 처리 -----------------------------------------------*/
    	if(pageNo1 == null) {
    		currentShowPageNo1 = 1;    		
    	}
    	else if(pageNo1 != null) {
    		currentShowPageNo1 = Integer.parseInt(pageNo1); 
    	}
   
    	start1 = ((currentShowPageNo1 - 1) * sizePerPage1) + 1;
    	end1 = start1 + sizePerPage1 - 1;
    	
    	
    	/* 두번째 페이징 처리 -----------------------------------------------*/
    	
    	if(pageNo2 == null) {
    		currentShowPageNo2 = 1;    		
    	}
    	else if(pageNo2 != null) {
    		currentShowPageNo2 = Integer.parseInt(pageNo2); 
    	}
   
    	start2 = ((currentShowPageNo2 - 1) * sizePerPage2) + 1;
    	end2 = start2 + sizePerPage2 - 1;
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	
    	String search = req.getParameter("search");
    	
    	
    	
    	map.put("search", search);
    	
    	map.put("start", String.valueOf(start1) );
    	map.put("end", String.valueOf(end1) );
    	map.put("start", String.valueOf(start2) );
    	map.put("end", String.valueOf(end2) );
   	
    	List<HashMap <String, String>> plist = service.peoplesearch(search);
    	List<HashMap <String, String>> glist = service.groupsearch(search);
    	
    	req.setAttribute("plist", plist);
    	req.setAttribute("glist", glist);
    	
    	
    	
			 
    	
    	totalCount = service.getTotalCount(map);
    	totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	
    	String pagebar = "";
    	pagebar += "<ul>";
    	
        loop = 1;

        startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
    	
        // **** 이전5페이지 만들기 ****
        if(startPageNo == 1) {
        	pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
        }
        else {
        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize);		
        }        
            	
        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
        while( !(loop > blocksize ||
        		 startPageNo > totalPage) ) {
        	if(startPageNo == currentShowPageNo) {
        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
        	}
        	else {
	        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/searchlist.shy?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo);
        	}
        	
        	loop++;
        	startPageNo++;
        	
        }// end of while--------------------
                
        // **** 다음5페이지 만들기 ****
        if(startPageNo > totalPage) {
        	pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
        }
        else {
        	pagebar += String.format("&nbsp;&nbsp;<a href='/shy/gesipan.shy?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize);	
        }
        pagebar += "</ul>";
    	
        req.setAttribute("pagebar", pagebar);
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
