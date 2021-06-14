<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="box"style="border-top :1px solid #747474; border-bottom :1px solid #747474; top:10px; left:0px; width:480px; height:450px;">
<%
	String id=(String)session.getAttribute("id");
%>
<h2>QnA 문의</h2>

<form method="post" action="<%=request.getContextPath()%>/user/qnainsert" enctype="multipart/form-data">
<input type="hidden" value="<%=id %>" name="mid">
	<label style="width:80px; height:30px;">카테고리</label><select name="qcate">
		<option value="delivery">배송문의</option>
		<option value="product">상품문의</option>
		<option value="refund">환불문의</option>
	</select>
	<br>
	<label style="width:70px; height:30px;">글제목</label>
	<input type="text" name="qtitle">
	<br>
	<label style="width:70px; height:30px;">글내용</label>
	<textarea rows="5" cols="50" name="qcontent"></textarea>
	<br>
	<label style="width:70px; height:30px;">비밀번호</label>
	<input type="text" name="qpw">
	<br>
	<label style="width:70px; height:30px;">파일첨부</label>
	<br>
	<input type="file" name="file1" ><br>
	<input type="submit" value="글등록">
</form>
	<a href="<%=request.getContextPath()%>/user/qna"><input type="button" value="취소"></a>
</div>