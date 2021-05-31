<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/inbound.css">


<div class="inboundinput">
<h3 class="inboundtext2">입고등록</h3>
<form action="${cp }" method="post">
	<label class="label_incategory">품목</label><input type="text" name="input_incategory" style="position:absolute;top:50px;	left:870px;width: 200px;font-size: 1.0rem;"/>
	<label class="label_inname">상품명</label><input type="text" name="input_inname" style=" position: absolute;top:50px;left:170px;width: 500px;font-size: 1.0rem;"/>
	<label class="label_indate">입고날짜</label><input type="text" name="input_indate" style="position:absolute;top:150px;left:170px;width: 200px;font-size: 1.0rem;" />
	<label class="label_incolor">색상</label><input type="text" name="input_incolor" style="position:absolute;top:100px;left:870px;width: 200px;font-size: 1.0rem;" />
	<label class="label_insize">사이즈</label><input type="text" name="input_insize" style="position:absolute;top:100px;left:170px;width: 200px;font-size: 1.0rem;"/>
	<label class="label_inprice">가격</label><input type="text" name="input_inprice" />
	<label class="label_inamount">입고량</label><input type="text" name="input_inamount" />
	<input type="button" value="등록" id="insertbtn">
	<input type="button" value="수정" id="updatebtn">
</form>
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

