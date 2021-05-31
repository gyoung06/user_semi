<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/user_content/user_board/updatePassCk.jsp</title>
</head>
<body>
<div style="width:1000px; height:300px; border: 1px solid #D5D5D5">
<h3>비밀번호 확인</h3>
<br>
'mid'님의 회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해 주세요. 
<br><br><br>

<input type="hidden" id="id" value="${param.mid }">
>비밀번호 &nbsp;<input type="password" id="pwd">
<input type="button" value="확인" onclick="checkPwd()">
</div>

</body>
</html>