<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
order
<form action="${pageContext.request.contextPath }/payment">
	<br>
	${sessionScope.id } 님은, [FAMILY] 회원이십니다.
	<br>
	1,000 이상 구매시 1%을 추가적립 받으실 수 있습니다.
	<br>
	가용적립금: 1000원 &nbsp; 쿠폰:0개
	<br>
	주문할 상품 내역
	<br>
	<table class="table">
		<tr class="active">
			<th><input type="checkbox" id="topcheck" onclick="checkAll()"></th>
			<th>이미지</th>
			<th>상품정보</th>
			<th>판매가</th>
			<th>수량</th>
			<th>적립금</th>
			<th>배송비</th>
			<th>합계</th>
		</tr>
			<c:forEach begin="0" end="${leng-1 }" var="i" >
		<tr>
			<td><input type="checkbox" name="check"></td>
			<td><img src="${cp }${productvo.pimage2 } "style = "width:100px; height:outo;"></td>
				<th>${stockvo.sname }<br><br>[옵션: ${size[i] }, ${color[i] }]</th>
				<td>${productvo.pprice*(100-productvo.pdiscount)/100}</td>
				<td>${amount[i] }</td>
				<td>${mileage[i] }</td>
				<td>무료</td>
				<td>${productvo.pprice*(100-productvo.pdiscount)/100*amount[i]}</td>
		</tr>
			</c:forEach>
	</table>
	<script>
		function checkAll(){
			let check = document.getElementsByName("check");
			let topcheck = document.getElementById("topcheck");
			if(topcheck.checked){
				for(i=0; i < check.length; i++) {
					check[i].checked = true;
				}
			}else{
				for(i=0; i < check.length; i++) {
					check[i].checked = false;
				}
			}
		}
	</script>
		<%--
		<tr>
			<td>${vo.num }</td>
			<td>${vo.writer }</td>
			<td>
			<c:if test="${ vo.lev>0}">
				<c:forEach var="i" begin="1" end ="${vo.lev }">
					&nbsp;&nbsp;				
				</c:forEach>
				[re]
			</c:if>
			<a href = "detail?num=${vo.num }">${vo.title }</a></td>
		</tr>
		</table>
		<!-- 페이징 처리 -->
		<div>
			<c:if test="${pageNum>10 }">
				<a href="list?pageNum=${startPageNum-1 }">이전페이지</a>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${pageNum==i }">
						<a href="list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
					</c:when>
					<c:otherwise>
						<a href="list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageCount>endPageNum }">
				<a href="$list?pageNum=${endPageNum+1 }">다음페이지</a>
			</c:if>
		</div>
		<!-- 
		<tr>
			<td>[기본배송]</td>
			<td>상품구매금액 66,000+배송비 0(무료)-상품할인금액 6,600=합계: </td>
			<th>59,400</th>
		</tr>
		 -->
	 --%>
	선택상품 <input type="button" value="삭제" onclick="delete()">
	<h4>주문정보</h4>
	<table class="table">
		<tr>
			<td>주문하시는분</td>
			<td><input id = "upname"type="text"></td>
		</tr>	
		<tr>
			<td>주소</td>
			<td>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요. -->
        	<input type="text" name="postcode" placeholder="우편번호">
        	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
        	<input type="text" name="roadAddress" placeholder="도로명주소" readonly="readonly">
        	<input type="text" name="jibunAddress" placeholder="지번주소" readonly="readonly">
        	<span id="guide" style="color:#999; display:none"></span>
        	<input type="text" name="detailAddress" placeholder="상세주소">
        	<input type="text" name="extraAddress" placeholder="참고항목" readonly="readonly">

        	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        	<script>
        	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        	    function execDaumPostcode() {
        	        new daum.Postcode({
        	            oncomplete: function(data) {
        	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        	                var roadAddr = data.roadAddress; // 도로명 주소 변수
        	                var extraRoadAddr = ''; // 참고 항목 변수

        	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        	                    extraRoadAddr += data.bname;
        	                }
        	                // 건물명이 있고, 공동주택일 경우 추가한다.
        	                if(data.buildingName !== '' && data.apartment === 'Y'){
        	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        	                }
        	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        	                if(extraRoadAddr !== ''){
        	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
        	                }

        	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
        	                document.getElementsByName('postcode')[0].value = data.zonecode;
        	                document.getElementsByName("roadAddress")[0].value = roadAddr;
        	                document.getElementsByName("jibunAddress")[0].value = data.jibunAddress;
        	                
        	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
        	                if(roadAddr !== ''){
        	                    document.getElementsByName("extraAddress")[0].value = extraRoadAddr;
        	                } else {
        	                    document.getElementsByName("extraAddress")[0].value = '';
        	                }

        	                var guideTextBox = document.getElementById("guide");
        	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        	                if(data.autoRoadAddress) {
        	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
        	                    guideTextBox.style.display = 'block';

        	                } else if(data.autoJibunAddress) {
        	                    var expJibunAddr = data.autoJibunAddress;
        	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
        	                    guideTextBox.style.display = 'block';
        	                } else {
        	                    guideTextBox.innerHTML = '';
        	                    guideTextBox.style.display = 'none';
        	                }
        	            }
        	        }).open();
        	    }
        	</script>
			</td>
		</tr>	
		<tr>
			<td>휴대전화</td>
			<td>
				<input type="text" id="gophone" style="width:300px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" onblur="siseck()"/>
				<span id="gophonecheck"></span>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email"><br>
				이메일을 통해 주문처리과정을 보내드립니다.<br>
				이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요
			</td>
		</tr>	
	</table>
	<h4>배송정보</h4>
	<table class="table">
		<tr>
			<td>배송지선택</td>
			<td>
			<input type="radio" name="dir" checked="checked" onclick="oldclick()">등록한 정보 
			<input type="radio"  name="dir" onclick="newDirec()">새로운배송지 
			<input type="radio"  name="dir" onclick="sameDirec()">주문자 정보와 동일
			</td>
		</tr>
		<tr>
			<td>받으시는 분</td>
			<td><input type="text"type="visible" style="width:300px;" name = "saveDir" value="${membervo.addname }" readonly="readonly">
			<input type="hidden" type="text" name = "newDir" style="width:300px;">
			<input type="hidden" type="text" id = "downname"name = "upDir" style="width:300px;" readonly="readonly">
			</td>
		</tr>	
		<tr>
			<td>주소</td>
			<td>
			<input type="text"type="visible"  name = "saveDir" value="${membervo.maddress }" readonly="readonly" style="width:1000px;">
			<input type="hidden"type="text" name = "newDir" style="width:1000px;">
			<input type="hidden"type="text" name = "upDir" id="downadd" style="width:1000px;"readonly="readonly">
			</td>
		</tr>	
		<tr>
			<td>휴대전화</td>
			<td>
			<input type="text"type="visible"  name = "saveDir" value="${membervo.addphone }" readonly="readonly" style="width:300px;">
			<input type="hidden" type="text" name = "newDir" id="inputphonenum" style="width:300px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" onblur="newcheck()"/>
			<input type="hidden" type="text" name = "upDir" id="downphone" style="width:300px;" readonly="readonly">
			<span id="newphonecheck"></span>
			</td>
		</tr>	
		<tr>
			<td>배송메시지</td>
			<td><textarea rows="2" cols="50" name="content"style="width:300px;"></textarea></td>
		</tr>	
	</table>
	<script>
		function sameDirec(){
			let upDir = document.getElementsByName("upDir");
			let newDir = document.getElementsByName("newDir");
			let saveDir = document.getElementsByName("saveDir");
			let upname = document.getElementById("upname");
			let downname = document.getElementById("downname");
			let gophone = document.getElementById("gophone");
			let downphone = document.getElementById("downphone");
			let downadd = document.getElementById("downadd");
			let roadAddress=document.getElementsByName("roadAddress")[0];
			let detailAddress = document.getElementsByName("detailAddress")[0];
			downname.value=upname.value;
			downphone.value=gophone.value;
			downadd.value=roadAddress.value+" "+detailAddress.value;
			for (var i = 0; i < newDir.length; i++) {
				saveDir[i].type="hidden";
				newDir[i].type="hidden";
				upDir[i].type="visible";
			}
		}
		function newcheck(){
			let gophone = document.getElementById("gophone");
			let newphonecheck = document.getElementById("newphonecheck");
			if(gophone.value.length!=11){
				newphonecheck.innerHTML="11자를 입력해주세요"
			}else{
				newphonecheck.innerHTML="입력성공";
			}
		}
		function siseck(){
			let gophone = document.getElementById("gophone");
			let gophonecheck = document.getElementById("gophonecheck");
			if(gophone.value.length!=11){
				gophonecheck.innerHTML="11자를 입력해주세요"
			}else{
				gophonecheck.innerHTML="입력성공";
			}
		}
		function oldclick(){
			let upDir = document.getElementsByName("upDir");
			let newDir = document.getElementsByName("newDir");
			let saveDir = document.getElementsByName("saveDir");
			for (var i = 0; i < newDir.length; i++) {
				saveDir[i].type="visible";
				newDir[i].type="hidden";
				upDir[i].type="hidden";

			}
			let xhr = new XMLHttpRequest();
			let getPer = document.getElementById("getPer");
			xhr.open("get","<%=request.getContextPath() %>/user/user_content/user_board/addressSelect.jsp?id=",true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					let result = xhr.responseText;
					let json = JSON.parse(result);
					getPer.innerHTML=json.addname;
				}
			}
		}
		function newDirec(){
			let upDir = document.getElementsByName("upDir");
			let newDir = document.getElementsByName("newDir");
			let saveDir = document.getElementsByName("saveDir");
			for (var i = 0; i < newDir.length; i++) {
				saveDir[i].type="hidden";
				newDir[i].type="visible";
				upDir[i].type="hidden";
			}
		}
	</script>	
	<!-- 추가 정보 없애기?????????????????????? -->
	<h4>결제 예정 금액</h4>
	<table class="table">
		<tr>
			<td>총 주문 금액<input type = "button" value="내역보기"></td>
			<td>총 할인+부가결제 금액</td>
			<td>총 결제예정 금액</td>
		</tr>	
		<tr>
			<th>${productvo.pprice }</th>
			<th>-${productvo.pprice*productvo.pdiscount/100 }</th>
			<th>=${productvo.pprice*(100-productvo.pdiscount)/100 }</th>
		</tr>	
	</table>
	<table class="table">
		<tr>
			<th>총 할인금액</th>
			<th>-${productvo.pprice*productvo.pdiscount/100 }</th>
		</tr>	
		<tr>
			<td>추가할인금액</td>
			<td>-${productvo.pprice*productvo.pdiscount/100 }<input type="button" value="내역보기"></td>
		</tr>	
		<tr>
			<td>총 부가결제금액</td>
			<td>0</td>
		</tr>	
		<tr>
			<td>적립금</td>
			<td><input type="text">원(총 사용가능 적립금: ${membervo.mmileage }원)</td>
		</tr>	
		<tr>
			<td></td>
			<td>
				적립금은 최소 1,000 이상일 때 결제가 가능합니다.<br>
				최대 사용금액은 제한이 없습니다.<br>
				1회 구매시 적립금 최대 사용금액은 1,000원입니다.<br>
				적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.
			</td>
		</tr>	
	</table>
	<h4>결제</h4>
	<table class="table">
		<tr><td colspan="2">최종결제금액</td></tr>
		<tr><td colspan="2">총가격표시하기!!!</td></tr>
		<tr><td colspan="2"><input type="submit" value="결제하기"></td></tr>
		<tr>
			<th>총 적립예정금액</th>
			<th>1,250원</th>
		</tr>
		<tr>
			<td>상품별 적립금<br>회원 적립금</td>
			<td>표시하기!!!<br>표시하기!!!</td>
		</tr>
	</table>
</form>
<h4>무이자 할부 이용안내</h4>
무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br>
무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
<h4>이용안내</h4>
WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.
<ul>
	<li>안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</li>
	<li>Service Pack 2에 대한 Microsoft사의 상세안내</li>
</ul>
아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.
<ul>
	<li>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
	<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>
		(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)
	</li>
	<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br>
		(무통장, 휴대폰결제 포함)
	</li>
</ul>
세금계산서 발행 안내
<ul>
	<li>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
	<li>세금계산서는 사업자만 신청하실 수 있습니다.</li>
	<li>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
	<li>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
	<li>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
</ul>
부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내
<ul>
	<li>
		변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며<br>
		신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)
	</li>
	<li>
		상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.
	</li>
</ul>
현금영수증 이용안내
<ul>
	<li>
		현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.
	</li>
	<li>
		현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.
	</li>
	<li>
		발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.
	</li>
	<li>
		현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)
	</li>
	<li>
		현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.
	</li>
</ul>
