<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/inbound.css">

<div class="inboundinput">
<h3 class="inboundtext2">입고등록</h3>
	<div class="textbox1">
		<div class="up_text1">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
		<div class="up_text2">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
		<div class="up_text3">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
	</div>
	<div class="textbox2">
		<div class="down_text1">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
		<div class="down_text2">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
		<div class="down_text3">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
		<div class="down_text4">
			<label class="input_label">색상</label><input type="text" class="input_text" />
		</div>
	</div>
</div>


<div class="boardcss_list_table">
<h3 class="inboundtext1">입고리스트</h3>	
	<table class="list_table">
		<thead>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>가격</th>
			<th>품목</th>
			<th>입고량</th>
			<th>입고날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.inid }</td>
				<td>${vo.inname }</td>
				<td>${vo.incolor }</td>
				<td>${vo.insize }</td>
				<td>${vo.inprice }</td>
				<td>${vo.incategory }</td>
				<td>${vo.inamount }</td>
				<td>${vo.indate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="page">
	<c:if test="${startPageNum>10 }">
		<a href="${cp}/admin/inbound/list?pageNum=${startPageNum -1 }&field=${field}&keyword=${keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${i==pageNum }">
				<a href="${cp }/admin/inbound/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:red">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/inbound/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:blue">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/inbound/list?pageNum=${endPageNum+1 }&field=${field}&keyword=${keyword}">[다음]</a>
	</c:if>
</div>
<div class="find">
	<form method="post" action="${cp }/admin/inbound/list">
		<select name="field">
			<option value="inname" <c:if test="${field=='inname' }">selected="selected"</c:if>>상품명</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
</div>
