<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="box">
<%
	String id=(String)session.getAttribute("id");
%>
<h2>QnA 문의</h2>

<form method="post" action="<%=request.getContextPath()%>/user/qnainsert" enctype="multipart/form-data">
<input type="hidden" value="<%=id %>" name="mid">
	카테고리<select name="qcate">
		<option value="delivery">배송문의</option>
		<option value="product">상품문의</option>
		<option value="refund">환불문의</option>
	</select>
	<br>
	글제목
	<input type="text" name="qtitle">
	<br>
	글내용
	<textarea rows="5" cols="50" name="qcontent"></textarea>
	<br>
	비밀번호
	<input type="text" name="qpw">
	<br>
	파일첨부
	<br>
	<input type="file" name="file1" ><br>
	<input type="submit" value="글등록">
</form>
	<a href="<%=request.getContextPath()%>/user/qna"><input type="button" value="취소"></a>
</div>