
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");
	System.out.println("addPurchaseResultView.jsp purchaseVO : "+purchase);
%><%--������ �̵� Ȯ�ο� --%>




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

<div class="page-header text-info">
	       <h3>������ ���� ���Ű� �Ǿ����ϴ�.</h3>
</div>


<table class="table table-bordered">
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			<c:if test="${purchase.paymentOption == 1 }">
				���ݱ���
			</c:if>
			<c:if test="${purchase.paymentOption == 2 }">
				�ſ뱸��
			</c:if>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.receiverAddr }</td>
		<td></td>
	</tr>
	<tr>
		<td>���ſ�û����</td>
		<td>${purchase.receiverRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.receiverDate }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ű���</td>
		<td>${purchase.buyQuantity }��</td>
		<td></td>
	</tr>
	<tr>
		<td>����ݾ�</td>
		<td>${purchase.purchaseProd.price * purchase.buyQuantity }��</td>
		<td></td>
	</tr>
</table>


</body>
</html>