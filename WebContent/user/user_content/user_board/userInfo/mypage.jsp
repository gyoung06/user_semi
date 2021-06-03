<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	a{text-decoration: none; color:black; }
</style>
<h4>my info</h4>
<div id="box1" style="border: 1px solid #D5D5D5">
저희 쇼핑몰을 이용해 주셔서 감사합니다. '이름'님은 '회원등급'회원이십니다.
'금액'이상 구매시 '할인율'을 추가적립 받으실 수 있습니다.
</div>

<table class="table">
	<tr class="active">
		<td>>가용적립금</td>
		<td>원 <input type="button" value="조회"></td>
		<td>>총적립금</td>
		<td>원</td>
	</tr>
	<tr class="active">
		<td>>사용적립금</td>
		<td>원 </td>
		<td></td>
		<td></td>
	</tr>
	<tr class="active">
		<td>>총주문</td>
		<td> (회) </td>
		<td>>쿠폰</td>
		<td> 개 <input type="button" value="조회"></td>
	</tr>
</table>

<table class="table">
	<tr class="active">
		<td colspan="5">나의 주문처리 현황 (최근 3개월 기준)</td>
	</tr>
	<tr class="active">
		<td>입금전<br> </td>
		<td>배송준비중<br> </td>
		<td>배송중<br> </td>
		<td>배송완료<br> </td>
		<td>취소 : <a href=""> </a><br>  
			교환 : <a href=""> </a><br>
			반품 : <a href=""> </a><br>
		</td>
	</tr>
</table>

<%
	String contextPath=request.getContextPath();
%>
<table class="table">
	<tr class="active">
		<td>
			<a href="${cp }/user/purchase"  style="text-decoration:none">
			ORDER 주문내역 조회<br>
			고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
			비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href=""  style="text-decoration:none">
			PROFILE 회원 정보<br>
			회원이신 고객님의 개인정보를 관리하는 공간입니다.
			개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href=""  style="text-decoration:none">
			WISHLIST 관심 상품<br>
			관심상품으로 등록하신 상품의 목록을 보여드립니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href=""  style="text-decoration:none">
			MILEAGE 적립금<br>
			적립금은 상품 구매 시 사용하실 수 있습니다.
			적립된 금액은 현금으로 환불되지 않습니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href=""  style="text-decoration:none">
			COUPON쿠폰<br>
			고객님이 보유하고 계신 쿠폰내역을 보여드립니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href="" style="text-decoration:none">
			BOARD 게시물 관리<br>
			고객님께서 작성하신 게시물을 관리하는 공간입니다.
			고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.
			</a>
		</td>
	</tr>
	<tr class="active">
		<td>
			<a href=""  style="text-decoration:none">
			ADDRESS 배송 주소록 관리<br>
			자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.
			</a>
		</td>		
	</tr>
</table>

