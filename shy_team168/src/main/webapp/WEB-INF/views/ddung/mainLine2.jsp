<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<!-- SWAL -->


<style type="text/css">

#oneway, #roundway
{
   border : 2px solid #639EB0;
   font-size: large;
   text-align: center;
   height: 100px;
   padding-top : 20px;
   border-radius: 8px;
   /* font-weight: bold; */
   font-size: 25pt;
   margin: 1%; 
   width : 96%;
   
   background-color: white;
}


.left, .right
{
   width : 96%;
   border: 2px solid #639EB0;
   height: 100px;
   vertical-align: middle;
   padding-top : 20px;
   border-radius: 8px;
   margin: 1%; 
   
   background-color: white;
   opacity: 30%;
}

#leftside, #rightside
{
   border : 0px solid #639EB0;
   float: left;
   width : 50%;
   text-align: center;
   height: 100%;
   vertical-align: middle;
}

.floatleft
{
   float: left;
   text-align: center;
}

.deselected {

   color: #cccccc;
    background: gray; /* For browsers that do not support gradients */    
    background: -webkit-linear-gradient(left, white , #cccccc); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(right, white, #cccccc); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(right, white, #cccccc); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to right, white , #cccccc); /* Standard syntax (must be last) */
   
}

.departure, .singledeparture, .doubledeparture, .arrival, .departuredate, .traintype, .trainclass
{
   cursor: pointer;
}

/*모달*/
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
   
   margin-top:10%;
   top: 30%;
   align:center;
   width: 40%;
   height: 70%;
/*    padding: 16px; */
   border: 2px solid #639EB0;
   border-radius : 20px;
   background-color: white;
   overflow: auto;   
}

</style>



<script type="text/javascript">

// 출발지 선택 모달
function picdeparture()
{   location.href="#picdeparture";   }

// 도착지 선택 모달
function picarrival()
{   location.href="#picarrival";   }

function finishpic()
{   location.href="#";   }


</script>

<!-- content 전체 div -->
<div align="center" style="border: solid gold 0px; height: 80%; ">

      
   <!-- 전체 div -->
   <div style="width:60%; margin: 0 auto; border: solid #639EB0 0px; min-height: 400px; " align="center">
   
   
      <!-- 왼쪽 메뉴 -->
      
      
      
         
         <!-- 출발지, 도착지 선택 -->
         <div style="clear: both; margin-bottom : 0%; width : 97%;">
         
            <div class="floatleft left departure" style="width:48%;" 
                  id = "choosedeparture" onclick="picdeparture();" >
               
               
         
            </div>
            <div class="floatleft left arrival" style="width:48%; margin-left: 2%; margin-right: 0%;"
                  id="choosedeparture" onclick="picarrival();">
              
            </div>
            
         </div>
         
    
      
      
      
      
      
      
      
  
      
   </div>



    
</div>


<!-- 출발지 선택 모달창 -->            
   <div class="white_content" id="new_shynow" align="center">
        <div align="center">                        
           <div style="clear: both; width : 96%;">
           
        <!--     <div class="floatleft left" style="width:48%; border: 5px solid #639EB0; cursor: pointer; margin-left: 0%;" 
                id="choosedeparture" onclick="picdeparture();">
               출발지 선택   <br/>
               <span id = "departurefromD" style="font-size: large;"></span>
            </div> -->
        <!--     
            <div class="floatleft left" style="width:48%; margin-left: 3%; margin-right: 0%; cursor: pointer;"
               id="choosearrival" onclick="picarrival();">
               도착지 선택   <br/>
               <span id = "arrivalfromD" style="font-size: large;"></span>
               
            </div> -->
            
         </div>
         
         
         
       
      
      
         
            
           
           <div id = "dclose" onclick="finishpic();"
                 style="clear: both; cursor: pointer; font-size: 20; color: white; 
                 font-weight: bold; background-color: #639EB0; margin-top: 3%; width: 96%;" align="center" class="btn" >닫기</div>

        </div>
    </div>