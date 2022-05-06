
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");
	System.out.println("updatePurchaseView.jsp purchase : "+purchase);
%><%--������ �̵� Ȯ�ο� --%>

<html>
<head>

<title>�������� ����</title>
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
<script type="text/javascript" src="../javascript/calendar.js">
</script>
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	<script type="text/javascript">
   		$(function(){
   			$("a button.btn.btn-success").on("click",function(){
   				$("form[name='updatePurchase']").submit();
   			});
   		});
   	</script>
</head>


<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<form name="updatePurchase" method="post"	action="/purchase/updatePurchase">
<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" />
<input type="hidden" name="tranNo" value="${purchase.tranNo }" />;




<div class="container">
	
	
		<div class="page-header text-info">
	       <h3>������������</h3>
	    </div>
	
		<table class="table table-bordered">
			<tr>
				<td width="200">�����ھ��̵�</td>
				<td>${purchase.buyer.userId }</td>
			</tr>
			<tr>
				<td width="200">���Ź��</td>
				<td>
					<select 	name="paymentOption" 	class="ct_input_g"
							maxLength="20">
				<c:if test="${requestScope.purchase.paymentOption == 1 }">
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</c:if>
				<c:if test="${purchase.paymentOption == 2 }">
					<option value="1">���ݱ���</option>
					<option value="2" selected="selected">�ſ뱸��</option>
				</c:if>
			</select>
				</td>
			</tr>
			<tr>
				<td width="200">�������̸�</td>
				<td>
					<input type="text" name="receiverName" value="${purchase.receiverName }" />
				</td>
			</tr>
			<tr>
				<td width="200">�����ڿ���ó</td>
				<td>
					<input type="text" name="receiverPhone" value="${purchase.receiverPhone }" />
				</td>
			</tr>
			<tr>
				<td width="200">�������ּ�</td>
				<td>
					<input type="text" name="receiverAddr" style="width:400px;" value="${purchase.receiverAddr }" />
				</td>
			</tr>
			<tr>
				<td width="200">���ſ�û����</td>
				<td>
					<input 	type="text" name="receiverRequest"
										 maxLength="20" value="${purchase.receiverRequest }">
				</td>
			</tr>
			<tr>
				<td width="200">����������</td>
				<td><input type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
							onclick="show_calendar('document.updatePurchase.receiverDate', document.updatePurchase.receiverDate.value)"/></td>
				
			</tr>
			
			<tr>
				<td width="200">���� ����</td>
				<td><select name="buyQuantity">
				<option value="${purchase.buyQuantity }">${purchase.buyQuantity }</option>
				<c:forEach var="i" begin="1" step="1" end="${product.quantity + purchase.buyQuantity}">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			��</td>
				
			</tr>
			
			
				
			
		</table>
		<a href="#">
		<button type="button" class="btn btn-success">����</button>
		</a>
		
		<a href="javascript:history.go(-1)">
		<button type="button" class="btn btn-warning">���</button>
		</a>
		
	</div>



</form>

</body>
</html>