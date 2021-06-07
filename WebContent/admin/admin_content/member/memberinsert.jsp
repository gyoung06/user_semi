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
	<form method="post" action="<%=request.getContextPath()%>/admin/memberinsert" style="margin-top:20px;">
		���̵�<input type="text" name="mid" id="mid1">
		<input type="button" name="idcheck" id="idcheck" value="���̵�Ȯ��"><br>
		<div id="idmention"></div><br>
		��й�ȣ<input type="password" name="mpw" id="mpw" onkeyup="pwdcheck()"><br>
		��й�ȣ Ȯ��<input type="password" name="mpwcheck" id="mpwcheck" onkeyup="pwdcheck()"><br>
		<div id="pwdmention"></div><br>
		�̸�<input type="text" name="mname"><br>
		�ּ�<input type="text" name="maddress"><br>
		�̸���<input type="text" name="memail"><br>
		�����ȣ<input type="text" name="mpost"><br>
		��ȭ��ȣ<input type="text" name="mphone"><br>
		
		����	
		<select name="year">
	      <c:forEach begin="1990" end="2000" var="y">
	         <option>
	               ${y }
	         </option>
	      </c:forEach>
		</select>
		
		<select name="month">
	      <c:forEach begin="1" end="12" var="m">
	         <option>
	               ${m }
	         </option>
	      </c:forEach>
		</select>
		
		<select name="day">
	      <c:forEach begin="1" end="31" var="d">
	         <option>
	               ${d }
	         </option>
	      </c:forEach>
		</select>
		<input type="submit" value="���" id="submitbtn" disabled="disabled">
	</form>
	
</div>
<script type="text/javascript">
	let idcheck=document.getElementById("idcheck");
	let submitbtn=document.getElementById("submitbtn");
	idcheck.onclick=function(e){
		var mid1=document.getElementById("mid1").value;
		const div=document.getElementById("idmention");
		console.log(mid1);
		if(mid1=="" || mid1==null){
			idmention.innerHTML="���̵� �Է��ʿ�!";
			return;
		}
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let result=xhr.responseText;
				let json=JSON.parse(result);
				if(json.using==true){
					div.innerHTML="������� ���̵�";
				}else{
					div.innerHTML="��밡���� ���̵��Դϴ�.";
					submitbtn.disabled=false;
				}
			}
		};
		xhr.open('get','<%=request.getContextPath()%>/admin/admin_content/member/idcheck.jsp?mid1='+mid1, true);
		xhr.send();
	};
	
	var mpw=document.getElementById("mpw").value;
	var mpwcheck=document.getElementById("mpwcheck").value;
	const pwdmention=document.getElementById("pwdmention");
	if(mpw=="" || mpw==null){
		pwdmention.innerHTML="��й�ȣ�� �Է��ϼ���.";
	}
	function pwdcheck(){
		var mpw=document.getElementById("mpw").value;
		var mpwcheck=document.getElementById("mpwcheck").value;
		if(mpw==mpwcheck){
			pwdmention.innerHTML="��й�ȣ�� ��ġ�մϴ�.";
		}else{
			pwdmention.innerHTML="��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		}
	}
</script>
</body>
</html>