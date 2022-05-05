
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

<form name="detailForm" action="/purchase/listPurchase" method="post">


<div class="container">

	<div class="page-header text-info">
	       <h3>구매 목록조회</h3>
	    </div>
<table class="table table-striped">


	<thead>
		<tr>
			<th>No</th>
			<th>상품명</th>
			<th>구매수량</th>
			<th>결재금액</th>
			<th>배송현황</th>
			<th>정보수정</th>
		</tr>
	</thead>
	
	<c:set var="count" value="0"/>
	<c:forEach var="purchase" items="${list}"><%--StartFor --%>
	
	<tr class="ct_list_pop">
		<td align="center">
		<c:set var="count" value="${count+1}"/>
			${count}
		</td>
		
		<td align="left">
			<a href="/product/getProduct?prodNo=${purchase.purchaseProd.prodNo }">${purchase.purchaseProd.prodName }</a>
		</td>
		
		<td align="left">${purchase.buyQuantity }</td>
		
		<td align="left">${purchase.purchaseProd.price * purchase.buyQuantity }원</td>
		
			
		<td align="left">
		<c:if test="${purchase.tranCode == 1 }">
			현재 구입완료 상태 입니다.
		</c:if>
		<c:if test="${purchase.tranCode == 2 }">
			현재 구입완료 상태 입니다.<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=3">물건도착</a>
		</c:if>
		<c:if test="${purchase.tranCode == 3 }">
			현재 배송완료 상태 입니다.
		</c:if>
		</td>
		
		<c:if test="${purchase.tranCode == 1 }">	
		<td align="left">
			<a href="/purchase/getPurchase?tranNo=${purchase.tranNo }">정보수정</a>
		</td>
		</c:if>
		<c:if test="${purchase.tranCode == 2 || purchase.tranCode == 3 }">	
		<td align="left">
			수정불가
		</td>
		</c:if>
	</tr>
	</c:forEach>
	


</table>

</div>



<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// 		   
	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			◀ 이전
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
	<% } %>

	<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
	<% 	}  %>
	
	<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			이후 ▶
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
	<% } %>
	 /////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
	
		<jsp:include page="../common/pageNavigator_new.jsp" />	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>


</body>
</html>
