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
	<form method="post" action="<%=request.getContextPath()%>/admin/memberupdate" style="margin-top:20px;">
			아이디:<input type="text" name="mid" value="${param.mid }" readonly="readonly"><br>
			비밀번호:<input type="text" name="mpw" value="${vo.mpw }"><br>
			이름:<input type="text" name="mname" value="${vo.mname }"><br>
			주소:<input type="text" name="maddress" value="${vo.maddress }"><br>
			우편번호:<input type="text" name="mpost" value="${vo.mpost }"><br>
			전화번호:<input type="text" name="mphone" value="${vo.mphone }"><br>
			이메일:<input type="text" name="memail" value="${vo.memail }"><br>
			생일:<input type="text" name="mbirth" value="${vo.mbirth }"><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<br>
			마일리지:<input type="text" name="mmileage" value="${vo.mmileage }"><br>
			
		
		<input type="submit" value="수정" id="submitbtn">
	</form>
	
</div>
</body>
</html>