<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberinsert.jsp</title>
<style>
	#insertbox{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="insertbox">
	<form method="post" action="${cp }/admin/memberinsert" style="margin-top:20px;">
		아이디<input type="text" name="mid" id="mid1">
		<input type="button" name="idcheck" id="idcheck" value="아이디확인"><br>
		<div id="idmention"></div><br>
		비밀번호<input type="password" name="mpw"><br>
		비밀번호 확인<input type="password" name="mpwcheck" onkeyup="mpwcheck()"><br>
		<div id="pwdmention"></div><br>
		이름<input type="text" name="mname"><br>
		주소<input type="text" name="maddress"><br>
		이메일<input type="text" name="memail"><br>
		우편번호<input type="text" name="mpost"><br>
		전화번호<input type="text" name="mphone"><br>
		생일<input type="text" name="mbirth"><br>
		<input type="submit" value="등록">
	</form>
</div>
<script type="text/javascript">
	let idcheck=document.getElementById("idcheck");
	idcheck.onclick=function(e){
		var mid=document.getElementById("mid1").value;
		const idmention=document.getElementById("idmention");
		console.log("test1");
		if(mid=="" || mid==null){
			idmention.innerHTML="아이디 입력필요!";
			console.log("test2");
		}
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let result=xhr.responseText;
				let json=JSON.parse(result);
				if(json.using==true){
					idmention.innerHTML="사용중인 아이디";
				}else{
					idmention.innerHTML="사용가능한 아이디입니다.";
				}
			}
		};
		xhr.open('get','idcheck.jsp?mid='+mid,true);
		xhr.send();
	};
	function mpwcheck(){
		let mpw=document.getElementById("mpw").value;
		let mpwcheck=document.getElementById("mpwcheck").value;
		const pwdmention=document.getElementById("pwdmention");
		if(mpw==""){
			pwdmention.innerHTML="비밀번호를 입력하세요.";
		}
		if(mpw!=mpwcheck){
			pwdmention.innerHTML="비밀번호가 일치하지 않습니다.";
		}else{
			pwdmention.innerHTML="비밀번호가 일치합니다.";
		}
	}
</script>
</body>
</html>