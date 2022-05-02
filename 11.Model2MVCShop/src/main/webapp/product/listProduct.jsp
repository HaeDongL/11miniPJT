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
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	String menu = (String)request.getAttribute("menu");
	System.out.println("listProduct.jsp menu : "+menu);
--%>

<html>
<head>
<title>ȸ�� ��� ��ȸ</title>

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
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetList(currentPage) { // ; �ȵ�(?)
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
			
		}
		
		$(function() {
			
			
			$( "td:contains('�˻�')" ).on("click" , function() {
				
				fncGetList(1);
			});
			
			$(".prodNo").on("click",function(){
				var prodNo = $(this).data("value");
				self.location = "/product/getProduct?menu=${menu}&prodNo="+prodNo;
			});
			
			
			$(".ct_list_pop h4[name=view]").on("click",function(){
				var prodNo = $(this).data("value");
				$.ajax({
							
							url:"/product/json/getProduct?prodNo="+prodNo, //RestController ����
							method:"GET",
							dataType:"json",
							
							headers:{
								"Accept":"application/json",
								"Content-Type":"application/json"
							},
							
							success:function(JSONData,status){
								var displayValue = 
												"<h3>"+"��ǰ�̸� : "+JSONData.prodName+"</h3>"
												+"<h3>"+"��ǰ���� : "+JSONData.prodDetail+"</h3>"
												+"<h3>"+"��ǰ���� : "+JSONData.price+"</h3>";
													
								$("h3").remove();
								$("td#"+prodNo+"").html(displayValue).css("text-align","center");
							}
						
				
				});
				
			});
			
			// , �� ������ �ڽ�(?)�±�
			// .ct_list_pop<tr> �� �ڽ��� td�� �ǹ�.
			$(".ct_list_pop td:nth-child(3n)").css("color","red");
			
			$(".ct_list_b h7").css("color","red");
			
			
			
		});
		
</script>


</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">


<form name="detailForm">
<input type="hidden" name="menu" value="${menu }" />
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<c:if test="${menu == 'manage'}">
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				</c:if>
				<c:if test="${menu == 'search'}">
					<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
				</c:if>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${search.searchCondition == "0" ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${search.searchCondition == "1" ? "selected" : ""}>��ǰ��</option>
				<option value="2" ${search.searchCondition == "2" ? "selected" : ""}>��ǰ����</option>
			</select><%-- ��������� �˻��ϴ� �� ������ �˻����Ŀ��� ��������. --%>
			<input 	type="text" name="searchKeyword" value="${search.searchKeyword }"  class="ct_input_g" 
							style="width:200px; height:20px" > <%-- �˻������� ���������ָ� �ٳ�������. --%>
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount} �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��<br/>
		<h7>(��ǰ�� click:������)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���� ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���� ���� ����</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" /><%--pageScope.setAttribute("i",0); --%>
	<c:forEach var="product" items="${list}"><%--Start forEach --%>
		
		<c:set var="i" value="${ i+1 }" /><%--~Scoep.i+1 ���� i�� 0 ���� for���� �������� 1������--%>
		<!-- 
		<script>
		$(function(){
			$(".ct_list_pop:contains('${product.prodName}')").on("click",function(){
				self.location = "/product/getProduct?prodNo=${product.prodNo}&menu=${menu}";
			});
		});
		</script>
		 -->
	<tr class="ct_list_pop">
		<td align="center">${i}</td>
		<td></td>
		<td align="left">
			<c:if test="${menu == 'manage' }">
				<a href="#"><h4 class="prodNo"  data-value = "${product.prodNo }">${product.prodName }</h4></a>
			</c:if>
			<c:if test="${menu == 'search' }">
				<a href="#"><h4 class="prodNo"  data-value = "${product.prodNo }">${product.prodName }</h4></a>
			</c:if>
		</td>
		<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		
		<c:if test = "${menu == 'manage'}">
			<c:if test="${product.quantity != 0 }">
				<td align="left">�Ǹ���</td>
			</c:if>
			<c:if test="${product.quantity == 0 }">
				<td align="left">������</td>
			</c:if>
		</c:if>
		
		<c:if test = "${menu == 'search'}">
			
			<c:if test="${product.quantity != 0 }">
				<td align="left">�Ǹ���</td>
			</c:if>
			<c:if test="${product.quantity == 0 }">
				<td align="left">������</td>
			</c:if>
		</c:if>
			
		<td></td>
		<td align="left">${product.quantity}</td>
		
		<td></td>
		<td align="left"><a href="#"><h4 name="view" data-value="${product.prodNo }">���� ���� ����</h4></a></td>
		
	</tr>
	<tr><td id="${product.prodNo }" colspan="11"></td></tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach><%--End forEach --%>
</table>

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
	
		<jsp:include page="../common/pageNavigator.jsp" />
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>