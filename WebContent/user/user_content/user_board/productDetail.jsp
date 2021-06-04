<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<tr>
		<th rowspan="9"><img src = "${cp }${vo.pimage2}"></th>
	</tr>
	<tr>
		<th colspan="2">${stockVo.sname}</th>
	</tr>
	<tr>
		<td>정가</td>
		<td>${vo.pprice }원</td>
	</tr>
	<tr>
		<td>할인가격</td>
		<td>${vo.pprice*(100-vo.pdiscount)/100 }원</td>
	</tr>
	<tr>
		<td>색상</td>
		<td>
			<select style="border: 2px solid black" onchange="colorchange()">
				<option >--[필수]--옵션을 선택해 주세요</option>
				<c:forEach var="c" items="${colorList }">
					<option name = "color">${c }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>사이즈</td>
		<td>
			<select style="border: 2px solid black">
				<option>--[필수]--옵션을 선택해 주세요</option>
				<div id = "sizeOp">
				</div>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">위 옵션선택 박스를 모두 선택하시면 아래에 상품이 추가됩니다.</td>
	</tr>
	<tr>
	<tr>
		<td></td>
	</tr>
	<script>
		function colorchange(){
			let sizeOp = document.getElementById("sizeOp");
			let xhr = new XMLHttpRequest();
			const scolor = document.getElementsByName("color")[0].value;
			xhr.open("get","<%=request.getContextPath() %>/user/user_content/user_board/productDetailServer.jsp?scolor="+scolor,true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					let result = xhr.responseText;
					let json = JSON.parse(result);
					for (var i = 0; i < json.list.length; i++) {
						const color = document.createElement("option");
						color.innerHTML=json.list[i].ssize;
						console.log(json.list[i].ssize)
						//sizeOp.appendChild(color);
					}
				}
			}
		}
		
	</script>
	</tr>
	<tr>
		<td colspan="2">total: 0(0개)</td>
	</tr>
	<tr>
		<td><input id = "buy" type = "button" style="align-content: center; padding:10px 10px; border: 2px solid black; width: 150px;" value="buy now" size="5"></td>
		<td><input id = "cart" type = "button" style="padding:10px 10px; border: 2px solid black; width: 150px; " value="add to cart"></td>
	</tr>
</table>
<script>
	let buy = document.getElementById("buy");
	let cart = document.getElementById("cart");
	buy.addEventListener('mouseover', function(e) {
		e.target.value="구매하기";
	});
	buy.addEventListener('mouseout', function(e) {
		e.target.value="buy now";
	});
	cart.addEventListener('mouseover', function(e) {
		e.target.value="장바구니 추가";
	});
	cart.addEventListener('mouseout', function(e) {
		e.target.value="add to cart";
	});
</script>
<div id="detail" style="padding: 30px 30px 30px 30px">
	<div style="text-align: center">
		<strong><u><a href="#detail">DETAIL</a></u></strong>
		<a href="#guid">GUID</a>
		<a href="#review">REVIEW</a>
		<a href="#qna">QNA</a>
	</div>
<h1>--상품상세설명--${vo.pimage1 }</h1>
</div>
<div id="guid" style="padding: 30px 30px 30px 30px">
	<div style="text-align: center">
		<a href="#detail">DETAIL</a>
		<strong><u><a href="#guid">GUID</a></u></strong>
		<a href="#review">REVIEW</a>
		<a href="#qna">QNA</a>
	</div>
<h4>상품결제정보</h4>
<br>
<h5>[결제안내]</h5>
- 결제는 아래 3가지 방법으로 가능합니다.
<br>
<h5>[무통장입금]</h5> 
- 은행명 : 국민은행 <br>
- 예금주 : (주)j4<br>
- 계좌번호 : 121212-12-121212<br>
** 주문자명과 동일한 입금자명으로 입금 부탁드리며, 주문 후 24시간 이내에 입금이 이루어지지 않을 경우 주문은 자동취소됩니다.
<br>
<h5>[신용카드 결제]</h5> 
- 카드사의 조건에 맞는 무이자 할부 이벤트가 적용됩니다.
<br>
<h5>[휴대폰결제]</h5>
- 이동통신사 정책으로 당월에만 취소 가능하니 신중한 구매 부탁드립니다. (월말 결제 승인으로 인한 환불 시 수수료 3.7% 차감됩니다)
- 휴대폰 결제는 부분취소가 불가능하며, 해당 월 결제건에 한해서만 전체취소가 가능합니다.
<br>
<br>
<br>
<h4>배송정보</h4>
배송 방법 : 택배<br>
배송 지역 : 전국지역<br>
배송 비용 : 2,500<br>
배송 기간 : 3일 ~ 7일<br>
<h5>[배송안내]</h5>
- 배송 방법 : 우체국 택배(1588-1300)<br>
- 배송 지역 : 전국지역(제주)<br>
- 배송 기간 : 3일 ~ 7일<br>
- 배송 안내 : 우체국택배를 이용하며, 5만원 이상 구매 시 무료배송됩니다.<br>
- 배송 비용 : 조건부 무료 = 주문 금액 50,000 won 미만일 때 배송비 2,500 won을 추가합니다.
 ** 고객님께서 주문하신 상품은입금 확인 후 배송해 드립니다.
다만, 공급처 제작 사정 / 택배사 물류 사정 / 기상변화 등 기타 사유로 사전 안내드린 일정보다 배송이 다소 지연될 수 있습니다. 
<br>

<h4>[배송 문의 전 참고사항]</h4>

<h5>배송 일정</h5> 
- 공급처 주말/공휴일 제외한 평균 배송 기간 <br>
- 의류 : 3~7일<br>
- 신발, 가방, 악세사리 등의 주문 제작 상품 3~7일<br>
- 자체 제작 상품 : 3~10일<br>

<h5>배송이 지연되는 경우</h5> 
- 출고 전 마지막 검수 단계에서 불량 관련한 문제점 확인 될 경우 <br>
<h4>교환 및 반품정보</h4>
전자상거래법에 의거하여 상품의 청약철회 가능일은 수령일로부터 7일 이내 입니다.<br>
미리 공지되어 있는 교환/환불 불가한 제품의 경우는 불가능합니다.<br>
교환 또는 반품을 원하실 경우<br>
카카오플러스 '가내스라' 혹은 고객센터(070-8889-3598) 접수 후<br>
우체국택배 수거신청(1588-1300) 부탁드립니다.
검품 후 이상이 없을 시 처리완료됩니다.<br>
더 자세한 교환/반품 안내는 [notice] 게시판 참고 부탁드립니다.
</div>
<div id="review" style="padding: 30px 30px 30px 30px">
	<div style="text-align: center">
		<a href="#detail">DETAIL</a>
		<a href="#guid">GUID</a>
		<strong><u><a href="#review">REVIEW</a></u></strong>
		<a href="#qna">QNA</a>
	</div>
<h1>--리뷰리스트영역--</h1>
</div>
<div id="qna" style="padding: 30px 30px 30px 30px">
	<div style="text-align: center">
		<a href="#detail">DETAIL</a>
		<a href="#guid">GUID</a>
		<a href="#review">REVIEW</a>
		<strong><u><a href="#qna">QNA</a></u></strong>
	</div>
	<table class="table">
	<tr>
		<td>${userVo.qid}</td>
		<td>${userVo.qtitle}</td>
		<td>${userVo.qcontent}</td>
	</tr>
	</table>
</div>
