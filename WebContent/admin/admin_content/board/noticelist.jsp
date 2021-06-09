<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fnq.jsp</title>
<style>
	#noticebox{
		position:absolute;
		top:100px;
		left:900px;
		width:50%;
	}
	.boardcss_list_table { 
	position:absolute;
	top:100px;
	height:400px;
	width: 800px; 
	left:50px;
	border-top: 1px solid #8BBDFF;
	border-bottom: 1px solid #8BBDFF; 
}
/* ȭ�鿡 �������� �� ��� ���̺� */
.list_table { 
	position: absolute;
	top:50px;
	left:50px;
	height:300px;
	width:700px;
	font-size: 0.7rem;
	display: block;
  	overflow: auto;
}
/* list_table ���� ���Ǵ� thead */
.list_table th { 
	text-align: center; 
	border-top: 1px solid #ABABAB;
	border-bottom: 1px solid #ABABAB; 
	padding: 8px 0;
	background: #faf9fa; 
	width:600px;
}
.list_table td { 
	text-align: center;  
	border-bottom: 1px solid #ABABAB; 
	padding: 5px 0; 
	width:600px;
}
	
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<div id="noticebox">
<form method="post" action="<%=request.getContextPath()%>/admin/notice/insert" enctype="multipart/form-data">
		�ۼ���<br>
		<input type="text" name="fwriter" value=<%=id %> readonly="readonly"><br>
		����<br>
		<input type="text" name="ftitle"><br>
		����<br>
		<textarea rows="5" cols="50" name="fcontent"></textarea><br>
		÷������<br>
		<input type="file" name="file1" ><br>
		����<input type="radio" name="fpublic_private" value="1" checked>
		�����<input type="radio" name="fpublic_private" value="0">
		<input type="submit" name="insert" value="���">
</form>
</div>

<div class="boardcss_list_table">
	<table class="list_table">
		<colgroup>
			<col width="5%"/>
			<col width="5%"/>
			<col width="50%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
		</colgroup>
		<tr>
			<th colspan="8">�������̺�</th>
		</tr>
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
			<td><a href="<%=request.getContextPath()%>/admin/admin_content/board/noticelistupdate.jsp?fid=${vo.fid }&ftitle=${vo.ftitle}&fcontent=${vo.fcontent }&fpublic_private=${vo.fpublic_private}" 
			onclick="window.open(this.href,'����','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">����</a></td>	
			<td><a href="<%=request.getContextPath()%>/admin/notice/delete?fid=${vo.fid }">����</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/notice/list?pageNum=${startPageNum-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/notice/list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/notice/list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/notice/list?pageNum=${endPageNum+1 }">[����]</a>
	</c:if>
	<form method="post" action="${cp }/admin/notice/list">
		<select name="field">
			<option value="ftitle">����</option>
			<option value="fcontent">����</option>
		</select>
		<input type="text" name="keyword">
	<input type="button" value="�˻�">
	</form>	<br>
</div>
<div id="private" style="position:absolute; background: red; top:550px; left:100px; width:700px; height:400px; ">
	<table class="table">
	
		<tr>
			<th colspan="8">��������̺�</th>
		</tr>
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
			<td><a href="<%=request.getContextPath()%>/admin/admin_content/board/noticelistupdate.jsp?fid=${vo.fid }&ftitle=${vo.ftitle}&fcontent=${vo.fcontent }&fpublic_private=${vo.fpublic_private}" 
			onclick="window.open(this.href,'����','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">����</a></td>
			<td><a href="<%=request.getContextPath()%>/admin/notice/delete?fid=${vo.fid }">����</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum1>10 }">
		<a href="${cp }/admin/notice/list1?pageNum1=${startPageNum1-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum1 }" end="${endPageNum1 }">
		<c:choose>
			<c:when test="${pageNum1==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/notice/list?pageNum1=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/notice/list?pageNum1=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum1<pageCount1 }">
		<a href="${cp }/admin/notice/list?pageNum1=${endPageNum1+1 }">[����]</a>
	</c:if>	
	<form method="post" action="${cp }/admin/notice/list">
		<select name="field1">
			<option value="ftitle1">����</option>
			<option value="fcontent1">����</option>
		</select>
		<input type="text" name="keyword1">
	<input type="button" value="�˻�">
	</form>
</div>

<script type="text/javascript">
	
</script>
</body>
</html>