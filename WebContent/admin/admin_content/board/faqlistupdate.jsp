<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
	
<div id="faqbox">

<form method="post" action="<%=request.getContextPath()%>/admin/faq/update">
	<input type="text" name="fid" value="${vo.fid }"><br>
	작성자<br>
	<input type="text" name="fwriter" value=<%=id %> readonly="readonly"><br>
	제목<br>
	<input type="text" name="ftitle" value="${vo.ftitle }"><br>
	내용<br>
	<textarea rows="5" cols="50" name="fcontent" >${vo.fcontent }</textarea><br>
	<c:choose>
	<c:when test="${vo.fpublic_private==1 }">
	공개<input type="radio" name="fpublic_private" value="1" checked="checked">
	비공개<input type="radio" name="fpublic_private" value="0">
	</c:when>
	<c:otherwise>
	공개<input type="radio" name="fpublic_private" value="1">
	비공개<input type="radio" name="fpublic_private" value="0" checked="checked">
	</c:otherwise>
	</c:choose>
	<input type="submit" name="submit" value="수정">
</form>
</div>
</body>
</html>