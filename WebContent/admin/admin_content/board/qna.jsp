<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#qnabox{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="qnabox">
	<table class="table">
		<tr>
			<th colspan="8">QnA</th>
		</tr>
		<tr>
			<th>ī�װ���</th>
			<th>ȸ�����̵�</th>
			<th>��ǰ��ȣ</th>
			<th>����</th>
			<th>�ۼ���¥</th>			
			<th>��ȣ</th>			
			<th>����</th>			
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.qcate }</td>
			<td>${vo.mid }</td>
			<td>${vo.pid }</td>
			<td>
			<c:if test="${vo.qlev>0 }">		
				<c:forEach var="i" begin="1" end="${vo.qlev }">
					&nbsp;&nbsp;
				</c:forEach>
				[re]
			</c:if>
			<a href="${cp }/admin/qnadetail?qid=${vo.qid }" 
			onclick="window.open(this.href,'','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">${vo.qtitle }</a></td>
			<td>${vo.qrdate }</td>
			<td></td>
			<td></td>
		</tr>
		</c:forEach>
	</table>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/qna?pageNum=${startPageNum-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/qna?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/qna?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/qna?pageNum=${endPageNum+1 }">[����]</a>
	</c:if>
	<form method="post" action="${cp }/admin/qna">
		<select name="field">
			<option value="qtitle">����</option>
			<option value="qcontent">����</option>
		</select>
		<input type="text" name="keyword">
	<input type="button" value="�˻�">
	</form>	<br>
</div>
</body>
</html>