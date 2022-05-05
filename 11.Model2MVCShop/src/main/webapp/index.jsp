<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
			  <%--bestProduct �� ���� ���� �����ʹ� prodNo �� image���� --%>
			  
			    <div class="item active">
			     	<img id="bestProduct_01" src="/images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" 
			     	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">�α� ��ǰ</h2>
			      </div>
			    </div>
			    
			    
			    <div class="item">
			      	<img id="bestProduct_02" src="/images/uploadFiles/AHlbAAAAvetFNwAA.jpg" 
			      	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">�α� ��ǰ</h2>
			      </div>
			    </div>
			    
			     <div class="item">
			      	<img id="bestProduct_03" src="/images/uploadFiles/AHlbAAAAve1WwgAC.jpg" 
			      	class="img-responsive center-block" style="width:500px; height:500px;">
			      <div class="carousel-caption">
			        <h2 class="h2group">�α� ��ǰ</h2>
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
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <h3>���������� �̷��� ���ߴ�.</h3>
        <p>"���� ���� ������ ������ ���� �߸� ���� �ð��� �����̴�."</p>
  	 	<h3>"... �庮�� �����ϰ� ������ �ʴ� ������� �ɷ������� �����մϴ�. �庮��. ����� �ƴ϶� '�ٸ�' ������� ���߰� �Ϸ��� �ű� �ִ� ��������."</h3>
         <h3>��������</h3>
         <p>�ູ�� ���� �����.</p>
         <p>�����ϴ� ���� �ϴ� ���� �Ƹ���,</p>
         <p>���� �ϴ� ���� �����ϴ� ���Դϴ�.</p>
         <p>�α��� ���� Ȯ�ο�.</p>
  	 </div>
	
	
</body>

</html>