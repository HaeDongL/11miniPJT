
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
<title>���ſ�û��ȸ</title>
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

<form name="detailForm" action="/purchase/requestPurchaseList" method="post">
<input type="hidden" name="menu" value="manage" />


<div class="container">
	
	<div class="page-header text-info">
	       <h3>���ſ�û ���</h3>
	    </div>
	
<table class="table table-striped">

	<thead>
		<tr>
			<th>No</th>
			<th>ȸ��ID</th>
			<th>ȸ����</th>
			<th>��ȭ��ȣ</th>
			<th>��ǰ�̸�</th>
			<th>���Ű���</th>
			<th>����ݾ�</th>
			<th>�����Ȳ</th>
		</tr>
	</thead>
	
	<c:set var="count" value="0"/>
	<c:forEach var="purchase" items="${list}"><%--StartFor --%>
	
	<tr class="ct_list_pop">
		<td align="center">
		<c:set var="count" value="${count+1}"/>
			<a href="/purchase/getPurchase?tranNo=${purchase.tranNo }">${count}</a>
		</td>
		
		<td align="left">
			<a href="/user/getUser?userId=${purchase.buyer.userId }">${purchase.buyer.userId }</a>
		</td>
		
		<td align="left">${purchase.receiverName }</td>
		
		<td align="left">${purchase.receiverPhone }</td>
		
		<td align="left">${purchase.purchaseProd.prodName }</td>
		
		<td align="left">${purchase.buyQuantity }</td>
		
		<td align="left">${purchase.buyQuantity * purchase.purchaseProd.price }</td>
		
		
		<c:if test="${purchase.tranCode == 1}">
			<td align="left">���ſϷ�&nbsp;<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&menu=${menu}&tranCode=2">����ϱ�</a></td> 
			</c:if>
			<c:if test="${purchase.tranCode == 2}">
			<td align="left">�����</td> 
			</c:if>
			<c:if test="${purchase.tranCode == 3}">
			<td align="left">��ۿϷ�</td> 
		</c:if>
		
		
		
			
		
	</tr>
	</c:forEach><%--end For --%>


</table>

</div>



<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		   
	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			�� ����
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
	<% } %>

	<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
	<% 	}  %>
	
	<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			���� ��
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
	<% } %>
	 /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	
		<jsp:include page="../common/pageNavigator_new.jsp" />	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>


</body>
</html>
