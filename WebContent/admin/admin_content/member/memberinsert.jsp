<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberinsert.jsp</title>

</head>
<body>
<form method="post" action="${cp }/admin/insert" style="margin-top:20px;">
	아이디<input type="text" name="mid"><br>
	비밀번호<input type="password" name="mpw"><br>
	비밀번호 확인<input type="password" name="mpwcheck"><br>
	<div id="mention"></div>
	이름<input type="text" name="mname"><br>
	주소<input type="text" name="maddress"><br>
	이메일<input type="text" name="memail"><br>
	우편번호<input type="text" name="mpost"><br>
	전화번호<input type="text" name="mphone"><br>
	생일<input type="text" name="mbirth"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>