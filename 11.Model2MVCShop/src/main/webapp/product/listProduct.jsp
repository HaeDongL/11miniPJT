<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.List"  %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	String menu = (String)request.getAttribute("menu");
	System.out.println("listProduct.jsp menu : "+menu);
--%>

<html>
<head>
<title>회원 목록 조회</title>

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



<jsp:include page="/layout/toolbar.jsp" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetList(currentPage) { // ; 안들어감(?)
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
			
		}
		
		$(function() {
			
			
			$( ".btn.btn-default:contains('검색')" ).on("click" , function() {
				
				fncGetList(1);
			});
			
			$(".prodNo").on("click",function(){
				var prodNo = $(this).data("value");
				self.location = "/product/getProduct?menu=${menu}&prodNo="+prodNo;
			});
			
			
			$(".btn-default:contains('간략정보')").on("click",function(){
				var prodNo = $(this).data("parm");
				$.ajax({
							
							url:"/product/json/getProduct?prodNo="+prodNo, //RestController 생성
							method:"GET",
							dataType:"json",
							
							headers:{
								"Accept":"application/json",
								"Content-Type":"application/json"
							},
							
							success:function(JSONData,status){
								var displayValue = 
												"<h5>"+"상품이름 : "+JSONData.prodName+"</h5>"
												+"<h5>"+"상품정보 : "+JSONData.prodDetail+"</h5>"
												+"<h5>"+"상품가격 : "+JSONData.price+"</h5>"
												+"<h5>"+"남은재고 : "+JSONData.quantity+" 개</h5>"
												if(JSONData.quantity!=0){
													displayValue = displayValue+"<h5>판매중</h5>";
												}else{
													displayValue = displayValue+"<h5>재고없음</h5>";
												}
												displayValue = displayValue +
												"<a href=\"#\" id =\"cancelSummary\" class=\"btn btn-primary\" role=\"button\">그만보기</a>";
													
								$("h5").remove();
								$("a#cancelSummary").remove();
								$("p#"+prodNo+"").html(displayValue).css("text-align","center");
								
								
							
								$("a#cancelSummary").on("click",function(){
									$("h5").remove();
									$("a#cancelSummary").remove();
								});
								
							}
						
				
				});
				
			});
			
			
			
			
			
			// , 가 없으면 자식(?)태그
			// .ct_list_pop<tr> 의 자식인 td를 의미.
			$(".ct_list_pop td:nth-child(3n)").css("color","red");
			
			$(".ct_list_b h7").css("color","red");
			
			
			$("a.btn.btn-primary:contains('상세정보')").on("click",function(){
				var prodNo = $(this).data("param");
				$(self.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=${menu}");
			});
		});
		
</script>

	<style>
        body {
            padding-top : 70px;
        }
   	</style>
</head>

<body bgcolor="#ffffff" text="#000000">

<div class="container">

<div style="width:98%; margin-left:10px;">


<form name="detailForm">
<input type="hidden" name="menu" value="${menu }" />
	
		<div class="page-header text-info">
	       <c:if test="${menu == 'manage'}">
					<h3>상품 관리</h3>
				</c:if>
				<c:if test="${menu == 'search'}">
					<h3>상품 목록조회</h3>
				</c:if>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${search.searchCondition == "0" ? "selected" : "" }>상품번호</option>
						<option value="1" ${search.searchCondition == "1" ? "selected" : ""}>상품명</option>
						<option value="2" ${search.searchCondition == "2" ? "selected" : ""}>상품가격</option></select>
				 </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				
	    	</div>
	    	
		</div>
	</form>
	




	<c:set var="i" value="0" /><%--pageScope.setAttribute("i",0); --%>
	<c:forEach var="product" items="${list}"><%--Start forEach --%>
		
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="/images/uploadFiles/${product.fileName }" style="width:200; height:200px;"   />
			      <div class="caption">
			        <h3>${product.prodName }</h3>
			        <p><a href="#" class="btn btn-primary" role="button" data-param="${product.prodNo }">상세정보</a> <a href="#" class="btn btn-default" role="button" data-parm="${product.prodNo }">간략정보</a></p>
			      	<p id="${product.prodNo }"></p>
			      </div>
			    </div>
			  </div>
		
		<c:set var="i" value="${ i+1 }" /><%--~Scoep.i+1 현재 i에 0 저장 for문이 돌때마다 1식증가--%>
		
	
	</c:forEach><%--End forEach --%>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// 		   
	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			◀ 이전
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
	<% } %>

	<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
	<% 	}  %>
	
	<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			이후 ▶
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
	<% } %>
	 /////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
	
		<jsp:include page="../common/pageNavigator_new.jsp"/>
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->


</div>
</div>

</body>

</html>

