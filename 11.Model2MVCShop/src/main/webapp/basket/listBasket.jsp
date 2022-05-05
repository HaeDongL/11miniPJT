
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

List<Purchase> list= (List<Purchase>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");
Search search = (Search)request.getAttribute("search");

%>
<html>
<head>
<title>구매 목록조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>

<style>
        body {
            padding-top : 70px;
        }
   	</style>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />

<form name="detailForm" action="/basket/listBasket" method="post">

<div class="container">

	<div class="page-header text-info">
	       <h3>장바구니 목록조회</h3>
	    </div>
<table class="table table-striped">


	<thead>
		<tr>
			<th>No</th>
			<th>상품명</th>
			<th>가격</th>
			<th>장바구니에 추가한 시간</th>
			<th>장바구니 제거</th>
		</tr>
	</thead>
	
	<c:set var="count" value="0"/>
	<c:forEach var="basket" items="${list}"><%--StartFor --%>
	
	<tr class="ct_list_pop">
		<td align="center">
		<c:set var="count" value="${count+1}"/>
			${count}
		</td>
		
		<td align="left">
			<a href="/product/getProduct?prodNo=${basket.prodNo }&menu=search">${basket.prodName }</a>
		</td>
		
		<td align="left">${basket.price }</td>
		
		
		<td align="left">${basket.regDate }</td>
		
		
		<td align="left">
			<a href="/basket/deleteBasket?basketNo=${basket.basketNo }">장바구니에서 제거</a>
		</td>
		
		
		
		<td align="left">
			
		</td>
	</tr>
	</c:forEach><%--end For --%>
	


</table>

</div>



<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
		<jsp:include page="../common/pageNavigator_new.jsp" />	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>


</body>
</html>
