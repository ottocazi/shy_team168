<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- DDD -->

<!-- 타임라인소스 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ddung/timelinestyle.css">

<!-- 코멘트박스 소스 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ddung/commentboxstyle.css">

<!-- 아이콘 통일 소스주소: http://materializecss.com/icons.html -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->


<!-- <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'> -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
  
	$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
	
	$.ajaxSetup({
 	    type        : 'POST',
 	    async       : false,
 	    cache       : false,
 	    contentType : 'application/json; charset=utf-8',
 	    dataType    : 'json',
 	    error       : function(xhr,e) { 
 	        $.unblockUI();
 	       if (xhr.status == 0) {
 	            alert('You are offline!!\n Please Check Your Network.');
 	        }
 	        else if (xhr.status == 404) {

 	            alert('Requested URL not found.');
 	        }
 	        else if (xhr.status == 500) {
 	            alert('Internel Server Error.\n');
 	        }
 	        else if (e == 'parsererror') {
 	            alert('Error.\nParsing JSON Request failed.');
 	        }
 	        else if (e == 'timeout') {
 	            alert('Request Time out.');
 	        }
 	        else {
 	            alert('Unknow Error.\n'+xhr.responseText);
 	        } 

 	    },
 	    beforeSend : function(xhr, setting) {
 	        if ( setting && setting.async == true ) {
 	            $.blockUI();
 	        }
 	    },
 	    complete   : function(xhr, e) {
 	        //$.unblockUI();
 	    }
 	});//$.ajaxSetup({
  
    $(document).ready(function(){
    	$('.bt-love_chg').hide();
    	countComment();
    	getLike();
    	
    	//var content = $(".hashcheck").text();
    	//alert(content);
    	// var content = document.getElementById('scontent').innerHTML;
    	// html 안에 'scontent'라는 아이디를 content 라는 변수로 정의한다.
    	//content = content.replace(/^\s+/,"");
    	
    	var arr = $(".hashcheck").map(function(){
    		return $(this).text();
    	}).get();
    	
    	//alert(content.indexOf('#'));
    	/* if(content.indexOf('"#')==0){
    		alert("check"+content);
    		var plus = '<a style=\'color:#8888DD;font-weight:bold;\' href=\'#\'>';
    		var plusend = '</a>';
    		var position = content.indexOf(" "||"#",1);
    		var front = content.substring(0, position);
    		var behind = content.substr(position);
    		
    		var front = plus.concat(front);
    		var behind = plusend.concat(behind);
    		content = front.concat(behind);
    		alert(content);
    	} */
    	
    	/* 
    	var splitedArray = content.split(' '); // 공백을 기준으로 문자열을 자른다.
    	var linkedContent = ' ';
    	for(var word in splitedArray)
    	{
    	  word = splitedArray[word];
    	
    	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
    	   {
    	      word = '<a style=\'color:#8888DD;font-weight:bold;\' href=\'#\'>'+word+'</a>';
    	   }
    	   linkedContent += word+' ';
    	}
    	
    	document.getElementById('scontent').innerHTML = linkedContent; 
     	*/
     	
     	for(var i = 0; i < arr.length; ++i) {
     		var splitedArray = arr[i].split(' ');
     		var linkedContent = '';

     		for(var word in splitedArray)
        	{
        	  	word = splitedArray[word];
        	
	        	if(word.indexOf('#') == 0) // # 문자를 찾는다.
	        	{
	        		var noSharpWord = word.substring(1, word.length);
					
	        		word = '<a style="color:#8888DD;font-weight:bold;" href="search_hashtag.shy?word=' + noSharpWord + '">'+word+'</a>';
	        	}
	        	
	        	linkedContent += word+' ';
        	}
     		
     		$('#hashcheck' + i).html(linkedContent);
     	}
     	
     	
    });// end of $(document).ready() --------
    
    function goLike(idx,likeseq,seqcolum){
    	
      var form_data = {idx : idx,
                   likeseq   : likeseq,
                   seqcolum   : seqcolum};
      
       // 좋아요 Ajax 불러오기
        $.ajax({
            url: "/shy/like.shy",
            async: false,
            type: "GET",
            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
            data: form_data ,// 파라미터     
            success: function(data) { // 성공했을 때의 처리 콜백함수
               
               getLike();
               
            },
            error: function() { // 에러가 발생했을 때의 콜백함수
            	$.blockUI();
            }
        });
    }
    
    function getLike(){
        var snsnoArr = new Array();
        
         <c:if test="${shies!=null}">
         <c:forEach items="${shies}" var="shies">
         //alert('${shies.snsno}');
         snsnoArr.push("${shies.snsno}");
         </c:forEach>
         </c:if>
         //alert(snsnoArr);
          
         jQuery.ajaxSettings.traditional = true;
       
        // 좋아요목록 Ajax 불러오기
         $.ajax({
             url: "/shy/likeList.shy",
             type: "GET",
             dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
             data: {snsnoArr:snsnoArr},
             success: function(data) { // 성공했을 때의 처리 콜백함수
                var snsnoObjArr = [];
                
                $.each(data,function(entryIndex,entry){
                   snsnoObjArr.push([entry.snsno,Number(entry.totalcount),Number(entry.mylikestat),Number(entry.likeno) ]);
                   if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 1){
                         $('#bt-love'+entry.snsno).hide();
                         $('#love'+entry.snsno).empty();
                         
                         var html = "<span>"+entry.totalcount+"</span>";
                         $('#love'+entry.snsno).html(html).show();
                         
                   }else if(Number(entry.totalcount) >0 && Number(entry.mylikestat) == 0){
                 	  	var html = "<span>"+entry.totalcount+"</span>";
                 	  	$('#bt-love'+entry.snsno).html(html).show();
                 	  	$('#love'+entry.snsno).hide();
                 	  	
                   }else{
                        $('#bt-love'+entry.snsno).show();
                        $('#love'+entry.snsno).hide();
                    } 
                });
                
             },
             error: function() { // 에러가 발생했을 때의 콜백함수
                 alert("getlikeError");
             }
         });
        
    }
   
    function goUnlike(idx,likeseq,seqcolum){
        var form_data = {idx : idx,
                     likeseq   : likeseq,
                     seqcolum   : seqcolum};
        
         // 좋아요 Ajax 불러오기
          $.ajax({
              url: "/shy/unlike.shy",
              async: false,
              type: "GET",
              dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
              data: form_data ,// 파라미터     
              success: function(data) { // 성공했을 때의 처리 콜백함수
                 
                 getLike();
                 
              },
              error: function() { // 에러가 발생했을 때의 콜백함수
            	  $.blockUI();
              }
          });
         
     }
    
    function openComment(snsno) {
	   
       
	   var commentbox = document.getElementById('commentbox'+snsno);

	   if(commentbox.style.display=='none'){
		   
		   var form_data = {snsno : snsno };
		   
		   $.ajax({
	            url: "/shy/getComments.shy",
	            type: "GET",
	            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
	            data: form_data,
	            success: function(data) { // 성공했을 때의 처리 콜백함수
	            	
	            	commentbox.style.display = 'block';
	            	var html = '';
	            	
	    			$.each(data, function(i, comments){
	    				//alert(entry.cmtcontent);
	    				
	    				html += '<div id="shy_comment_ajax' + comments.cmtno
	    					 + '" class="shy_comment">'
	    					 + '<div class="shy_comment-avatar">'
	    					 + '<img src="<%=request.getContextPath() %>/resources/images/shydb/'
	    					 + comments.myimg
	    					 + '"></div>'
	    					 + '<div class="shy_comment-box">'
	    					 + '<div class="shy_comment-text">'
	    					 + comments.cmtcontent
	    					 + '</div>'
	    					 + '<div class="shy_comment-footer">'
	    				 	 + '<div class="shy_comment-info">'
	    				 	 + '<a href="#"> <span class="shy_comment-author">';
    				if (comments.name==null){
	    				html += comments.email+ '</span></a>';
	    			}
	    			else {
	    			 	html	+= comments.name+ '</span></a>'; 
 				 	}
	    				
    			     html   += '<span class="shy_comment-date">'
                         + comments.updatetime+'</span>'
                         + '</div>'
                         + '<div class="shy_comment-actions">'
                        + ' <a href="javascript:modiCheck('
                        + snsno+','+comments.cmtno+','+comments.fk_idx+');"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></a> '
                        + '</div>'
                         + '</div>'
                         + '</div></div>';   
                  
                     /*html END*/ 

	    				
	    				
	    				
	    			});
	               
	    			$("#shy_comment_ajax" + snsno).html(html);
	               
	            },
	            error: function() { // 에러가 발생했을 때의 콜백함수
	                alert("error");
	            }
	        });
		   
		    
	    }else{
	        commentbox.style.display = 'none';
	    }

	}
    
    function reopenComment(snsno){
    	
    	 $.ajax({
	            url: "/shy/getComments.shy",
	            type: "GET",
	            dataType: "JSON", // 리턴받을 데이터의 타입 - text, xml 등...
	            data: {snsno:snsno},
	            success: function(data) { // 성공했을 때의 처리 콜백함수
	            	
	            	countComment();
	            	var commentbox = document.getElementById('commentbox'+snsno);
	            	commentbox.style.display = 'block';
	            	var html = '';
	            	
	    			$.each(data, function(i, comments){
	    				//alert(entry.cmtcontent);
	    				
	    				html += '<div id="shy_comment_ajax' + comments.cmtno
	    					 + '" class="shy_comment">'
	    					 + '<div class="shy_comment-avatar">'
	    					 + '<img src="<%=request.getContextPath() %>/resources/images/shydb/'
	    					 + comments.myimg
	    					 + '"></div>'
	    					 + '<div class="shy_comment-box">'
	    					 + '<div class="shy_comment-text">'
	    					 + comments.cmtcontent
	    					 + '</div>'
	    					 + '<div class="shy_comment-footer">'
	    				 	 + '<div class="shy_comment-info">'
	    				 	 + '<a href="#"> <span class="shy_comment-author">';
 				if (comments.name==null){
	    				html += comments.email+ '</span></a>';
	    			}
	    			else {
	    			 	html	+= comments.name+ '</span></a>'; 
				 	}
	    				html	+= '<span class="shy_comment-date">'
	    					 + comments.updatetime+'</span>'
	    					 + '</div>'
	    					 + '<div class="shy_comment-actions">'
	    					 + ' <a href="javascript:modiCheck('
	                         + snsno+','+comments.cmtno+','+comments.fk_idx+');"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></a> '
	                         + '</div>'
	    					 + '</div>'
	    					 + '</div></div>';   
	    			
	    				/*html END*/ 
	    				
	    				
	    				
	    			});
	               
	    			$("#shy_comment_ajax" + snsno).html(html);
	               
	            },
	            error: function() { // 에러가 발생했을 때의 콜백함수
	                alert("error");
	            }
	        });
    	
    }
    
    /* ajax 로 댓글 갯수 읽어 오기 */
   	function countComment() {
   		var snsnoArr = new Array();
   		<c:if test="${shies!=null}">
   		
   		<c:forEach items="${shies}" var="shies">
   		// alert('${shies.snsno}');
   		snsnoArr.push('${shies.snsno}');
   		</c:forEach>
   		</c:if>
   		// alert(snsnoArr);
   		
   		jQuery.ajaxSettings.traditional = true;
   		
   		$.ajax({
   			url: "/shy/getCommentCount.shy",
    		type: "GET",
    		data: {snsnoArr:snsnoArr},
    		dataType: "JSON",  
    		success: function(data){
    			
    			var html;
    			
    			$.each(data, function(entryIndex, entry){
    			//	alert(entry.snsno);
    				
    				
    				html = "댓글(" + entry.cnt + ")";
    				
    				$("#comment" + entry.snsno).html(html);
    				
    			});
    		
    		},
    		error: function(){
 				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
 		    }
   		});
    } 
    
    
 function insertReply(shyidx){
    	
	   	var myidx = $('#myidx'+shyidx).val();
    	var replycontent = $('#replycontent'+shyidx).val();
    	
    	var form_data = {myidx : myidx,
                   		 shyidx   : shyidx,
                   		 replycontent   : replycontent };
    	
    	$.ajax({
    		url: "/shy/insertreply.shy",
    		type: "GET",
    		data: form_data ,
    		dataType: "text", 
    		success: function(data) {
    			
    			$('#replycontent'+shyidx).val("");
    			
    			reopenComment(shyidx);
    		},
    		error: function(){
				  //alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				  alert('ajax 오류');
		    }
    			
    	}); 
    }
    
 
 function modiCheck(snsno, cmtno, fk_idx) {
     
     var idx = ${loginuser.idx};
     if (fk_idx == idx){
        selectmodi(snsno, cmtno, fk_idx);
     } else {
        goBlame(snsno, cmtno, fk_idx);
     }
  }
  
  function selectmodi(snsno, cmtno, fk_idx){
     
     swal({
          title: '',
          text: "",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '수정하기',
          cancelButtonText: '삭제하기'
        }).then(function () {
           
           swal.setDefaults({
                 showCancelButton: false,
                 animation: true,
                 progressSteps: ['1']
               })
             
               var steps = [
                 {
                     title: cmtno+'번의 댓글 수정',
                     text: "원래글내용:",
                     input: 'text',
                      inputPlaceholder: '수정할 댓글을 입력하세요.',
                      inputValue: '',
                     showCancelButton: true,
                   confirmButtonText: '수정하기',
                    cancelButtonText: '수정취소',
                    inputValidator: function (value) {
                        return new Promise(function (resolve, reject) {
                          if (value) {
                            resolve()
                          } else {
                            reject('수정할 내용을 입력해 주세요')
                          }
                        })
                    }
                   }
               ]

               swal.queue(steps).then(function (result) {
                  alert(result);
                  $.ajax({
                        url: "/shy/goCommentEdit.shy",
                      type: "GET",
                      data: {snsno:snsno
                           ,cmtno:cmtno
                           ,cmtcontent:result
                           ,fk_idx:fk_idx
                           },
                      dataType: "JSON",  
                      success: function(data){
                         //alert("댓글 수정 ajax success function!");
                         
                          swal.resetDefaults()
                             swal({
                               title: '댓글 수정!',
                               html:
                                 '수정된 댓글: <pre>' +
                                   JSON.stringify(result) +
                                 '</pre>',
                               confirmButtonText: '수정완료!',
                               showCancelButton: false
                             })
                             reopenComment(snsno);
                       },
                      error: function(){
                           alert("댓글 수정 ajax error function!"); 
                       }
                     });
                  
               }, function () {
                 swal.resetDefaults()
               })
        }, function (dismiss) {
           //alert("dismiss : "+ dismiss);
           
           $.ajax({
                 url: "/shy/goCommentDelete.shy",
               type: "GET",
               data: {snsno:snsno
                    ,cmtno:cmtno
                    ,fk_idx:fk_idx
                    },
               dataType: "JSON",  
               success: function(data){
                  //alert("댓글 삭제 ajax success function!");

                  // dismiss can be 'cancel', 'overlay',
                  // 'close', and 'timer'
                  
                  if (dismiss === 'cancel') {
                      swal(   
                        '삭제완료',
                        '댓글이 삭제되었습니다.',
                        'error'
                      )
                      
                      reopenComment(snsno);
                    }
                   
                  
               },
               error: function(){
                    alert("댓글 수정 ajax error function!"); 
                }
              });
        })
  }
  
  function goBlame(snsno, cmtno, fk_idx){
     swal({
        title: '',
        text: "",
        type: 'warning',
        showCancelButton: false,
        confirmButtonColor: '#d33',
        confirmButtonText: '신고하기'
      }).then(function () {
         
         swal.setDefaults({
               showCancelButton: true,
               confirmButtonColor: '#d33',
               cancelButtonColor: '#3085d6',
               cancelButtonText: '삭제하기',
               animation: true,
               progressSteps: ['1']
             })
          
            var options = new Promise(function (resolve) {
              
                resolve({
                  '1': '광고홍보성',
                  '2': '음란성',
                  '3': '욕설 및 인신공격',
                  '4': '도배성',
                  '5': '유언비어',
                   '6': '기타'
                })
              
            })
              
              
             var steps = [
               {
                   title: '신고사유선택',
                   text: '신고할 내용을 선택해주세요.',
                   showCancelButton: true,
                 confirmButtonText: '신고하기',
                  cancelButtonText: '신고취소',
                  inputOptions: options,
                  input: 'radio',
                  inputValidator: function (result) {
                     return new Promise(function (resolve, reject) {
                       if (result) {
                         resolve()
                       } else {
                         reject('신고 사유를 선택해주세요.')
                       }
                     })
                 }
                 }
             ]

             swal.queue(steps).then(function (result) {
                //alert("result : "+result);
                //alert("snsno : "+snsno+" cmtno : "+cmtno+" fk_idx : "+fk_idx);
                // 1~5 선택시
                if(result < 6) {
                   var value = "";
                   goBlameEnd(result,snsno,cmtno,fk_idx,value);
                } else { // 6(기타) 선택시
                   swal({
                      showCancelButton: true,
                      confirmButtonText: '신고하기',
                      confirmButtonColor: '#d33',
                      cancelButtonColor: '#3085d6',
                      cancelButtonText: '신고취소',
                      animation: true,
                      progressSteps: ['1','2'],
                      title: '기타사유 입력',
                        text: '',
                        input: 'text',
                         inputPlaceholder: '신고할 사유를 입력하세요.',
                         inputValue: '',
                        showCancelButton: true,
                       inputValidator: function (value) {
                           return new Promise(function (resolve, reject) {
                                //alert(value);
                              
                              if (value) {
                               resolve()
                                goBlameEnd(result,snsno,cmtno,fk_idx,value);
                             } else {
                               reject('신고할 내용을 입력해 주세요.')
                             }
                           })
                       }
                   }).then(function (){
                      
                   }, function (dismiss) {
                      alert("dismiss : "+ dismiss);
                      
                      // dismiss can be 'cancel', 'overlay',
                      // 'close', and 'timer'
                      
                      if (dismiss === 'cancel') {
                          swal(   
                            '신고취소',
                            '신고가 취소되었습니다.',
                            'error'
                          )
                        }
                          
                   })
                } // end of else ~
                
             }, function () {
               swal.resetDefaults()
             })
      }, function (dismiss) {
         alert("dismiss : "+ dismiss);
         // dismiss can be 'cancel', 'overlay',
        // 'close', and 'timer'
        
          if (dismiss === 'cancel') {
              swal(   
                '신고취소',
                '신고가 취소되었습니다.',
                'error'
              )
        }
                 
      })
  }
  
  function goBlameEnd(result,snsno,cmtno,fk_idx, value){
     alert("goBlameEnd();시작! value : "+value);
     
       $.ajax({
             url: "/shy/goBlameEnd.shy",
           type: "GET",
          data: {snsno:snsno
             ,cmtno:cmtno
             ,fk_idx:fk_idx
             ,result:result
             ,value:value
             },
           dataType: "JSON",  
           success: function(data){
              alert(result+"번 사유로 신고 result : "+result+" snsno : "+snsno+" cmtno : "+cmtno+" fk_idx : "+fk_idx);
              
              swal.resetDefaults()
                swal({
                  title: fk_idx+'님의 댓글 신고!',
                  html:
                    '신고된 사유: <pre>' +
                      JSON.stringify(result) +
                    '</pre>',
                  confirmButtonText: '신고 완료!',
                  showCancelButton: false
                })
               
           //   countComment();
           },
           error: function(){
                alert("댓글 신고 ajax error function!"); 
            }
          });
     
  }
  
  function showprice(id, price){
	 
	  var text = $("#sp"+id).html();
	  
	  if (text=="paid!"){
	  $("#sp"+id).html(price);
	  }
	  
	  else {
		  $("#sp"+id).html("paid!");
	  }
	
  }
</script>

<style>
.dd_button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.dd_button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}
</style>
</head>
<body>




	<main role="main"><!--지우지 마세요  --> 
	
	
	
	 <c:if test="${shies!=null}">
		<c:forEach items="${shies}" var="shies" varStatus="status">

			<article class="card-60 social" >
				<figure>
				<c:if test="${shies.shypay!=null }">
<span class="ribbon-buy">
        <img src="<%=request.getContextPath() %>/resources/images/ddung/pig.svg" style="margin-top:10px;"/>
      </span>
      </c:if>
					<img src="<%=request.getContextPath() %>/resources/images/shydb/${shies.imageaddr}" alt="shy" id="nike">

				</figure>
				<!-- end figure-->
				<div class="flex-content">

					<header>
						<p class="user">
						<c:if test="${shies.shypay!=null }">
						<c:if test="${shies.shyprice!=null }">
									
						<a class="button follow" id="sp${shies.snsno }" onclick="showprice('${shies.snsno}','${shies.shyprice}');">paid!</a><!--title="Follow"  -->
			
						</c:if>
						
						<c:if test="${shies.shyprice==null }">
									
						<a class="button follow" id="sp${shies.snsno }" onclick="showprice('${shies.snsno}','미공개');">paid!</a><!--title="Follow"  -->
			
						</c:if>
						
					
						
						</c:if>
							
							<c:if test="${shies.myimg != null}">
								<img class="avatar-32"
									src="<%=request.getContextPath() %>/resources/images/shydb/${shies.myimg }"
									alt="Avatar">
							</c:if>
							<c:if test="${shies.myimg == null}">
								<img class="avatar-32"
									src="http://magazine.nicktv.it/wp-content/uploads/sites/11/2016/09/Spongebob-Finalmente-Si-Mangia.gif"
									alt="Avatar">
							</c:if>
							<strong> <a title="Full Name" href="<%=request.getContextPath() %>/mypage.shy?idx=${shies.fk_idx }"> 
							<span style="font-size: 12pt; margin: 0; color: black;"> <c:if test="${shies.name!=null }">
	                ${shies.name }
	                </c:if> <c:if test="${shies.name==null }">
                  	${shies.email }
                  	</c:if>

								</span>
							</a>
							</strong>
							<c:if test="${shies.shypay!=null }">
							${shies.shypay}<br>
							</c:if>
							
							 <span>${shies.sdatedtime} </span>&nbsp;&nbsp;
							
							<c:if test="${shies.stagfollow!=null }">
							<br>${shies.stagfollow} 님과 함께
							</c:if>
							<br> 
							
						</p>
					</header>

				
					<p class="subinfo">
						<c:if test="${shies.shyplace!=null }">
							
						<a class="location" title="Location" href="/shy/place.shy?geoidx=${shies.geoseq}"> <span style="color: #54c987;">${shies.shyplace }</span>에서
							shy </a>
						</c:if>
					</p>

					<div id="scontent">
						<p id="hashcheck${status.index}" class="hashcheck">${shies.scontent}</p>
					</div>
					
					<footer>
				        <p>
				         <a class="bt-love" title="Love" onclick="goLike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')" id="bt-love${shies.snsno }"> Love </a> 
						 <a class="bt-love_chg" title="Love" id="love${shies.snsno }" onclick="goUnlike('${sessionScope.loginuser.idx }','${shies.snsno }','snsno')"> </a> 
						 <a class="bt-share" title="Share" href="#"> 공유하기 </a> 
						 <a href="javascript:openComment(${shies.snsno});" class="bt-comment" title="Comment" id="comment${shies.snsno}"> </a>
				        </p>
				      </footer>
				</div>

				<!--new댓글창  -->



				<div id="commentbox${shies.snsno }" class="shy_comments-app"
					style="margin-top: 0; display: none;">
					<!--ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl"  -->




					<!-- Comments List -->

					<div class="shy_comments" id="dd_shycomment">
						<input type="hidden" name="snsno" id="snsno${shies.snsno}"
							value="${shies.snsno}" />
						<!-- Comment -->

						<!-- Comment - Dummy -->
						<div id="shy_comment_ajax${shies.snsno}" class="shy_comment">
							<%-- 
							<!-- for each 돌리는 div  -->
							<!-- Comment Avatar -->
							<div class="shy_comment-avatar">
								<img src="" alt="사진 읎어용">
							</div>

							<!-- Comment Box -->
							<div class="shy_comment-box">
								<div class="shy_comment-text">짧은 댓글 test1
									${cmtVO.cmtcontent}</div>
								<div class="shy_comment-footer">
									<div class="shy_comment-info">
										<span class="shy_comment-author"> <a href="">유저명</a>
										</span> <span class="shy_comment-date">댓글작성시간</span>
									</div>

									<div class="shy_comment-actions">
										<a href="#"><i class="fa fa-exclamation-triangle fa-2x"
											aria-hidden="true"></i></a>
									</div>
								</div>


							</div>

 --%>

						</div>
						<!-- for each 돌리는 div끝  -->
						
					<!-- Form -->
					<div class="shy_comment-form">
						<!-- Comment Avatar -->
						<div class="shy_comment-avatar">
							<img
								src="<%=request.getContextPath() %>/resources/images/shydb/${loginuser.myimg }"
								style="display: block; height: 100%; width: 100%;">
						</div>

						<form class="shy_form" name="insertReplyform" id="insertReplyform">
							<input type="hidden" id="myidx${shies.snsno }"
								value="${loginuser.idx }" />
							<div class="shy_form-row">
								<textarea class="shy_input" id="replycontent${shies.snsno }"
									placeholder="댓글로 이야기를 나눠보세요" required></textarea>
							</div>


							<div class="shy_form-row">
								<input type="button" id="replybutton" value="올리기"
									onclick="insertReply(${shies.snsno});" />
							</div>
						</form>
					</div>

						<!-- <div align="center">
							<a class="button" href="#" style="color: white;"> read more </a>
						</div> -->
					</div>
				</div>
				<!--new댓글창 end  -->

				<!-- end .flex-content-->
			</article>


			<!-- post foreach 마무리  -->
		</c:forEach>
	</c:if>

<c:if test="${shies==null}">
  	<div id="dd__container" style="margin-top: 50px;">



		<div id="dd__outer">

			<div id="dd__inner" align="CENTER">
				<img
					src="<%=request.getContextPath()%>/resources/images/ddung/heartlogo.png" />
			
				<div >
				안녕하세요? 새 글을 써 보시거나, 친구를 추가해 보세요!
					<a href="tutorial.shy" class="dd_button dd_button5">사용법 보기</a>
					
				</div>



			</div>
		</div>
	</div>
  	
  	
  </c:if>

<c:if test="${shies!=null}">
	<div align="center">
		<a class="button" href="#" style="color: white;"> 더 읽기 </a><br> <br>
		=======
	</div>
	</c:if>


	</main>
	<!-- 
  <article class="card-60 social">
    <figure>
      <a class="ribbon-buy popular" href="#" title="Popular">
         Hot
      </a>
      <img src="https://source.unsplash.com/ZFQh_gS5TJc/800x600" alt="La Sagrada Familia">
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
           <a class="button follow" href="#" title="Follow">
               Follow
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span>8 mins ago &middot; Barcelona</span>
        </p>
      </header>
      <h2>
Sagrada Familia .card-60
      </h2>
      <p>
        Figure 60%. Content 40%. Excerpt. 2-3 lines recommended. The style of la Sagrada Família is variously likened to Spanish Late Gothic, Catalan Modernism and to Art Nouveau or Catalan Noucentisme.
      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="#">
               Love
            </a>
            
            <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a class="bt-comment" title="Comment" href="#">
               Comment
            </a>
        </p>
      </footer>
    </div>
    end .flex-content
  </article>
  
  <article class="card-50">
    <figure>
      <a href="" title="Buy">
      <span class="ribbon-buy">
         -20%
      </span>
        
      </a>
       
          <img src="https://source.unsplash.com/XPvhzVIeETM/800x600" alt="Tapas"> 
    </figure>
    end figure
    <div class="flex-content">
       <h2>
Tapas Deluxe .card50 odd even
      </h2>
       <p class="subinfo">
         <a class="button" href="#" title="Book a table">
               Book a table
            </a>
             <a class="location" title="Location" href="">
               Cromwell Rd, London SW7 5BD.
         </a>
   
        </p>
      <ul>
        <li>
          <strong title="Type">Type:</strong>
          Spanish
        </li>
                        <li><strong title="Rating">Rating:</strong> 8/10</li>
                        <li><strong title="Price">Price:</strong> $30 and under</li>
                     </ul>
       <p>
        Tapas are a wide variety of appetizers, or snacks, in Spanish cuisine. They may be cold (such as mixed olives and cheese) or hot (such as chopitos, which are battered, fried baby squid). In select bars in Spain, tapas have evolved into an entire, sophisticated cuisine.

      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="">
               Love
            </a>
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
          <a class="bt-comment" title="Comment" href="">
               Comment
            </a>
        </p>
      </footer>

      
    </div>
    end .flex-content
  </article>
  <article class="card-40 social">
    <figure>
      <a class="ribbon-buy popular" href="#" title="Popular">
         Hot
      </a>
      <a href="/news/international/japan"><img src="https://source.unsplash.com/2TlAsvhqiL0/800x600" alt="Woman waiting metro"></a>
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
          <a class="button" href="#" title="Share">
               Share
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span><a href="" title="Permalink">8 mins ago</a> &middot; <a href="" title="258 comments">258 comments</a></span>
        </p>
      </header>
      <a href=""><h2>
        The Tokyo Mistery .card-40
      </h2>
      <p>
         Excerpt. 2-3 lines recommended. Police are investigating the theft of hundreds of straps used by standing passengers on the Tokyo Metro system, it's been reported. Tokyo Metro Co. is providing a free smartphone application to help foreigners navigate the capital's subway system.
      </p></a>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="">
               Love
            </a>
          <a class="bt-share" title="Share" href="#">
               Share
            </a>
         
               <span class="bt-comment" title="Comment">Comment</span>
         
            
        </p>
      </footer>
    </div>
    end .flex-content
  </article>
  <article class="card-60 social">
    <figure>
      
      <img src="https://source.unsplash.com/yvx7LSZSzeo/800x600" alt="Woman playing guitar">
    </figure>
    end figure
    <div class="flex-content">
      <header>
        <p class="user">
                <a class="button followed" href="#">
               Followed
            </a>
          <img class="avatar-32" src="http://jlantunez.com/imgs/avatar.jpg" alt="Avatar">
          <strong>
               <a title="Full Name" href="#">
                  username
               </a>
            </strong>
          <span>32 mins ago &middot; London</span>
        </p>
      </header>
      <h2>
         Card-60 Fender Stratocaster
      </h2>
      <p>
        2-3 lines recommended. The culture within an organization is an essential part for success. The Fender Stratocaster is a model of electric guitar designed in 1954 by Leo Fender, Bill Carson, George Fullerton, and Freddie Tavares.
      </p>
      <footer>
        <p>
          <a class="bt-love" title="Love" href="#">
               23
            </a>

            <a class="bt-share" title="Share" href="#">
               Share
            </a>
            
                <a class="bt-comment" title="Comment">
               4
            </a>
            
        </p>
      </footer>
    </div>
    end .flex-content
    
    
    

    
  </article>
 -->







	<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->

	<!-- <script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script> -->

</body>
</html>