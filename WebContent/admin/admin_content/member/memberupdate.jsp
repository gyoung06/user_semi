<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberupdate.jsp</title>
<style>
	#box{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="box">
	
		<form method="post" action="<%=request.getContextPath()%>/admin/memberupdate">
			아이디:<input type="text" name="mid" value="${param.mid }" readonly="readonly"><br>
			비밀번호:<input type="text" value="${vo.mpw }"><br>
			이름:<input type="text"><br>
			주소:<input type="text"><br>
			우편번호:<input type="text"><br>
			전화번호:<input type="text"><br>
			생일:<input type="text"><br>
			마일리지:<input type="text"><br>
			이메일:<input type="text"><br>
			<input type="submit" value="수정">
		</form>
	
</div>
</body>
</html>