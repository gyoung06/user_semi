<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/inbound.css">


<div class="inboundinput">
<h3 class="inboundtext2">입고등록</h3>
<form action="${cp }/admin/inbound/insert" method="post">
	<label class="label_incategory">품목</label><input type="text" name="input_incategory" style="position:absolute;top:100px;left:150px;width: 150px;font-size: 0.8rem;"/>
	<select onchange="chang_incategory()" id="select_category">
		<option value="outer">outer</option>
		<option value="top">top</option>
		<option value="ops">ops</option>
		<option value="skirt">skirt</option>
		<option value="pants">pants</option>
		<option value="shoes_bag">shoes_bag</option>
		<option value="acc">acc</option>
	</select>
	<label class="label_inname">상품명</label><input type="text" name="input_inname" style=" position: absolute;top:50px;left:150px;width: 500px;font-size: 0.8rem;"/>
	<label class="label_indate">입고일</label><input type="text" name="input_indate" style="position:absolute;top:200px;left:150px;width: 150px;font-size: 0.8rem;" />
	<label class="label_incolor">색상</label><input type="text" name="input_incolor" style="position:absolute;top:150px;left:150px;width: 150px;font-size: 0.8rem;" />
	<select onchange="chang_incolor()" id="select_color">
		<option value="화이트">화이트</option>
		<option value="스킨">스킨</option>
		<option value="블랙">블랙</option>
		<option value="스카이퍼플">네이비</option>
		<option value="코랄핑크">블랙</option>
		<option value="브라운">브라운</option>
		<option value="아이보리">아이보리</option>
	</select>
	<label class="label_insize">사이즈</label><input type="text" name="input_insize" style="position:absolute;top:150px;left:500px;width: 95px;font-size: 0.8rem;"/>
		<select onchange="chang_insize()" id="select_size">
		<option value="S">S</option>
		<option value="M">M</option>
		<option value="L">L</option>
		<option value="XL">XL</option>
		<option value="FREE">FREE</option>
	</select>
	<label class="label_inprice">가격</label><input type="text" name="input_inprice" style="position:absolute;top:200px;left:500px;width: 150px;font-size: 0.8rem;"/>
	<label class="label_inamount">입고량</label><input type="text" name="input_inamount" style="position:absolute;top:100px;left:500px;width: 150px;	font-size: 0.8rem;"/>
	<input type="submit" value="등록" id="insertbtn">
</form>
<h3 class="inboundtext3">50개미만 상품</h3>
<div id="columnchart_material"></div>
</div>

<div class="boardcss_list_table">
<h3 class="inboundtext1">입고리스트</h3>	
	<table class="list_table">
		<thead>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>가격</th>
			<th>품목</th>
			<th>입고량</th>
			<th>입고날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.inid }</td>
				<td>${vo.inname }</td>
				<td>${vo.incolor }</td>
				<td>${vo.insize }</td>
				<td>${vo.inprice }</td>
				<td>${vo.incategory }</td>
				<td>${vo.inamount }</td>
				<td>${vo.indate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="page">
	<c:if test="${startPageNum>10 }">
		<a href="${cp}/admin/inbound/list?pageNum=${startPageNum -1 }&field=${field}&keyword=${keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${i==pageNum }">
				<a href="${cp }/admin/inbound/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:red">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/inbound/list?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:blue">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/inbound/list?pageNum=${endPageNum+1 }&field=${field}&keyword=${keyword}">[다음]</a>
	</c:if>
</div>
<div class="find">
	<form method="post" action="${cp }/admin/inbound/list">
		<select name="field">
			<option value="inname" <c:if test="${field=='inname' }">selected="selected"</c:if>>상품명</option>
			<option value="inname" <c:if test="${field=='incategory' }">selected="selected"</c:if>>품목</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
	['Year', 'Sales', 'Expenses', 'Profit'],
	['2014', 1000, 400, 200],
	['2015', 1170, 460, 250],
	['2016', 660, 1120, 300],
	['2017', 1030, 540, 350]]);

    var options = {
      chart: {
        title: 'Company Performance',
        subtitle: 'Sales, Expenses, and Profit: 2014-2017',
      }
    };

    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
		chart.draw(data, google.charts.Bar.convertOptions(options));
  	}
	
	
	function chang_incategory(){
		var select=document.getElementById("select_category");
		document.getElementsByName("input_incategory")[0].value=select.options[select.selectedIndex].text;
	}
	function chang_incolor(){
		var select=document.getElementById("select_color");
		document.getElementsByName("input_incolor")[0].value=select.options[select.selectedIndex].text;
	}
	function chang_insize(){
		var select=document.getElementById("select_size");
		document.getElementsByName("input_insize")[0].value=select.options[select.selectedIndex].text;
	}
</script>
</div>
