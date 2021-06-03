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
	<%
		String mid=(String)session.getAttribute("id"); //login 컨트롤러에서 session 저장된 것 꺼내오기
		String mpw=(String)session.getAttribute("pwd"); 
	%>
<%=mid %>님의 회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해 주세요. 
<%=mpw %>
<br><br><br>
<form method="post" action="${cp }/user/user_content/user_board/userInfo/update.jsp" onsubmit="return checkData();">
>비밀번호 &nbsp;<input type="password" id="pwd">
<input type="submit" value="확인" >
</form>
</div>
<script type="text/javascript">
	function checkData(){
		console.log("11");
		var pwd=document.getElementById("pwd").value;
		if(pwd=="<%=mid %>"){
			console.log("22");
			alert("수정 페이지로 이동합니다");
			return true;
		}else{
			alert("비밀번호가 틀렸습니다");
			return false;
		}
	}
</script>
</body>
</html>