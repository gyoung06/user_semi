<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>#MEMBER JOIN</h4>
<form action="${cp }/user/login" method="post">
<input type="text" name="id" placeholder="ID">
<br>
<input type="text" name="pwd" placeholder="PW"><br>
<input type="submit" value="LOGIN"><br>
보안접속<br>
<a href="${cp }/user/findidpath">>아이디찾기</a>
<a href="${cp }/user/findpwd">>비밀번호찾기</a>

<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
<input type="button" value="JOIN US">
</form>