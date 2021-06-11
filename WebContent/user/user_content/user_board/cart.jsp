<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
order
<form action="../../../payment" method="post">
	<br>
	<!-- 회원정보뜨게!!! -->
	${sessionScope.id } 님은, [${gradevo.glevel }] 회원이십니다.
	<br>
	1,000 이상 구매시 ${per }%을 추가적립 받으실 수 있습니다.
	<br>
	보유적립금: ${membervo.mmileage }원 &nbsp; 쿠폰:0개
	<br>
	카트내역
	<br>
	<table class="table">
		<tr>
			<th><input type="checkbox"></th>
			<th>이미지</th>
			<th>상품정보</th>
			<th>판매가</th>
			<th>수량</th>
			<th>적립금</th>
			<th>배송비</th>
			<th>합계</th>
			<th>선택</th>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td>이미지</td>
			<td>
				상품정보<br>
				<input type="button" value="옵션변경">
			</td>
			<!-- 할인상품이면 할인된거 표시되게 하기 -->
			<td>판매가</td>
			<td>
				<input type="number">
				<input type="button" value="변경">
			</td>
			<td>적립금</td>
			<td>배송구분</td>
			<td>배송비</td>
			<td>합계</td>
			<td>
				<input type="button" value="주문하기">
				<input type="button" value="관심상품등록">
				<input type="button" value="삭제">	
			</td>
		</tr>
		<!-- 
		<tr>
			<td>[기본배송]</td>
			<td>상품구매금액 66,000+배송비 0(무료)-상품할인금액 6,600=합계: </td>
			<th>59,400</th>
		</tr>
		 -->
	</table>
	선택상품 <input type="button" value="삭제">
	<input type="button" value="장바구니 비우기" style="float: right;">
	<table class="table">
		<tr>
			<td>총 상품 금액</td>
			<td>배송비</td>
			<td>총 할인금액 <input type="button" value="내역보기"></td>
			<td>결제예정 금액</td>
		</tr>	
		<tr>
			<th>66,000</th>
			<th>+0</th>
			<th>-6,600</th>
			<th>=59,400</th>
		</tr>	
	</table>
	<input type="submit" value="전체상품주문">
	<input type="submit" value="선택상품주문">
	<input type="button" value="쇼핑계속하기">
</form>
<h4>이용안내</h4>
장바구니 이용안내
<ul>
	<li>
		해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.
	</li>
	<li>
		해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.
	</li>
	<li>
		선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.
	</li>
	<li>
		[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.
	</li>
	<li>
		장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.
	</li>
	<li>
		파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.
	</li>
</ul>
무이자할부 이용안내
<ul>
	<li>
		상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.
	</li>
	<li>
		[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.
	</li>
	<li>
		단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.
	</li>
</ul>
