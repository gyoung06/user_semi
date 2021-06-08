<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/product.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.min.css">
<div class="boardcss_list_table">
<h2 class="stocktext">상품별 재고리스트</h2>
	<table class="list_table">
		<thead>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>수량</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.sid }</td>
				<td>${vo.sname }</td>
				<td>${vo.scolor }</td>
				<td>${vo.ssize }</td>
				<td>${vo.samount }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div class="boardcss_list_table1">
<h2 class="selltext">미리보기화면</h2>
</div>		

<div class="boardcss_list_table2">
<h2 class="producttext">판매리스트</h2>	
	<table class="list_table2">
		<thead>
		<tr>
			<th>이미지</th>
			<th>번호</th>
			<th>가격</th>
			<th>대표이미지</th>
			<th>추가이미지</th>
			<th>등록일</th>
			<th>판매량</th>
			<th>삭제</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo1" items="${list1 }">
			<tr>
				<!-- C:\web\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\semiProject\admin\upload/ -->
				<td>
					<img src="${pageContext.request.contextPath }/admin/upload/${vo1.pimage1 }" width="100" height="100">
				</td>
				<td>${vo1.pid }</td>
				<td>${vo1.pprice }</td>
				<td>${vo1.pimage1 }</td>
				<td>${vo1.pimage2 }</td>
				<td>${vo1.prdate }</td>
				<td>${vo1.psell }</td>
				<td><a href="<%=request.getContextPath()%>/admin/product/delete?pid=${vo1.pid}">삭제</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="page">
	<c:if test="${startPageNum>10 }">
		<a href="${cp}/admin/product/list?pageNum=${startPageNum -1 }&field=${field}&keyword=${keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${i==pageNum }">
				<a href="${cp }/admin/product/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:red">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/product/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:blue">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/product/list?pageNum=${endPageNum+1 }&field=${field}&keyword=${keyword}">[다음]</a>
	</c:if>
</div>
</div>
<div style="position:fixed;top:120px;left:1500px; font-size: 1.2rem;">
	<form method="post" action="${cp }/admin/product/list">
		<select name="field">
			<option value="pid" <c:if test="${field=='pid' }">selected="selected"</c:if>>번호</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
<form name="frm" method="post">
<label style="position:absolute;top:865px;left:1490px;font-size: 1.2rem;">재고번호선택</label>
<select name="sid" style="position:absolute;top:860px;left:1570px;width:50px;height:25px;font-size: 1.2rem;">
	<c:forEach var="vo" items="${list }">
		<option>${vo.sid }</option>
	</c:forEach>
</select>
<input class="btn btn-outline-dark" type="button" value="등록" onclick="valuesend()" style="position:absolute;top:860px;left:1640px;width:50px;height:25px;font-size: 1.2rem;">
<input class="btn btn-outline-dark" type="button" value="수정" onclick="valuesend1()" style="position:absolute;top:860px;left:1700px;width:50px;height:25px;font-size: 1.2rem;">
</form>
<script type="text/javascript">
function valuesend(){
	 window.open("", "value", "width=1000, height=800, left=400, top=140, scrollbars=1, menubar=1, resizable=1"); 
		 document.frm.target ="value";     
		 document.frm.action="<%=request.getContextPath()%>/admin/admin_content/item/productinsert.jsp";
	 	 document.frm.submit();
	}
function valuesend1(){
		 window.open("", "value", "width=1000, height=800, left=400, top=140, scrollbars=1, menubar=1, resizable=1"); 
			 document.frm.target ="value";     
			 document.frm.action="<%=request.getContextPath()%>/admin/admin_content/item/productupdate.jsp";
		 	 document.frm.submit();
}
</script>

