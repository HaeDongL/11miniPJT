<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=EUC-KR"%>


<%
	Product product = (Product)request.getAttribute("product");
	System.out.println("updateProductView.jsp product : "+product);
	String menu = (String)request.getAttribute("menu");
	System.out.println("updateProductView.jsp menu : "+menu);
%><%--데이터 이동 확인용 --%>


<html>
<head>
<title>상품수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
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

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
	//document.detailForm.action='/product/updateProduct?prodNo=${product.prodNo }&menu=${menu}';
	//document.detailForm.submit();
	$("form[name='detailForm']").attr("method","POST").attr("action","/product/updateProduct").
	attr("enctype","multipart/form-data").submit();
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
<form name="detailForm" >

<input type="hidden" name="prodNo" value="${product.prodNo }" />
<input type="hidden" name="menu" value="${menu }" />




	<div class="container">
	
	
		<div class="page-header text-info">
	       <h3>상품수정</h3>
	    </div>
	
		<table class="table table-bordered">
			<tr>
				<td width="200">상품번호</td>
				<td>${product.prodNo }</td>
			</tr>
			<tr>
				<td width="200">상품명</td>
				<td>
					<input 	type="text" name="prodName"
										 maxLength="20" value="${product.prodName }">
				</td>
			</tr>
			<tr>
				<td width="200">상품이미지</td>
				<td>
				<input		type="file" name="file" class="ct_input_g" 
							style="width: 250px; height: 30px" maxLength="20" />
				<img src="/images/uploadFiles/${product.fileName }" width="200" height="200" align="absmiddle"/></td>
			</tr>
			<tr>
				<td width="200">상품상세정보</td>
				<td>
					<input 	type="text" name="prodDetail"
										 maxLength="20" value="${product.prodDetail }">
				</td>
			</tr>
			<tr>
				<td width="200">제조일자</td>
				<td>
					<input type="text" name="manuDate" readonly="readonly" class="form-control"  
								style="width: 300px;"	maxLength="10" minLength="6"/>&nbsp;
								<img src="../images/ct_icon_date.gif" width="15" height="15" 
								onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
								
				</td>
			</tr>
			<tr>
				<td width="200">가격</td>
				<td>
					<input 	type="text" name="price"
										 maxLength="20" value="${product.price }">
				</td>
			</tr>
			<tr>
				<td width="200">남은수량</td>
				<td><input 	type="text" name="quantity"
										 maxLength="20" value="${product.quantity }"> &nbsp;개</td>
				
			</tr>
		</table>
		<a href="javascript:fncAddProduct();">
		<button type="button" class="btn btn-success">수정</button>
		</a>
		
		<a href="javascript:history.go(-1)">
		<button type="button" class="btn btn-warning">취소</button>
		</a>
		
	</div>



</form>

</body>
</html>