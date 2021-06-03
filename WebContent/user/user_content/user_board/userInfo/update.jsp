<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>my info</h4>
	<%
		String mid=(String)session.getAttribute("id"); //login 컨트롤러에서 session 저장된 것 꺼내오기
		String mpw=(String)session.getAttribute("pwd"); 
	%>
<div id="box1" style="border: 1px solid #D5D5D5">
저희 쇼핑몰을 이용해 주셔서 감사합니다. '<%=mid%>'님은 '회원등급'회원이십니다.
'금액'이상 구매시 '적립율'을 추가적립 받으실 수 있습니다.
</div>
<form action="${cp }/user/passcheck" method ="post">
	아이디*
	<input type="text" name="mid" value="<%=mid%>">(영문소문자/숫자, 4~16자)<br>
	현재 비밀번호
	<input type="text" name="mpw">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
	새 비밀번호
	<input type="text" name="newpw">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
	새 비밀번호 확인
	<input type="text" name="newpwok">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
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
<input type="button" value="취소" onclick="location.href=''">
<input type="button" value="회원 탈퇴" onclick="userDel(event)">
</form>
<script type="text/javascript">
	function userDel(e){
		var mpw=document.getElementsByName("mpw")[0].value
		var DelConfirm=confirm("정말 탈퇴하시겠습니까?")
		if(mpw.equals("<%=mpw%>")){
			if(DelConfirm==true){
				location.href="/user/delaccount";
				alert("탈퇴완료되었습니다. 이용해주셔서 감사합니다")
			}else{
				alert("탈퇴가 취소되었습니다")
			}
		}else{
			alert("현재 비밀번호가 정확하지 않습니다")
		}
	}
</script>