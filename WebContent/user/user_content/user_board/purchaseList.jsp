<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String OrderList=(String)session.getAttribute("OrderList");
%>
order list
<!-- 주문내역 갯수 count -->
주문내역조회(x개)
<div role="tabpanel">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">주문내역조회</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">취소/반품/교환내역</a></li>
  </ul>
  <!-- Tab panes -->
  <form action="${cp }/user/purchase" method="post">
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<select name = "field">
				<option value="전체 주문리스트"<c:if test="${field=='orderall' }">selected="selected"</c:if>>전체 주문리스트</option>
				<option value="배송 준비중"<c:if test="${field=='ready' }">selected="selected"</c:if>>배송 준비중</option>
				<option value="배송중"<c:if test="${field=='halfway' }">selected="selected"</c:if>>배송중</option>
				<option value="배송완료"<c:if test="${field=='finish' }">selected="selected"</c:if>>배송완료</option>
				<option value="취소"<c:if test="${field=='cancel' }">selected="selected"</c:if>>취소</option>
				<option value="교환"<c:if test="${field=='exchange' }">selected="selected"</c:if>>교환</option>
				<option value="반품"<c:if test="${field=='return' }">selected="selected"</c:if>>반품</option>
		</select>
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active">
		    <input type="radio" name="options" value="option1" autocomplete="off" checked> 오늘
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option2" autocomplete="off"> 1주일
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option3" autocomplete="off"> 1개월
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option4"  autocomplete="off"> 3개월
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option5" autocomplete="off"> 6개월
		  </label>
		</div>
		<div>
			<input type="date" id="3mago"/>~<input type="date" id="currentDate"/><input type="submit" value="조회">
		</div>
		
		</form>
		<script type="text/javascript">	
			document.getElementById("currentDate").value= 
				new Date().toISOString().substring(0,10);
		
			$("input:radio[name=options]").click(function () {
			var radioValue = $(this).val();
			if(radioValue=="option1"){
			let now = new Date();//오늘
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth()+1)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option2"){
			let now = new Date();//1주 전부터
			let day = ("0" + now.getDate()-7).slice(-2);
			let month = ("0" + (now.getMonth()+1)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option3"){
			let now = new Date();//1달 전부터
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth())).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option4"){
			let now = new Date();//3달 전부터
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth() -2)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option5"){
			let now = new Date();//6달 전부터
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth() -5)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			}

			});
		</script>
		<ul>
			<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
		</ul>
		<br>
		<h4>상품정보</h4>
		<table class="table">
			<tr class="active">
				<th>주문일자<br>[주문번호]</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매금액</th>
				<th>주문처리상태</th>
				<th>취소/교환/반품<th>
			</tr>
			<c:choose>
				<c:when test="${empty OrderList}">
					<tr>
						<td>주문내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
							<td rowspan="${fn:length(OrderList)}">${vo.ordate }<br>[${vo.orid }]</td>
					<c:forEach var="vo" items="${OrderList }" varStatus="status">
						<tr>
							<c:when test="${vo.orid }">
							</c:when>
							<td>${vo.pimage2 }</td>
							<td>${vo.sname }<br>${vo.odcolor }</td>
							<td>${vo.odcount }</td>
							<td>${vo.pprice }</td>
							<td>${vo.ordelivery }</td>
							<td>${vo.orcancel }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<!-- 페이징처리!!!!!!!!!!!!!!!!!! -->
    <div role="tabpanel" class="tab-pane" id="profile">
	    취소환불교환내역
	    <form action="${cp }/user/purchase" method="post">
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active">
		    <input type="radio" name="options" id="option1" autocomplete="off" checked> 오늘
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option2" autocomplete="off"> 1주일
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option3" autocomplete="off"> 1개월
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option4" autocomplete="off"> 3개월
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option5" autocomplete="off"> 6개월
		  </label>
		</div>
		<div>
			<input type="date" id="3mago1">~<input type="date" id="currentDate1"><input type="submit" value="조회">
		</div>
		</form>
				<script type="text/javascript">
				var now = new Date(); //3달 전부터
				var day = ("0" + now.getDate()).slice(-2);
				var month = ("0" + (now.getMonth() -2)).slice(-2);
				var today = now.getFullYear()+"-"+(month)+"-"+(day) ;

				$('#3mago1').val(today);
				
			//document.getElementById("3mago1").value= 
			//new Date().toISOString().substring(0,10);
		
			document.getElementById("currentDate1").value= 
			new Date().toISOString().substring(0,10);
		</script>
		<ul>
			<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
		</ul>
		<br>
		<h4>상품정보</h4>
		<table class="table">
			<tr class="active">
				<th>주문일자<br>[주문번호]</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매금액</th>
				<th>주문처리상태</th>
				<th>취소/교환/반품<th>
			</tr>
			<c:choose>
				<c:when test="${empty OrderList}">
					<tr>
						<td>취소, 교환, 환불내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="vo" items="${OrderList }">
						<c:forEach var ="i" begin="1" end="${vo.orid }" varStatus="status">
						<tr> 
							<td colspan="${fn:length(OrderList)}">${vo.ordate }<br>[${vo.orid }]</td>
							<td>${vo.pimage2 }</td>
							<td>${vo.sname }<br>${vo.odcolor }</td>
							<td>${vo.odcount }</td>
							<td>${vo.pprice }</td>
							<td>${vo.ordelivery }</td>
							<td>${vo.orcancel }</td>
						</tr>
						</c:forEach>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<!-- 페이징처리!!!!!!!!!!!!!!!!!! -->
			<c:if test="${startPageNum>10 }">
		<a href="${cp}/user/purchase?pageNum=${startPageNum-1 }&field=${field}">[이전]</a> <!-- 현재페이지 보이기 -->
		</c:if>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }">
					<a href="${cp}/user/purchase?pageNum=${i }&field=${field}">
					<span style="color:blue">[${i }]</span></a>
					<!-- <a href="${cp}/board/list?pageNum=${i}" 로 줘도 됨 -->
				</c:when>
				<c:otherwise>
					<a href="${cp}/user/purchase?pageNum=${i }&field=${field}">
					<span style="color:gray">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${endPageNum<pageCount }">
			<a href="${cp}/user/purchase?pageNum=${endPageNum+1 }&field=${field}">[다음]</a>
		</c:if>
	</div>
</div>
<script>
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show')
	})
</script>

