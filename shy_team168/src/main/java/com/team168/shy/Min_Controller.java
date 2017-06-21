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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	
	/*board프로젝트에서 가져온 검색어 기능*//*board프로젝트에서 가져온 검색어 기능*/
	/*board프로젝트에서 가져온 검색어 기능*//*board프로젝트에서 가져온 검색어 기능*/
	/*board프로젝트에서 가져온 검색어 기능*//*board프로젝트에서 가져온 검색어 기능*/
	

	 // ===== #59. 글목록 보기 페이지 요청 =====
	    @RequestMapping(value="/searchlist.shy", method={RequestMethod.GET})
	    public String list(HttpServletRequest req, HttpSession session) { 
	    
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
	      /*
	           "페이지바" 란?
	           
	            이전5페이지 [1][2][3][4][5] 다음5페이지 
	            이전5페이지 [6][7][8][9][10] 다음5페이지
	            와 같이 이전5페이지 [1][2][3][4][5] 다음5페이지  
	            또는    이전5페이지 [6][7][8][9][10] 다음5페이지 를 
	           "페이지바" 라고 부른다.
	           startPageNo 는 1 또는 6 을 말한다.  
	       */
	      
	      int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
	      int blocksize = 5;  // "페이지바" 에 보여줄 페이지의 갯수 
	      
	      if(pageNo == null) {
	    	  // 게시판 초기화면에 보여지는 것은
	    	  // req.getParameter("pageNo"); 값이 없으므로
	    	  // pageNo 는 null 이 된다.
	    	  
	    	  currentShowPageNo = 1;
	    	  // 즉, 초기화면은 /list.action?pageNo=1 로 하겠다는 말이다.
	    	  
	      }
	      else {
	    	  currentShowPageNo = Integer.parseInt(pageNo);
	    	  // GET 방식으로 파라미터 pageNo 에 넘어온 값을
	    	  // 현재 보여주고자 하는 페이지로 설정한다.
	      }
	      
	      // **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
	      /*
	           currentShowPageNo      start    end
	           --------------------------------------
	               1 page      ==>      1       5 
	               2 page      ==>      6       10
	               3 page      ==>      11      15
	               4 page      ==>      16      20
	               5 page      ==>      21      25
	               6 page      ==>      26      30
	               7 page      ==>      31      35
	       */
	      
	      start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
	      end = start + sizePerPage - 1;		  
	    	
	    	
	    /*
	     ==================================================== 	
	    	List<BoardVO> boardList = service.boardList();
	     ====================================================	
	    */	
	   // ===== #104. 검색어가 포함되었으므로 
	   //       먼저 위의 List<BoardVO> boardList = service.boardList(); 부분을 
	   //       주석처리하고서 아래와 같이 한다. ===== 
	    	String colname = req.getParameter("colname");
	    	String search = req.getParameter("search");
	    	
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("colname", colname);
	    	map.put("search", search);
	    	
	    	// ===== #109. 페이징 처리를 위해 start, end 를 map 에 추가하여 DB에서 select 되어지도록 한다. ===== 
	    	map.put("start", String.valueOf(start) ); // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
	    	map.put("end", String.valueOf(end) );     // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
	    		
	    	
	    	List<BoardVO> boardList = service.boardList(map);
	    
	    	
	    //	===== #111. 페이징 작업의 계속(페이지바에 나타낼 총 페이지 갯수 구하기) =====
	    	/*
	    	    검색조건이 없을때의 총페이지수와
	    	    검색조건이 있을때의 총페이지수를 구해야 한다.
	    	    
	    	    검색조건이 없을때란 --> colname , search 값이 null 인 경우임.
	    	    검색조건이 있을때란 --> colname , search 값이 null 인 아닌경우임.
	    	 */
	    	
	    	// 총페이지수를 구하기 위해서는 먼저 총 게시물 건수를 구한다.
	    	// 총 게시물 건수는 검색조건이 있을 때와 없을때로 나뉘어진다.
	    	totalCount = service.getTotalCount(map);
	    	
	 //   	System.out.println(">>>> 확인용 totalCount : " + totalCount);
	    	
	    	// ==== 이제부터 페이지바 작성을 위한 작업에 들어간다. ====
	    //	43.0/10 ==> 4.3 --> 5 페이지가 필요함.
	    //	43.0/5  ==> 8.6 --> 9 페이지가 필요함.
	    	totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
	    	
	    	String pagebar = "";
	    	pagebar += "<ul>";
	    	/*
	    	    우리는 위에서 blocksize 를 5로 설정했으므로
	    	    아래와 같은 페이지바가 생성되도록 해야 한다.
	    	    
	    	    이전5페이지 [1][2][3][4][5] 다음5페이지 
	             이전5페이지 [6][7][8][9][10] 다음5페이지
	    	    이전5페이지 [11][12][13] 다음5페이지
	    	    
	    	    페이지번호는 1씩 증가하므로 페이지번호를 증가시켜주는 반복변수가 필요하다.
	    	    이것은 위에서 선언한 loop 를 사용한다.
	    	    이때 loop 는 blocksize 의 크기보다 크면 안된다.!! 
	    	 */
	    	
	        loop = 1;
	        
	        // **** !!! 페이지바의 시작 페이지번호(startPageNo)값 만들기 --- 공식임 !!!!
	        startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        /*
		        현재 우리는 blocksize 를 위에서 5로 설정했다.
		        
		        만약에 조회하고자 하는 currentShowPageNo 가 3페이지 이라면
		       startPageNo = ( (3 - 1)/5)*5 + 1;  ==> 1
		  
		        만약에  조회하고자 하는  currentShowPageNo 가 5페이지 이라면
		       startPageNo = ( (5 - 1)/5)*5 + 1;  ==> 1
		    
		        만약에  조회하고자 하는  currentShowPageNo 가 7페이지 이라면
		       startPageNo = ( (7 - 1)/5)*5 + 1;  ==> 6   
		    
		        만약에  조회하고자 하는  currentShowPageNo 가 10페이지 이라면
		       startPageNo = ( (10 - 1)/5)*5 + 1;  ==> 6 
		    
		        만약에  조회하고자 하는  currentShowPageNo 가 12페이지 이라면
		       startPageNo = ( (12 - 1)/5)*5 + 1;  ==> 11                     
		   */
	        
	        
	        // **** 이전5페이지 만들기 ****
	        if(startPageNo == 1) {
	        	// 첫 페이지바에 도달한 경우
	        	pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
	        }
	        else {
	        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d&colname=%s&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }        
	            	
	        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        		// 검색어가 없는 경우
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
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
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/board/list.action?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }
	        
	        
	        pagebar += "</ul>";
	    	
	        req.setAttribute("pagebar", pagebar);
	        req.setAttribute("colname", colname);
	        req.setAttribute("search", search);
	    	
	    	req.setAttribute("boardList", boardList);
	    	
	    	/* ===== #68. 글조회수(readCount)증가(DML문 update)는 
	                    반드시 해당 글제목을 클릭했을 경우에만 증가되고 
	                    웹브라우저에서 새로고침(F5)을 했을 경우에는
	                    증가가 안되도록 한다.
	                    이것을 하기 위해서 우리는 session 을 사용하여 처리한다. =====
	        */
	    	session.setAttribute("readCountPermission", "yes");
	    	/*
	    	    글목록 페이지(list.action)에 접속하면
	    	    세션의 "readCountPermission" 값은 "yes" 로 되어진다.  
	    	 */
	    	
	    	return "smin/searchlist.tiles";
	    	// /Board/src/main/webapp/WEB-INF/views2/board/list.jsp 파일을 생성한다.
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
    
    
	
	
	
	
}
