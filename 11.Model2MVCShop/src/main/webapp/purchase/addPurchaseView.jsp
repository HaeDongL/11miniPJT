
<%@page import="com.model2.mvc.service.domain.Product"%>
<%@page import="com.model2.mvc.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%--
<%
	User user = (User)request.getAttribute("user");//??? ������
	Product product = (Product)request.getAttribute("product");
	System.out.println("addPurchaseView user.toString : "+user);
	System.out.println("addPurchaseView product.toString : "+product);
	System.out.println("addPurchaseView product.getProdNo:"+product.getProdNo());
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
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

function fncAddPurchase() {
	document.addPurchase.submit();
}

</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<form name="addPurchase" method="post" action="/purchase/addPurchase">

<input type="hidden" name="prodNo" value="${requestScope.product.prodNo }" />
<input type="hidden" name="price" value="${product.price }" />
<input type="hidden" name="buyerId" value="${requestScope.user.userId }" />

<div class="container">
	
	
		<div class="page-header text-info">
	       <h3>��ǰ ����</h3>
	    </div>
	
		<table class="table table-bordered">
			<tr>
				<td width="200">��ǰ��ȣ</td>
				<td>${product.prodNo }</td>
			</tr>
			<tr>
				<td width="200">��ǰ��</td>
				<td>
					${product.prodName }
				</td>
			</tr>
			<tr>
				<td width="200">��ǰ������</td>
				<td>
					${product.prodDetail }
				</td>
			</tr>
			<tr>
				<td width="200">��������</td>
				<td>
					${product.manuDate }		
				</td>
			</tr>
			<tr>
				<td width="200">����</td>
				<td>
					${product.price }
				</td>
			</tr>
			<tr>
				<td width="200">�������</td>
				<td>
					${product.regDate }
				</td>
			</tr>
			<tr>
				<td width="200">�����ھ��̵�</td>
				<td>
					${user.userId }
				</td>
			</tr>
			<tr>
				<td width="200">���Ź��</td>
				<td>
					<select 	name="paymentOption"	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
						<option value="1" selected="selected">���ݱ���</option>
						<option value="2">�ſ뱸��</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="200">�������̸�</td>
				<td>
					<input type="text" name="receiverName" value="${user.userName }" />
				</td>
			</tr>
			
			<tr>
				<td width="200">�����ڿ���ó</td>
				<td>
					<input type="text" name="receiverPhone" value="${user.phone }" />
				</td>
			</tr>
			
			<tr>
				<td width="200">�������ּ�</td>
				<td>
					<input type="text" name="receiverAddr" style="width:400px;" value="${user.addr}" />
				</td>
			</tr>
			
			<tr>
				<td width="200">���ſ�û����</td>
				<td>
					<input type="text" name="receiverRequest" />
				</td>
			</tr>
			
			<tr>
				<td width="200">����������</td>
				<td>
					<input 	type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
							style="width: 185px; height: 20px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.addPurchase.receiverDate', document.addPurchase.receiverDate.value)"/>
				</td>
			</tr>
			
			<tr>
				<td>���� ���� </td>
				<td>
					<select name="buyQuantity">
						<option>��������</option>
						<c:forEach var="i" begin="1" step="1" end="${product.quantity }">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					��
				</td>
			</tr>
		</table>
		
		<a href="javascript:fncAddPurchase();">
		<button type="button" class="btn btn-info">����</button>
		</a>
		<a href="javascript:history.go(-1)">
		<button type="button" class="btn btn-danger">���</button>
		</a>
	</div>


</form>

</body>
</html>