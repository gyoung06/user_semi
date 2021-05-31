<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<div>
	회원아이디:<br>
	회원이름:<br>
	회원이메일:<br>
</div>
<form method="post" action="${cp }/admin/memberlist">
	검색할아이디:<input type="text" id="mid"><br>
	<input type="button" value="검색">
</form>
</body>
</html>