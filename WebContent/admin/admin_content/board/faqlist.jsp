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

<h1>FAQ 관리자 페이지</h1>
<div id="insert">
<a href="<%=request.getContextPath()%>/admin/admin_content/board/faqinsert.jsp" 
			onclick="window.open(this.href,'','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">
			<input type="button" value="글쓰기"></a>
</div>		
<div id="list">
<div>
	<table class="table">
		<tr>
			<th colspan="8">공개테이블</th>
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
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>공개여부</th>
			<th>작성날짜</th>			
			<th>번호</th>			
			<th>수정</th>			
			<th>삭제</th>			
		</tr>
	<c:forEach var="vo" items="${list }">
	<c:choose>
		<c:when test="${vo.fpublic_private==1 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>${vo.fcontent }</td>
			<td>공개</td>
			<td>${vo.frdate }</td>
			<td>${vo.fid }</td>
			<td><a href="<%=request.getContextPath()%>/admin/faqpopup?fid=${vo.fid }"
			 onclick="window.open(this.href,'수정','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">수정</a></td>
			<td><a href="<%=request.getContextPath()%>/admin/faq/delete?fid=${vo.fid }">삭제</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/faq/list?pageNum=${startPageNum-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--현재페이지인경우 --%>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/faq/list?pageNum=${endPageNum+1 }">[다음]</a>
	</c:if>
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field">
			<option value="ftitle">제목</option>
			<option value="fcontent">내용</option>
		</select>
		<input type="text" name="keyword">
	<input type="button" value="검색">
	</form>	<br>
</div>
<div>
	<table class="table">
		<tr>
			<th colspan="8">비공개테이블</th>
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
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>공개여부</th>
			<th>작성날짜</th>			
			<th>번호</th>			
			<th>수정</th>			
			<th>삭제</th>			
		</tr>
	<c:forEach var="vo" items="${list1 }">
	<c:choose>
		<c:when test="${vo.fpublic_private==0 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>${vo.fcontent }</td>
			<td>비공개</td>
			<td>${vo.frdate }</td>
			<td>${vo.fid }</td>
			<td><a href="<%=request.getContextPath()%>/admin/faqpopup?fid=${vo.fid }"
			 onclick="window.open(this.href,'수정','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">수정</a></td>
			<td><a href="<%=request.getContextPath()%>/admin/faq/delete?fid=${vo.fid }">삭제</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>	
	<c:if test="${startPageNum1>10 }">
		<a href="${cp }/admin/faq/list1?pageNum1=${startPageNum1-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum1 }" end="${endPageNum1 }">
		<c:choose>
			<c:when test="${pageNum1==i }"><%--현재페이지인경우 --%>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum1<pageCount1 }">
		<a href="${cp }/admin/faq/list?pageNum1=${endPageNum1+1 }">[다음]</a>
	</c:if>	
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field1">
			<option value="ftitle1">제목</option>
			<option value="fcontent1">내용</option>
		</select>
		<input type="text" name="keyword1">
	<input type="button" value="검색">
	</form>
</div>
</div>
</body>
</html>