<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fnq.jsp</title>
<style>
	#list{
		position:absolute;
		top:150px;
		left:150px;
		width:1500px;
	}
	#insert{
		position: absolute;
		top:100px;
		left:1500px;
	}
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<br>
<br>

<h1>FAQ ������ ������</h1>
<div id="insert">
<a href="<%=request.getContextPath()%>/admin/admin_content/board/faqinsert.jsp" 
			onclick="window.open(this.href,'','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">
			<input type="button" value="�۾���"></a>
</div>		
<div id="list">
<div>
	<table class="table">
		<tr>
			<th colspan="8">�������̺�</th>
		</tr>
		<colgroup>
		<col style="width:5%">
		<col style="width:10%">
		<col style="width:50%">
		<col style="width:10%">
		<col style="width:10%">
		<col style="width:5%">
		<col style="width:5%">
		<col style="width:5%">
		</colgroup>
		<tr>
			<th>�ۼ���</th>
			<th>����</th>
			<th>����</th>
			<th>��������</th>
			<th>�ۼ���¥</th>			
			<th>��ȣ</th>			
			<th>����</th>			
			<th>����</th>			
		</tr>
	<c:forEach var="vo" items="${list }">
	<c:choose>
		<c:when test="${vo.fpublic_private==1 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>${vo.fcontent }</td>
			<td>����</td>
			<td>${vo.frdate }</td>
			<td>${vo.fid }</td>
			<td><a href="<%=request.getContextPath()%>/admin/faqpopup?fid=${vo.fid }"
			 onclick="window.open(this.href,'����','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">����</a></td>
			<td><a href="<%=request.getContextPath()%>/admin/faq/delete?fid=${vo.fid }">����</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/faq/list?pageNum=${startPageNum-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/faq/list?pageNum=${endPageNum+1 }">[����]</a>
	</c:if>
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field">
			<option value="ftitle">����</option>
			<option value="fcontent">����</option>
		</select>
		<input type="text" name="keyword">
	<input type="button" value="�˻�">
	</form>	<br>
</div>
<div>
	<table class="table">
		<tr>
			<th colspan="8">��������̺�</th>
		</tr>
		<colgroup>
		<col style="width:5%">
		<col style="width:10%">
		<col style="width:50%">
		<col style="width:10%">
		<col style="width:10%">
		<col style="width:5%">
		<col style="width:5%">
		<col style="width:5%">
		</colgroup>
		<tr>
			<th>�ۼ���</th>
			<th>����</th>
			<th>����</th>
			<th>��������</th>
			<th>�ۼ���¥</th>			
			<th>��ȣ</th>			
			<th>����</th>			
			<th>����</th>			
		</tr>
	<c:forEach var="vo" items="${list1 }">
	<c:choose>
		<c:when test="${vo.fpublic_private==0 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>${vo.fcontent }</td>
			<td>�����</td>
			<td>${vo.frdate }</td>
			<td>${vo.fid }</td>
			<td><a href="<%=request.getContextPath()%>/admin/faqpopup?fid=${vo.fid }"
			 onclick="window.open(this.href,'����','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">����</a></td>
			<td><a href="<%=request.getContextPath()%>/admin/faq/delete?fid=${vo.fid }">����</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>	
	<c:if test="${startPageNum1>10 }">
		<a href="${cp }/admin/faq/list1?pageNum1=${startPageNum1-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum1 }" end="${endPageNum1 }">
		<c:choose>
			<c:when test="${pageNum1==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum1<pageCount1 }">
		<a href="${cp }/admin/faq/list?pageNum1=${endPageNum1+1 }">[����]</a>
	</c:if>	
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field1">
			<option value="ftitle1">����</option>
			<option value="fcontent1">����</option>
		</select>
		<input type="text" name="keyword1">
	<input type="button" value="�˻�">
	</form>
</div>
</div>
</body>
</html>