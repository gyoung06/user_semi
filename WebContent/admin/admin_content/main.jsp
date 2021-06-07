<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/main.css">
<div class="boardcss_list_table">
<h3 class="maintext1">QnA처리 현황</h3>	
	<h5 class="subtext1">미처리 현황</h5>
	<table class="qna_table1">
		<thead>
		<tr>
			<th>문의글번호</th>
			<th>카테고리</th>
			<th>비번</th>
			<th>제목</th>
			<th>내용</th>
			<th>첨부파일</th>
			<th>등록일</th>
			<th>아이디</th>
			<th>상품번호</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list1 }">
			<tr>
				<td>${vo.qid }</td>
				<td>${vo.qcate }</td>
				<td>${vo.qpw }</td>
				<td>${vo.qtitle }</td>
				<td>${vo.qcontent }</td>
				<td>${vo.qfile }</td>
				<td>${vo.qrdate }</td>
				<td>${vo.mid }</td>
				<td>${vo.pid }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<h5 class="subtext2">처리 현황</h5>
	<table class="qna_table2">
		<thead>
		<tr>
			<th>문의글번호</th>
			<th>카테고리</th>
			<th>비번</th>
			<th>제목</th>
			<th>내용</th>
			<th>첨부파일</th>
			<th>등록일</th>
			<th>아이디</th>
			<th>상품번호</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list2 }">
			<tr>
				<td>${vo.qid }</td>
				<td>${vo.qcate }</td>
				<td>${vo.qpw }</td>
				<td>${vo.qtitle }</td>
				<td>${vo.qcontent }</td>
				<td>${vo.qfile }</td>
				<td>${vo.qrdate }</td>
				<td>${vo.mid }</td>
				<td>${vo.pid }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="product_list_table">
<h3 class="maintext2">실시간 상품판매 현황</h3>
</div>
