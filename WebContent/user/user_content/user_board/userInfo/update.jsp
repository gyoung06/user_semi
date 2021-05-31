<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>my info</h4>
<div id="box1" style="border: 1px solid #D5D5D5">
저희 쇼핑몰을 이용해 주셔서 감사합니다. '이름'님은 '회원등급'회원이십니다.
'금액'이상 구매시 '할인율'을 추가적립 받으실 수 있습니다.
</div>
<form action="${cp }/board/insert" method ="post">
	아이디*
	<input type="text" name="mid">(영문소문자/숫자, 4~16자)<br>
	비밀번호
	<input type="text" name="mpw">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
	새 비밀번호
	<input type="text" name="mpwok">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
	이름*
	<input type="text" name="mname"><br>
	휴대전화*
	<input type="tel" name="mphone"><br>
	이메일*
	<input type="email" name="memail"><br>

<h4>추가정보</h4>
	생년월일*
	<input type="date" name="mbirth"><br>
<input type="submit" value="회원정보수정">
<input type="button" value="취소">
<input type="button" value="회원 탈퇴" onclick>
</form>