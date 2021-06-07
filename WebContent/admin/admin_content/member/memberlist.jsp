<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#box{
		position:absolute;
		top:100px;
		left:150px;
	}
</style>
</head>
<body >
<div id="box">
<table class="table" style= "margin-top: 20px;">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>주소</th>
		<th>우편번호</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>생일</th>
		<th>탈퇴여부</th>
		<th>마일리지</th>
		<th>수정</th>
	</tr>
	<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.mid }</td>
		<td>${vo.mpw }</td>
		<td>${vo.mname }</td>
		<td>${vo.maddress }</td>
		<td>${vo.mpost }</td>
		<td>${vo.mphone }</td>
		<td>${vo.memail }</td>
		<td>${vo.mrdate }</td>
		<td>${vo.mbirth }</td>
		<td>${vo.mdrop }</td>
		<td>${vo.mmileage }</td>
		<td><a href="${cp }/admin/memberupdate?mid=${vo.mid }">수정</a></td>
	</tr>
	</c:forEach>
</table>

<div>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/memberlist?pageNum=${startPageNum-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--현재페이지인경우 --%>
				<a href="${cp }/admin/memberlist?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/memberlist?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/memberlist?pageNum=${endPageNum+1 }">[다음]</a>
	</c:if>
<form method="post" action="${cp }/admin/memberlist">
		<select name="field">
			<option value="mid">아이디</option>
		</select>
		검색할아이디:<input type="text" name="keyword">
	<input type="button" value="검색">
</form>
</div>
</div>
</body>
</html>