<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	int Countorid=(int)request.getAttribute("Countorid");
%>
order list
<!-- 주문내역 갯수 count -->
주문내역조회(<%= Countorid%>개)
<div role="tabpanel">
  <ul class="nav nav-tabs" role="tablist" id="mytab">
    <li role="presentation" ><a href="#home" aria-controls="home" role="tab" data-toggle="tab">주문내역조회</a></li>
    <li role="presentation" ><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">취소/반품내역</a></li>
  </ul>
  <!-- Tab panes -->
	<div class="tab-content">
 	<div role="tabpanel" class="tab-pane active" id="home">
  <form action="${cp }/user/purchase" method="post" >
    <input type="hidden" name="tab"  value="home" > 
    	<select name = "field">
				<option value="orderall"<c:if test="${field=='orderall' }">selected="selected"</c:if>>전체 주문리스트</option>
				<option value="halfway"<c:if test="${field=='halfway' }">selected="selected"</c:if>>배송중</option>
				<option value="finish"<c:if test="${field=='finish' }">selected="selected"</c:if>>배송완료</option>
				<option value="cancel"<c:if test="${field=='cancel' }">selected="selected"</c:if>>취소</option>
				<option value="return"<c:if test="${field=='return' }">selected="selected"</c:if>>반품</option>
		</select>
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active" id="t">
		    <input type="radio" name="options" value="option1" autocomplete="off"  > 오늘
		  </label>
		  <label class="btn btn-primary" id="1w">
		    <input type="radio" name="options" value="option2" autocomplete="off"> 1주일
		  </label>
		  <label class="btn btn-primary" id="1m">
		    <input type="radio" name="options" value="option3" autocomplete="off"> 1개월
		  </label>
		  <label class="btn btn-primary" id="3m">
		    <input type="radio" name="options" value="option4"  autocomplete="off" checked="checked"> 3개월
		  </label>
		  <label class="btn btn-primary" id="6m">
		    <input type="radio" name="options" value="option5" autocomplete="off"> 6개월
		  </label>
		</div>
		<div>
			<input type="text" id="datepicker" name="startdate"/>~<input type="text" id="currentDate" name="enddate"/><input type="submit" value="조회">
		</div>
		
		</form>
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
				<th>취소/반품<th>
				
			</tr>
			<c:choose>
				<c:when test="${empty OrderList}">
					<tr>
						<td>주문내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
						<c:forEach var="vo" items="${OrderList }">
						<tr>
						<td>${vo.ordate }<br>[${vo.orid }]</td>
						<td><img src = "${cp }${vo.pimage2}"></td>
						<td>${vo.sname }<br>${vo.odcolor }<br>사이즈:${vo.odsize }</td>
						<td>${vo.odcount }</td>
						<td>${vo.pprice }</td>
						<td>${vo.ordelivery }<br><input type="button" value="구매후기" onclick="valuesend()"></td>
						<td>${vo.orcancel }</td>
						</tr>
						</c:forEach>

				</c:otherwise>
			</c:choose>
		</table>
		</div>
	<!-- 페이징처리!!!!!!!!!!!!!!!!!! -->

    <div role="tabpanel" class="tab-pane" id="profile">
	    취소환불내역
	    <form action="${cp }/user/purchase" method="post">
	    <input type="hidden" name="tab"  value="profile" > 
	 
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active" id="t1">
		    <input type="radio" name="options"  autocomplete="off" > 오늘
		  </label>
		  <label class="btn btn-primary" id="1w1">
		    <input type="radio" name="options"  autocomplete="off"> 1주일
		  </label>
		  <label class="btn btn-primary" id="1m1">
		    <input type="radio" name="options"  autocomplete="off" > 1개월
		  </label>
		  <label class="btn btn-primary" id="3m1">
		    <input type="radio" name="options"  autocomplete="off" checked="checked"> 3개월
		  </label>
		  <label class="btn btn-primary" id="6m1">
		    <input type="radio" name="options"  autocomplete="off"> 6개월
		  </label>
		</div>
		<div>
			<input type="text" id="datepicker1" name="startdate">~<input type="text" id="currentDate1" name="enddate"><input type="submit" value="조회">
		</div>
		</form>
		<ul>
			<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
		</ul>
		<br>
		<h4>상품정보</h4>
		<form name="frm" method="post" >
		<table class="table">
			<tr class="active">
				<th>주문일자<br>[주문번호]</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매금액</th>
				<th>주문처리상태</th>
				<th>취소/반품<th>
			</tr>
			<c:choose>
				<c:when test="${empty refundList}">
					<tr>
						<td>취소, 환불내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="vo" items="${refundList }">
						<tr> 
							<td>${vo.ordate }<br>[${vo.orid }]</td>
							<td><img src = "${cp }${vo.pimage2}"></td>
							<td>${vo.sname }<br>${vo.odcolor }<br>사이즈:${vo.odsize }</td>
							<td>${vo.odcount }</td>
							<td>${vo.pprice }</td>
							<td>${vo.ordelivery }<br>
							<input type="button" value="구매후기" onclick="valuesend()"></td>
							<td>${vo.orcancel }</td>
						</tr>
						<input type="hidden" name="sname" value="${vo.sname }">
						<input type="hidden" name="ordate" value="${vo.ordate }">
						<input type="hidden" name="orid" value="${vo.orid }">
						<input type="hidden" name="odcolor" value="${vo.odcolor }">
						<input type="hidden" name="odsize" value="${vo.odsize }">
						<input type="hidden" name="odcount" value="${vo.odcount }">
						<input type="hidden" name="pimage2" value="${vo.pimage2 }">
						<input type="hidden" name="odid" value="${vo.odid }">
						<input type="hidden" name="pid" value="${vo.pid }">
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		</div>
	</div>
	<!-- 페이징처리!!!!!!!!!!!!!!!!!! -->
</div>
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


<script type="text/javascript">	
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	//  $(this).tab('show')
	});
	
	window.onload=function(){
		
	}
	
	$("#currentDate1").datepicker().datepicker("setDate", new Date());
//document.getElementById("currentDate1").value= 
//new Date().toISOString().substring(0,10);
$("#datepicker1").datepicker().datepicker("setDate", '-3M');
 $(function() {
	// alert('${param.tab}');
	 let tab='${param.tab}';
	// alert( $("#"+tab));
	 if(tab=="profile")
	 $("#mytab a:last").tab("show");
	 if(tab=="home")
		 $("#mytab a:first").tab("show");
	//$('.tab-pane a[href="#' + tab + '"]').tab('show');
        //input을 datepicker로 선언
        $("#datepicker1").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });                    
        $("#3m1").click(function(){
         	  $('#datepicker1').datepicker('setDate', '-3M');
           })
        //$('input:checkbox[input[name="options"]:checked').val(); // 체크된 값(checked value)
       $("#t1").click(function(){
     	  $('#datepicker1').datepicker('setDate', 'today'); 
       })
       $("#1w1").click(function(){
     	  $('#datepicker1').datepicker('setDate', '-7D');
       })
       $("#1m1").click(function(){
     	  $('#datepicker1').datepicker('setDate', '-1M');
       })
        $("#3m1").click(function(){
     	  $('#datepicker1').datepicker('setDate', '-3M');
       })
         $("#6m1").click(function(){
     	  $('#datepicker1').datepicker('setDate', '-6M');
       }) 
 		/*구매버튼 이벤트*/
 	
 });
			/*input type ="date" 인 경우 기본값 설정
			document.getElementById("currentDate").value= 
				new Date().toISOString().substring(0,10);*/
				$("#datepicker").datepicker().datepicker("setDate", '-3M');
				$("#currentDate").datepicker().datepicker("setDate", new Date());
			 $(function() {
		            //input을 datepicker로 선언
		            $("#datepicker").datepicker({
		                dateFormat: 'yy-mm-dd' //Input Display Format 변경
		                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		                ,changeYear: true //콤보박스에서 년 선택 가능
		                ,changeMonth: true //콤보박스에서 월 선택 가능                
		                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		                ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		            }); 
		            $("#3m").click(function(){
	                  	  $('#datepicker').datepicker('setDate', '-3M');
	                    })
			            //$('input:checkbox[input[name="options"]:checked').val(); // 체크된 값(checked value)
	                      $("#t").click(function(){
	                    	  $('#datepicker').datepicker('setDate', 'today'); 
	                      })
	                      $("#1w").click(function(){
	                    	  $('#datepicker').datepicker('setDate', '-7D');
	                      })
	                      $("#1m").click(function(){
	                    	  $('#datepicker').datepicker('setDate', '-1M');
	                      })
	                       $("#3m").click(function(){
	                    	  $('#datepicker').datepicker('setDate', '-3M');
	                      })
	                        $("#6m").click(function(){
	                    	  $('#datepicker').datepicker('setDate', '-6M');
	                      }) 
			 });
			 
			 function valuesend(){
				 window.open("", "value", "width=550, height=650, left=650, top=140, scrollbars=1, menubar=1, resizable=1"); 
					 document.frm.target ="value";     
					 document.frm.action="<%=request.getContextPath()%>/user/user_content/user_board/userreview.jsp";
				 	 document.frm.submit();
				}
</script>

