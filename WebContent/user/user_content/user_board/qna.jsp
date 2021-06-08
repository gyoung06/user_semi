<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>qna</h1>
<table class="table">
  <tr>
    <th>DATE</th>
    <th>PRODUCT</th>
    <th>SUBJECT</th>
    <th>NAME</th>
  </tr>
  <c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.qrdate }</td>
		<td>${vo.pid }</td>
		<td>
			<c:if test="${vo.qlev>0 }">		
				<c:forEach var="i" begin="1" end="${vo.qlev }">
					&nbsp;&nbsp;
				</c:forEach>
				[re]
			</c:if>
			<a href="${cp }/user/qnaDetail?qtitle=${vo.qtitle}">${vo.qtitle }</a></th>
		<td>${vo.mid }</td>
	</tr>
	</c:forEach>
</table>
<div>
	<c:if test="${pageNum>10 }">
		<a href="${cp }/user/qna?pageNum=${startPageNum-1 }&field=${field}&keyword=${keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<a href="${cp }/user/qna?pageNum=${i }&field=${field}&keyword=${keyword}"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/user/qna?pageNum=${i }&field=${field}&keyword=${keyword}"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pageCount>endPageNum }">
		<a href="${cp }/user/qna?pageNum=${endPageNum+1 }&field=${field}&keyword=${keyword}">[다음]</a>
	</c:if>
</div>
<br>
검색어
<div>
	<form method="post" action="${cp }/user/qna">
		<select name = "field">
				<option value="qtitle">
					<c:if test="${field=='qcate' }">selected="selected"</c:if>
				카테고리</option>
				<option value="qtitle">
					<c:if test="${field=='qtitle' }">selected="selected"</c:if>
				제목</option>
				<option value="qcontent">
					<c:if test="${field=='qcontent' }">selected="selected"</c:if>
				내용</option>
				<option value="mid">
					<c:if test="${field=='mid' }">selected="selected"</c:if>
				아이디</option>
		</select>
		<input type="text" name = "keyword">
		<input type="submit" value="찾기">
	</form>
</div>
