<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>
<head>
<title>상품등록</title>

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
	//Form 유효성 검증
	
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;
	
	
	
	if(name == '' || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == '' || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == '' || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == '' || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
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
	      		 <h3>상품 등록</h3>
	   		 </div>		
		</c:if>
		<c:if test = "${!empty product}">
			 <div class="page-header text-info">
	      		 <h3>상품 등록 확인</h3>
	   		 </div>	
		</c:if>
		

<form name="detailForm" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">상품 이름</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="prodName" placeholder="상품이름" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.prodName}
					</c:if>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">상품상세정보</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="prodDetail" placeholder="상품상세정보" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.prodDetail} 
					</c:if>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">제조 일자</label>&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
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
    <label for="exampleInputEmail1">가격</label>
    				<c:if test = "${empty product}">
						 <input type="text" class="form-control" name="price" placeholder="가격" 
    						style="width: 300px;" maxLength="20">
					</c:if>
					<c:if test = "${!empty product}">
						${product.price}
					</c:if>
  </div>



  <div class="form-group">
    <label for="exampleInputFile">상품 이미지</label>
    	<c:if test="${empty product}">
			<input		type="file" name="file" class="ct_input_g" 
							style="width: 250px; height: 30px" maxLength="20" />
		</c:if>	
		<c:if test="${!empty product}">
			<img src="/images/uploadFiles/${product.fileName }" width="200" height="200" align="absmiddle"/>
		</c:if>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputFile">상품재고</label>
    		<c:if test="${empty product}">
				<input	type="text" name="quantity" class="ct_input_g" 
						style="width: 50px; height: 19px" maxLength="20" />&nbsp;개
			</c:if>
			<c:if test="${!empty product}">
				${product.quantity }&nbsp;개
			</c:if>
  </div>
  
  
  
  
  
  <a href= ${!empty product ? "/product/listProduct?menu=manage" : "javascript:fncAddProduct()"}>
  <button type="button" class="btn btn-info">${!empty product ? "확인" : "등록"}</button>
  </a>
  

  <a href=${!empty product ?"/product/addProductView.jsp":"/product/listProduct?menu=manage"}>
  <button type="button" class="btn btn-info">${!empty product ? "추가등록" : "취소"}</button>
  </a>
  
  
 
</form>


</div>


	
</body>
</html>