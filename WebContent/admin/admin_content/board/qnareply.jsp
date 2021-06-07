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
	작성자:${vo.mid }<br>
	제목:${vo.qtitle }<br>
	카테고리:${vo.qcate }<br>
	내용:${vo.qcontent }<br>
	답글:

	<form action="${cp }/admin/qna/reply" method="post">
	
	<input type="hidden" name="qcate" value="${vo.qcate }">
	<input type="hidden" name="qpw" value="${vo.qpw }">
	<input type="hidden" name="qtitle" value="${vo.qtitle }">
	<input type="hidden" name="qfile" value="${vo.qfile }">
	<input type="hidden" name="qref" value="${vo.qref }">
	<input type="hidden" name="qlev" value="${vo.qlev }">
	<input type="hidden" name="mid" value="${vo.mid }">
	<input type="hidden" name="pid" value="${vo.pid }">

	<br>
	<textarea rows="5" cols="50" name="qcontent"></textarea><br>
	<input type="submit" value="등록">
	</form>
</body>
</html>