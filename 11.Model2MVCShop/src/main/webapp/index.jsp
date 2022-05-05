<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        body {
            padding-top : 70px;
        }
        
   	</style>
   	
   	<script type="text/javascript">
   		$(function(){
   			$("h2.h2group").css("color","#00BFFF");
   			
   			$("#bestProduct_01").on("click",function(){
   				$(self.location).attr("href","/product/getProduct?prodNo=10000");
   			});
   			
   			$("#bestProduct_02").on("click",function(){
   				$(self.location).attr("href","/product/getProduct?prodNo=10001");
   			});
   			
   			$("#bestProduct_03").on("click",function(){
   				$(self.location).attr("href","/product/getProduct?prodNo=10003");
   			});
   			
   		});
   	</script>
  
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<c:if test = "${empty user }">
		<jsp:include page="/layout/beforeLoginToolbar.jsp" />
	</c:if>
	<c:if test = "${!empty user }">
		<jsp:include page="/layout/toolbar.jsp" />
	</c:if>
	
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div class="container ">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
					  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			  <%--bestProduct 로 부터 받은 데이터는 prodNo 와 image파일 --%>
			  
			    <div class="item active">
			     	<img id="bestProduct_01" src="/images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" 
			     	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">인기 제품</h2>
			      </div>
			    </div>
			    
			    
			    <div class="item">
			      	<img id="bestProduct_02" src="/images/uploadFiles/AHlbAAAAvetFNwAA.jpg" 
			      	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">인기 제품</h2>
			      </div>
			    </div>
			    
			     <div class="item">
			      	<img id="bestProduct_03" src="/images/uploadFiles/AHlbAAAAve1WwgAC.jpg" 
			      	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">인기 제품</h2>
			      </div>
			    </div>
			    
			  </div>

  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <h3>나폴레옹은 이렇게 말했다.</h3>
        <p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p>
  	 	<h3>"... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."</h3>
         <h3>혜광스님</h3>
         <p>행복한 삶의 비결은.</p>
         <p>좋아하는 일을 하는 것이 아리라,</p>
         <p>지금 하는 일을 좋아하는 것입니다.</p>
         <p>로그인 전후 확인용.</p>
  	 </div>
	
	
</body>

</html>