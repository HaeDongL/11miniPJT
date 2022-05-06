<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");
	System.out.println("getPurchase.jsp Purchase : "+purchase);
%>


<html>
<head>
<title>���Ż���ȸ</title>

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

	<style>
        body {
            padding-top : 70px;
        }
   	</style>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />



<div class="container">
	
	
		<div class="page-header text-info">
	       <h3>���Ż���ȸ</h3>
	    </div>
	
		<table class="table table-bordered">
			<tr>
				<td width="200">��ǰ��ȣ</td>
				<td>${purchase.purchaseProd.prodNo }</td>
			</tr>
			<tr>
				<td width="200">�����ھ��̵�</td>
				<td>${purchase.buyer.userId }</td>
			</tr>
			<tr>
				<td width="200">���Ź��</td>
				<td>
					<c:if test="${purchase.paymentOption == 1}">
						���ݱ���
					</c:if>
		
					<c:if test="${purchase.paymentOption == 2}">
						�ſ뱸��
					</c:if>
				</td>
			</tr>
			<tr>
				<td width="200">�������̸�</td>
				<td>${purchase.receiverName }</td>
			</tr>
			<tr>
				<td width="200">�����ڿ���ó</td>
				<td>${purchase.receiverPhone }</td>
			</tr>
			<tr>
				<td width="200">�������ּ�</td>
				<td>${purchase.receiverAddr }</td>
			</tr>
			<tr>
				<td width="200">���ſ�û����</td>
				<td>${purchase.receiverRequest }</td>
			</tr>
			<tr>
				<td width="200">��������</td>
				<td>${purchase.receiverDate }</td>
			</tr>
			
			<tr>
				<td width="200">�ֹ���</td>
				<td>${purchase.orderDate }</td>
			</tr>
			
			<tr>
				<td width="200">���Լ���</td>
				<td>${purchase.buyQuantity }&nbsp;��</td>
			</tr>
			
		</table>
		
		<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo }&prodNo=${purchase.purchaseProd.prodNo}">
		<button type="button" class="btn btn-success">����</button>
		</a>

		<a href="/purchase/listPurchase">
		<button type="button" class="btn btn-danger">Ȯ��</button>
		</a>
</div>




</body>
</html>