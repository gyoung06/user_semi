<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- header.jsp -->
<style>
	#category{float:left; margin-right: 20px;}
	#community{float:left; margin-right: 20px;}
	#member{float:left; margin-right: 20px;}
	#callbank{float:left;}
	#right{float: right;}
	a{text-decoration: none; color:black; }
</style>
<div id ="wrap">
	<h1><a href="${cp }/user/home">J4</a></h1>
	<div id ="category">
		<h3>category</h3>
		<a href="">new</a><br>
		<a href="">best 50</a><br>
		<a href="${cp }/user/category?category=outer">outer</a><br>
		<a href="${cp }/user/category?category=top">top</a><br>
		<a href="${cp }/user/category?category=ops">ops</a><br>
		<a href="${cp }/user/category?category=skirt">skirt</a><br>
		<a href="${cp }/user/category?category=pants">pants</a><br>
		<a href="${cp }/user/category?category=shoes&bag">shoes&bag</a><br>
		<a href="${cp }/user/category?category=acc">acc</a>
	</div>
	<div id ="community">
		<h3>community</h3>
		<a href="${cp }/user/notice">notice</a><br>
		��� �� ����/���<br>
		<a href="${cp }/user/review">review</a><br>
		<a href="${cp }/user/qna">q&a</a><br>
		<a href="${cp }/user/faq">faq</a>
		
	</div>
	<div id ="member">
		<h3>member</h3>
		<a href="${cp }/user/login">login</a><br>
		<a href="${cp }/user/join">join+1000</a><br>
		<a href="${cp }/user/cart">shopping cart</a><br>
		<a href="${cp }/user/purchase">order list</a><br>
		<a href="${cp }/user/mypage">my shopping</a>
	</div>
	<div id = "callbank">
		<div id ="call">
			<h3>T. 070-8889-3598</h3>
			mon-fri pm1:00~pm5:00<br>
			lunch pm12:00~pm1:00<br>
			sat.sun hooiday off
		</div>
		<div id ="bankInfo">
			<h3>bank info</h3>
			���� 287701-04-433868<br>
			������ : �ֽ�ȸ�簡������<br>
			sat.sun hooiday off
		</div>
	</div>
	<div id = "right">
	+
	deoiverybookmark<br>
	instagram<br>
	
	�˻�
	</div>
</div>