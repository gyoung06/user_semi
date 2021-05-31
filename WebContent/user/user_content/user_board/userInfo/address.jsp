<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<h4>address</h4> 자주 쓰는 배송지를 등록 관리하실 수 있습니다.
<table class="table">
	<tr class="active">
		<th><input type="checkbox"></th>
		<th>배송지명</th>
		<th>수령인</th>
		<th>일반전화</th>
		<th>휴대전화</th>
		<th>주소</th>
		<th>수정</th>
	</tr>
	<c:forEach var="vo" items=${ }>
	<tr class="active">
		<td><input type="checkbox"></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</c:forEach>
</table>
<input type="button" value="선택 주소삭제">
<input type="button" value="배송지 등록">
<h4>배송주소록 유의사항</h4>
<ol>
	<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
	<li>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
	<li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
</ol>