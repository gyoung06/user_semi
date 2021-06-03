<%@page import="user.vo.User_NoticeVo"%>
<%@page import="oracle.sql.CLOB"%>
<%@page import="java.io.Reader"%>
<%@page import="java.sql.Clob"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h4>NOTICE</h4>
공지사항입니다.
<table class="table">
  <tr>
    <td>SUBJECT</td>
    <td>${vo.ftitle }</td>
  </tr>
  <tr>
    <td>NAME</td>
	<th>${vo.aid }</th>
  </tr>
  <tr>
  	<td colspan="2">첨부파일 들어올곳: ${vo.ffile }</td>
  </tr>
  <tr>
  	<td colspan="2">내용 들어올곳: ${vo.fcontent }</td>
  </tr>
</table>
<input type="button" value="목록">

<table>
	<tr>
		<td>이전글</td>
		<td><a href="${cp }/user/noticedetail?fid=${vo.fid-1 }">${vo.fid-1}</a></td>
	</tr>
	<tr>
		<td>다음글</td>
		<td><a href="${cp }/user/noticedetail?fid=${vo.fid+1 }">${vo.fid+1 }</a></td>
	</tr>
</table>

