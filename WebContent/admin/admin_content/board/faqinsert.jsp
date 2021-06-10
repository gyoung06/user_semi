<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String id=(String)session.getAttribute("id");
%>
<div id="faqbox">
<form method="post" action="<%=request.getContextPath()%>/admin/faq/insert">
		작성자<br>
		<input type="text" name="fwriter" value=<%=id %> readonly="readonly"><br>
		제목<br>
		<input type="text" name="ftitle"><br>
		내용<br>
		<textarea rows="5" cols="50" name="fcontent"></textarea><br>
		공개<input type="radio" name="fpublic_private" value="1" checked>
		비공개<input type="radio" name="fpublic_private" value="0">
		<input type="submit" name="insert" value="등록">
</form>
</div>