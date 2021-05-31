<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberupdate.jsp</title>
</head>
<body>
<form method="post" action="${cp }/admin/memberupdate">
	아이디:<input type="text" name="mid" value="${vo.mid }" readonly="readonly"><br>
	비밀번호:<input type="text"><br>
	이름:<input type="text"><br>
	주소:<input type="text"><br>
	우편번호:<input type="text"><br>
	전화번호:<input type="text"><br>
	생일:<input type="text"><br>
	마일리지:<input type="text"><br>
	이메일:<input type="text"><br>
	<input type="submit" value="수정">
</form>
</body>
</html>