
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");
	System.out.println("addPurchaseResultView.jsp purchaseVO : "+purchase);
%><%--데이터 이동 확인용 --%>




<html>
<head>
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
<title>Insert title here</title>

	<style>
        body {
            padding-top : 70px;
        }
   	</style>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />


<div class="container">
<div class="page-header text-info">
	       <h3>다음과 같이 구매가 되었습니다.</h3>
</div>


<table class="table table-bordered">
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo }</td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${purchase.buyer.userId }</td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>
			<c:if test="${purchase.paymentOption == 1 }">
				현금구매
			</c:if>
			<c:if test="${purchase.paymentOption == 2 }">
				신용구매
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<td>${purchase.receiverName }</td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<td>${purchase.receiverPhone }</td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<td>${purchase.receiverAddr }</td>
	</tr>
	<tr>
		<td>구매요청사항</td>
		<td>${purchase.receiverRequest }</td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.receiverDate }</td>
	</tr>
	<tr>
		<td>구매개수</td>
		<td>${purchase.buyQuantity }개</td>
	</tr>
	<tr>
		<td>결재금액</td>
		<td>${purchase.purchaseProd.price * purchase.buyQuantity }원</td>
	</tr>
</table>
	<a href="/product/listProduct?menu=search" >
	<button type="button" class="btn btn-info">상품 리스트 보기</button>
	</a>
</div>

</body>
</html>