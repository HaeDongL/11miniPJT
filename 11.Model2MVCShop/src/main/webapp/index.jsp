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
        
        h2#time{
        	color:red;
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
        <h3>가장 기억에 남는 오류</h3>
         <p>Bean named 'purchaseDaoImpl' is expected to be of type </p>
         <p>'com.model2.mvc.service.purchase.impl.PurchaseDaoImpl' </p>
         <p>but was actually of type 'com.sun.proxy.$Proxy27'</p>
         <br/>
         <p>위의 오류는 TargetObject와 advice가 Weaving될때 생성되었던 DynamicProxy의</p>
         <p>데이터 타입이 TargetObject의 데이터 타입이 아니여서 생긴 오류였다.</p>
         <p>나는 purchaseDaoImpl를 인젝션 받기위해 데이터 타입을 purchaseDaoImpl로 두고 있었다.</p>
         <p>하지만 DynamicProxy가 만들어질때 TargetObject가 어떤 interface의 구현체라면...</p>
         <p>TargetObject의 데이터 타입이 아닌 Interface타입으로 생성이 된다고 한다.</p>
         <p>따라서 이 오류는 구현체 데이터 타입에 Interface타입을 인젝션하고 있어서 생긴오류였다.</p>
         <h2 id="time">이 오류로 인해 소모한 시간 : 약 4시간...</h2>
         
  	 </div>
	
	
</body>

</html>