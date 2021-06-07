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
		<th>���̵�</th>
		<th>��й�ȣ</th>
		<th>�̸�</th>
		<th>�ּ�</th>
		<th>�����ȣ</th>
		<th>��ȭ��ȣ</th>
		<th>�̸���</th>
		<th>������</th>
		<th>����</th>
		<th>Ż�𿩺�</th>
		<th>���ϸ���</th>
		<th>����</th>
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
		<td><a href="${cp }/admin/memberupdate?mid=${vo.mid }">����</a></td>
	</tr>
	</c:forEach>
</table>

<div>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/memberlist?pageNum=${startPageNum-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/memberlist?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/memberlist?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/memberlist?pageNum=${endPageNum+1 }">[����]</a>
	</c:if>
<form method="post" action="${cp }/admin/memberlist">
		<select name="field">
			<option value="mid">���̵�</option>
		</select>
		�˻��Ҿ��̵�:<input type="text" name="keyword">
	<input type="button" value="�˻�">
</form>
</div>
</div>
</body>
</html>