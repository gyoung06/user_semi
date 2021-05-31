<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<div id="top">
	<h1 class="toplogo">J4 관리자 페이지</h1>
	<input type="button" value="홈페이지" class="homebtn">
	<input type="button" value="로그아웃" class="logoutbtn">
</div>

<!-- 콘탠트 영역 -->
<div id="content">
	<jsp:include page="${content }"/>
</div>

<!-- 메뉴구성 -->
<input type="checkbox" id="menuicon">
<ul>
	<li>
		<label for="menuicon">
			<span></span><span></span><span></span>
		</label>
</ul>
<div class="sidebar">
	<img class="profile" src="<%=request.getContextPath()%>/admin/img/profile.jpg">
	<ul id="ac">
		<li class="main">
		회원관리
			<ul class="sub">
				<li><a href="${cp }/admin/memberlist">회원리스트</a></li>
				<li><a href="${cp }/admin/memberinsert">회원등록</a></li>
				<li>menu1 - 3</li>
			</ul>
		</li>
	</ul>
	<ul id="ac">
		<li class="main">
		상품관리
			<ul class="sub">
				<li><a href="${cp }/admin/inbound/list">입고</a></li>
				<li>menu2 - 2</li>
				<li>menu2 - 3</li>
			</ul>
		</li>
	</ul>
	<ul id="ac">
		<li class="main">
		매출
			<ul class="sub">
				<li>menu2 - 1</li>
				<li>menu2 - 2</li>
				<li>menu2 - 3</li>
			</ul>
		</li>
	</ul>
	<ul id="ac">
		<li class="main">
		게시판관리
			<ul class="sub">
				<li><a href="${cp }/admin/qna">QnA</a></li>
				<li><a href="${cp }/admin/faq">FAQ</a></li>
				<li>menu2 - 3</li>
			</ul>
		</li>
	</ul>
	<ul id="ac">
		<li class="main">
		대시보드
			<ul class="sub">
				<li>menu2 - 1</li>
				<li>menu2 - 2</li>
				<li>menu2 - 3</li>
			</ul>
		</li>
	</ul>
</div>
<script type="text/javascript">
	$('.main').click(function(){
		$('.sub').slideUp();
		if($(this).children('.sub').is(':visible')){
			$(this).children('.sub').slideUp();
		}else{
			$(this).children('.sub').slideDown();
		}
	});
</script>
</body>
</html>