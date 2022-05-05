<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Product product = (Product)request.getAttribute("product");
	System.out.println("getProduct.jsp product.toString : "+product);
	String menu=(String)request.getAttribute("menu");
	System.out.println("getProduct menu : "+menu);
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
   	
   	<script type="text/javascript">
   	$(function(){
		$("a#basket:contains('장바구니에 담기')").on("click",function(){
			
			var user = $(this).data("param");
			alert(user);
			if(user == ''){
				alert("로그인 후 이용해 주세요.");
				$(self.location).attr("href","/user/login");
				return;
			}
			
			$.ajax({
				url:"/basket/json/getBasket?prodNo=${product.prodNo}",
				method:"GET",
				dataType:"json",
				headers:{
					"Accept":"application/json",
					"Content-Type":"application/json"
				},
				success:function(JSONData,status){
					var basketProduct = JSONData.basketProduct;
					
					
					if(basketProduct != null){
						alert("${product.prodName}가(이) 이미 장바구니에 있습니다.");
					}else{
						alert("장바구니에 ${product.prodName}가(이) 담겼습니다.");
			   			$(self.location).attr("href","/basket/addBasket?prodNo=${product.prodNo }");
					}
					
					
				}
				
			});
			
   		});
		
		$("button.btn.btn-primary:contains('구매')").on("click",function(){
			var user = $(this).data("param");
			alert(user);
			if(user == ''){
				alert("로그인 후 이용해 주세요.");
				$(self.location).attr("href","/user/login");
			}else{
				$(self.location).attr("href","/purchase/addPurchase?prodNo=${product.prodNo }");
			}
			
		});
   	});
   		
   	
   	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<c:if test="${!empty user }" >
<jsp:include page="/layout/toolbar.jsp" />
</c:if> 
<c:if test="${empty user }" >
<jsp:include page="/layout/beforeLoginToolbar.jsp" />
</c:if> 


	<div class="container">
	
	
		<div class="page-header text-info">
	       <h3>상품상세조회</h3>
	    </div>
	
		<table class="table table-bordered">
			<tr>
				<td width="200">상품번호</td>
				<td>${product.prodNo }</td>
			</tr>
			<tr>
				<td width="200">상품명</td>
				<td>${product.prodName }</td>
			</tr>
			<tr>
				<td width="200">상품이미지</td>
				<td><img src="/images/uploadFiles/${product.fileName }" width="200" height="200" align="absmiddle"/></td>
			</tr>
			<tr>
				<td width="200">상품상세정보</td>
				<td>${product.prodDetail }</td>
			</tr>
			<tr>
				<td width="200">제조일자</td>
				<td>${requestScope.product.manuDate }</td>
			</tr>
			<tr>
				<td width="200">가격</td>
				<td>${product.price }</td>
			</tr>
			<tr>
				<td width="200">등록일자</td>
				<td>${product.regDate }</td>
			</tr>
			<tr>
				<td width="200">남은수량</td>
				<td>${product.quantity }&nbsp;개</td>
			</tr>
		</table>
		
		<c:if test="${menu == 'manage' }">
				<a href="/product/updateProduct?prodNo=${product.prodNo }&menu=${menu}">
				<button type="button" class="btn btn-success">수정</button>
				</a>
		</c:if>
		
		<c:if test="${menu=='search'}">
					
					<c:if test="${product.quantity != 0 }">
						
						<a href="#" data-param="${user.userId }">
						<button type="button" class="btn btn-primary">구매</button>
						</a>
					
					</c:if>
					<c:if test="${product.quantity == 0 }">
						
						<a href="#">
						<button type="button" class="btn btn-primary">재고없음</button>
						</a>
					
					</c:if>
					
			<a href="#" id="basket" data-param="${user.userId }">
			<button type="button" class="btn btn-info">장바구니에 담기</button>
			</a>
					
		</c:if>
		
		
		
		<c:if test="${menu=='search'}">
			<a href="javascript:history.go(-1)">
			<button type="button" class="btn btn-danger">이전</button>
			</a>
		</c:if>
		<c:if test="${menu=='manage'}">
			<a href="/product/listProduct?menu=${menu}">
			<button type="button" class="btn btn-info">확인</button>
			</a>
		</c:if>
		
	</div>






</body>
</html>