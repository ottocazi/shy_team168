<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pa/groupsDetail.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/juno/myInfoEdit.css"/> 

<!-- === # 웹채팅관련 ===  -->
<script type="text/javascript" src="/board/resources/js/json2.js"></script>

<script type="text/javascript" >

    $(document).ready(function(){
    
        var url = window.location.host;          // 웹브라우저의 주소창의 포트까지 가져옴
    	alert("url : " + url);
    	    // 결과값  url: 192.168.10.19:9090
    	    
    	var pathname = window.location.pathname; // '/'부터 오른쪽에 있는 모든 경로
    	// 	alert("pathname : " + pathname);
    	    // 결과값  pathname : /board/chatting/multichat.action
    	 	
    	var appCtx = pathname.substring(0, pathname.indexOf("/",7));  // "전체 문자열".indexOf("검사할 문자", 시작순서인덱스번호);   
    	// 	alert("appCtx : " + appCtx);
    	    // 결과값  appCtx : /board/chatting
    	 	
    	var root = url+appCtx;
    	// 	alert("root : " + root);
    	 	// 결과값   root : 192.168.10.19:9090/shy
    	 	
    	
    	var wsUrl = "ws://"+root+"/mygroups_chat.shy";
    	 // var websocket = new WebSocket("ws://192.168.10.19:9090/shy/multichatstart.shy");
    	var websocket = new WebSocket(wsUrl);        
        
    	// alert(wsUrl);
    	
    	// >>>> Javascript WebSocket 이벤트 정리 <<<< 
	    //      onopen    ==>  WebSocket 연결
	    //      onmessage ==>  메시지 수신
	    //      onerror   ==>  전송 에러 발생
	    //      onclose   ==>  WebSocket 연결 해제
    	
    	var messageObj = {};
    	
	    // === 웹소켓에 최초로 연결이 되었을 경우에 실행되어지는 콜백함수
    	websocket.onopen = function() {
    	//	alert("웹소켓 연결됨!!");
    		$("#chatStatus").text("Info: connection opened.");
    	
    	/*	
            messageObj = {};  // 초기화
            messageObj.message = "반갑습니다.";
            messageObj.type = "all";
            messageObj.to = "all";
        */    
            // 또는
            messageObj = { message : "반갑습니다."
        		         , type : "all"
        		         , to : "all" };  // 초기화
            
            websocket.send(JSON.stringify(messageObj));
        };
    	
    	// === 메시지 수신 콜백함수
        websocket.onmessage = function(evt) {
            $("#chatMessage").append(evt.data);
            $("#chatMessage").append("<br />");
            $("#chatMessage").scrollTop(99999999);
        };
        
        // === 웹소캣 연결 해제 콜백함수
        websocket.onclose = function() {
            // websocket.send("채팅을 종료합니다.");
        }
        
        
        $("#message").keydown(function (event) {
             if (event.keyCode == 13) {
                $("#sendMessage").click();
             }
          });
         
        $("#sendMessage").click(function() {
            if( $("#message").val() != "") {
                 
            	messageObj = {};
            	messageObj.message = $("#message").val();
            	messageObj.type = "all";
            	messageObj.to = "all";
                 
                var to = $("#to").val();
                if ( to != "" ) {
                	messageObj.type = "one";
                	messageObj.to = to;
                }
                 
                websocket.send(JSON.stringify(messageObj));
                
                $("#chatMessage").append("<span style='color:navy; font-weight:bold;'>[나] ▷ " + $("#message").val() + "</span><br/>");
                $("#chatMessage").scrollTop(99999999);
                 
                $("#message").val("");
            }
        }); 
    });
</script>

<div class="grpdeatil_wrapper" align="center">
<aside id="grpdeatil_sidebar" class="grpdeatil_sidebar grpdeatil_sidebar-colored open" role="navigation">
    <a href="<%= request.getContextPath() %>/mygroups_detail.shy?groupno=${grpvomap.GROUPNO}">
    <c:if test="${grpvomap.GIMG!=null }">
    <div class="grpdeatil_sidebar-header header-cover" style="background-image: url(<%=request.getContextPath() %>/resources/images/shydb/${grpvomap.GIMG });">
    </div>
	</c:if>
	<c:if test="${grpvomap.GIMG==null }">
	<div class="grpdeatil_sidebar-header header-cover" style="background-image: url('http://wallpaperpulse.com/thumb/604167.jpg');">   
    </div>
    </c:if>
    </a>

    <ul class="nav grpdeatil_sidebar-nav">
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_summary.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-eye" aria-hidden="true">그룹개요</i>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_detail.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-pencil-square-o" aria-hidden="true">그룹게시글</i>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/mygroups_chat.shy?groupno=${grpvomap.GROUPNO }">
                <i class="fa fa-commenting-o" aria-hidden="true">그룹채팅</i>
            </a>
        </li>
    </ul>
</aside>


    
    <div class="grpdeatil_constructor">
        <h2 class="grpdeatil_headline">그룹채팅</h2>
        <hr />
        
        
        <div class="inrtGrpMemo" style="margin: 10px;">


			<div id="chatStatus"></div>
			<input type="button" id="sendMessage" value="엔터" />
		    <input type="text" id="message" placeholder="메시지 내용"/>
		    <input type="text" id="to" placeholder="귓속말대상"/>
		    <div id="chatMessage" style="overFlow: auto; max-height: 500px;"></div>
		        
        
        
        </div>
		  
		      
       
    </div>

</div>

