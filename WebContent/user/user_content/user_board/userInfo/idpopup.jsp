<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디<input type="text" id="cid">
<div id="result" style="color:red; font-size:12px"></div>
<input type="button" value="확인" id="btn1" onclick="/user/idcheck">
<input type="button" value="사용" id="btn2" disabled="disabled">
<script type="text/javascript">
<%
	boolean check=(boolean)request.getAttribute("check");
%>
window.onload=function(e){
	var pid=window.opener.document.getElementByName("mid")[0];
	var cid=document.getElementById("cid");
	cid.value=pid.value;
	var btn1=document.getElementById("btn1");
	var btn2=document.getElementById("btn2");
	var result=document.getElementById("result");
	btn1.addEventListener('click',()=>{
		if(check==true){
			result.innerHTML="사용중인 아이디입니다";
		}else{
			result.innerHTML="사용가능한 아이디입니다";
		}
	});
}
</script>
</body>
</html>