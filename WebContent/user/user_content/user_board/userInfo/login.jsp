<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>#MEMBER JOIN</h4>
<form action="/user/join" method="post">
<input type="text" id="id" value="ID">
<br>
<input type="text" id="pwd" value="PW"><br>
<input type="submit" value="LOGIN"><br>
보안접속<br>
<a href="${cp }/user/user_content/user_board/findid">>아이디찾기</a>
<a href="${cp }/user/user_content/user_board/findpwd">>아이디찾기</a>

<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
<input type="submit" value="JOIN US">
</form>