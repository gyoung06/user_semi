<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>�Խ���</h1>
<table class="table">
  <tr>
    <th>NO</th>
    <th>PRODUCT</th>
    <th>SUBJECT</th>
    <th>NAME</th>
  </tr>
  <c:forEach var="vo" items="${list }">
	<tr>
		<th>${vo.qid }</th>
		<th>${vo.pid }</th>
		<th><a href="${cp }/user/qnaDetail?qtitle=${vo.qtitle}">${vo.qtitle }</a></th>
		<th>${vo.mid }</th>
	</tr>
	</c:forEach>
</table>
<div>
	<c:if test="${pageNum>10 }">
		<a href="${cp }/user/qna?pageNum=${startPageNum-1 }&field=${field}&keyword=${keyword}">[����]</a>
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
		<a href="${cp }/user/qna?pageNum=${endPageNum+1 }&field=${field}&keyword=${keyword}">[����]</a>
	</c:if>
</div>
�˻���
<div>
	<form method="post" action="${cp }/user/qna">
		<select name = "field">
				<option value="qtitle">
					<c:if test="${field=='qtitle' }">selected="selected"</c:if>
				����</option>
				<option value="qcontent">
					<c:if test="${field=='qcontent' }">selected="selected"</c:if>
				����</option>
				<option value="mid">
					<c:if test="${field=='mid' }">selected="selected"</c:if>
				���̵�</option>
		</select>
		<input type="text" name = "keyword">
		<input type="submit" value="ã��">
	</form>
</div>
