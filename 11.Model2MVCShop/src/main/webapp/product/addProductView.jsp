<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>
<head>
<title>��ǰ���</title>

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

<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
	
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;
	
	
	
	if(name == '' || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == '' || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == '' || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == '' || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	document.detailForm.action='/product/addProduct';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
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

<div class="container">
		
		<c:if test = "${empty product}">
			 <div class="page-header text-info">
	      		 <h3>��ǰ ���</h3>
	   		 </div>		
		</c:if>
		<c:if test = "${!empty product}">
			 <div class="page-header text-info">
	      		 <h3>��ǰ ��� Ȯ��</h3>
	   		 </div>	
		</c:if>
		

<form name="detailForm" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">��ǰ �̸�</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="prodName" placeholder="��ǰ�̸�" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.prodName}
					</c:if>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">��ǰ������</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="prodDetail" placeholder="��ǰ������" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.prodDetail} 
					</c:if>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">���� ����</label>&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
								onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
								
    				<c:if test="${empty product}">
							<input type="text" name="manuDate" readonly="readonly" class="form-control"  
								style="width: 300px;"	maxLength="10" minLength="6"/>
								
					</c:if>
					<c:if test="${!empty product}">
						${product.manuDate}
					</c:if>
  </div>
  

  <div class="form-group">
    <label for="exampleInputEmail1">����</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="price" placeholder="����" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.price}
					</c:if>
  </div>



  <div class="form-group">
    <label for="exampleInputFile">��ǰ �̹���</label>
    	<c:if test="${empty product}">
			<input		type="file" name="file" class="ct_input_g" 
							style="width: 250px; height: 30px" maxLength="20" />
		</c:if>	
		<c:if test="${!empty product}">
			<img src="/images/uploadFiles/${product.fileName }" width="200" height="200" align="absmiddle"/>
		</c:if>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputFile">��ǰ���</label>
    		<c:if test="${empty product}">
				<input	type="text" name="quantity" class="ct_input_g" 
						style="width: 50px; height: 19px" maxLength="20" />&nbsp;��
			</c:if>
			<c:if test="${!empty product}">
				${product.quantity }&nbsp;��
			</c:if>
  </div>
  
  
  
  
  
  <a href= ${!empty product ? "/product/listProduct?menu=manage" : "javascript:fncAddProduct()"}>
  <button type="button" class="btn btn-info">${!empty product ? "Ȯ��" : "���"}</button>
  </a>
  

  <a href=${!empty product ?"/product/addProductView.jsp":"/product/listProduct?menu=manage"}>
  <button type="button" class="btn btn-info">${!empty product ? "�߰����" : "���"}</button>
  </a>
  
  
 
</form>


</div>


	
</body>
</html>