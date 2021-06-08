<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.min.css">
<h3 style="position:fixed; top:70px;left:550px">월가입자 현황(2020)</h3>
<h3 style="position:fixed;  top:70px;left:1450px;">월매출 현황(2020)</h3>
<div class="border border-3" id="curve_chart" style="position: absolute; top:100px; left:50px; width: 1100px; height: 500px;">
</div>
<div class="border border-3" id="columnchart_material" style="position:absolute;  top:100px;left:1200px; width: 680px; height: 500px;">
</div>

<!-- 하단 바로가기 매뉴 -->
<div class="border border-3" id="member" style=" position:absolute; width: 340px; height: 300px; top:630px; left:52px;">
<img src="<%=request.getContextPath()%>/admin/img/member.jpg" style="position: absolute; top:10px;left:50px;width:200px;height:150px;">
<a href="${cp }/admin/memberlist" style="position: absolute; top:160px;left:130px;font-size:20px; color:black;">회원리스트</a>
<a href="${cp }/admin/memberinsert" style="position: absolute; top:200px;left:130px;font-size:20px; color:black;">회원등록</a>
</div>
<div class="border border-3" id="product" style=" position:absolute; width: 340px; height: 300px; top:630px; left:422px;">
<img src="<%=request.getContextPath()%>/admin/img/product.jpg" style="position: absolute; top:10px;left:50px;width:200px;height:150px;">
<a href="${cp }/admin/inbound/list" style="position: absolute; top:160px;left:130px;font-size:20px; color:black;">입고</a>
<a href="${cp }/admin/product/list" style="position: absolute; top:200px;left:130px;font-size:20px; color:black;">등록/수정</a>
<a href="${cp }/admin/orders/list" style="position: absolute; top:240px;left:130px;font-size:20px; color:black;">출고</a>
</div>
<div class="border border-3" id="stock" style=" position:absolute; width: 340px; height: 300px; top:630px; left:792px;">
<img src="<%=request.getContextPath()%>/admin/img/stock.jpg" style="position: absolute; top:10px;left:50px;width:200px;height:150px;">
<a href="${cp }/admin/sals/list" style="position: absolute; top:160px;left:130px;font-size:20px; color:black;">매출</a>
</div>
<div class="border border-3" id="test" style=" position:absolute; width: 340px; height: 300px; top:630px; left:1162px;">
<img src="<%=request.getContextPath()%>/admin/img/border.jpg" style="position: absolute; top:10px;left:50px;width:200px;height:150px;">
<a href="${cp }/admin/qna" style="position: absolute; top:160px;left:130px;font-size:20px; color:black;">QNA</a>
<a href="${cp }/admin/faq/list" style="position: absolute; top:200px;left:130px;font-size:20px; color:black;">FAQ</a>
</div>
<div class="border border-3" id="test1" style=" position:absolute; width: 340px; height: 300px; top:630px; left:1540px;">
<img src="<%=request.getContextPath()%>/admin/img/qna.jpg" style="position: absolute; top:10px;left:50px;width:200px;height:150px;">
<a style="position: absolute; top:160px;;left:100px;font-size:20px; color:black;">미처리현황</a>
<a href="" style="position: absolute; top:200px;left:50px;font-size:20px; color:black;">QNA : </a>
<div id="result" style="position: absolute; top:200px;left:140px; width:50px;height:30px; font-size:20px;"></div>
<a href="" style="position: absolute; top:240px;left:50px;font-size:20px; color:black;">게시판 :</a>
<div style="position: absolute; top:240px;left:200px;font-size:20px; color:black;">test</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    	google.charts.load('current', {'packages':['bar']});
          google.charts.setOnLoadCallback(drawChart);
          function drawChart() {
        	  let xhr=new XMLHttpRequest();
      			xhr.onreadystatechange=function(){
      			if(xhr.readyState==4 && xhr.status==200){
      				let xml=xhr.responseXML;
      				let comm1=xml.getElementsByTagName("comm1");
      				let comm=xml.getElementsByTagName("comm");
      					var sum = new Array();
      					var pprice = new Array();
      					var inid = new Array();
      					var inprice = new Array();
      					for(let i=0;i<comm.length;i++){
      						inid[i]=comm[i].getElementsByTagName("inid")[0].textContent;
      						pprice[i]=comm1[i].getElementsByTagName("pprice")[0].textContent;
      						inprice[i]=comm[i].getElementsByTagName("inprice")[0].textContent;
      						sum[i]=pprice[i]-inprice[i];
      					}
      					var data = google.visualization.arrayToDataTable([
 	       	             	 ['월', '매입','매출','순수익'],
 	       	              	 ["1",inprice[0],pprice[0],sum[0]],
 	       	             	 ["2",inprice[1],pprice[1],sum[1]],
 	       	             	 ["3",inprice[2],pprice[2],sum[2]],
 	       	            	 ["4",inprice[3],pprice[3],sum[3]],
	       	             	 ["5",inprice[4],pprice[4],sum[4]],
	       	             	 ["6",inprice[5],pprice[5],sum[5]],
	       	                 ["7",inprice[6],pprice[6],sum[6]],
	       	             	 ["8",inprice[7],pprice[7],sum[7]],
	       	             	 ["9",inprice[8],pprice[8],sum[8]],
	       	             	 ["10",inprice[9],pprice[9],sum[9]],
	       	             	 ["11",inprice[10],pprice[10],sum[10]],
	       	             	 ["12",inprice[11],pprice[11],sum[11]],
 	       	        		]);
      						var options = {
    			            chart: {
    			              }
    			    	};
      					var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
      	           		chart.draw(data, google.charts.Bar.convertOptions(options));
      			}
      		};
      		xhr.open('get','${pageContext.request.contextPath}/admin/main/chart.do',true);
      		xhr.send();
          }
          
          
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart1);
          function drawChart1() {
        	  let xhr=new XMLHttpRequest();
      			xhr.onreadystatechange=function(){
      			if(xhr.readyState==4 && xhr.status==200){
      				let xml=xhr.responseXML;
      				let comm3=xml.getElementsByTagName("comm3");
      				let comm4=xml.getElementsByTagName("comm4");
      				let comm5=xml.getElementsByTagName("comm5");
      					var mrdate = new Array();
      					var mmileage = new Array();
      					var mmileage1 = new Array();
      					var mmileage2 = new Array();
      					for(let i=0;i<comm3.length;i++){
      						mrdate[i]=comm3[i].getElementsByTagName("mrdate")[0].textContent;
      						mmileage[i]=comm3[i].getElementsByTagName("mmileage")[0].textContent;
      						mmileage1[i]=comm4[i].getElementsByTagName("mmileage1")[0].textContent;
      						mmileage2[i]=comm5[i].getElementsByTagName("mmileage2")[0].textContent;
      						}
      						var data = google.visualization.arrayToDataTable([
 	       	             	['월', '총인원','성인','미성년'],
 	       	         		["1",Number(mmileage[0]),Number(mmileage1[0]),Number(mmileage2[0])],
 	       	         		["2",Number(mmileage[1]),Number(mmileage1[1]),Number(mmileage2[1])],
 	       	         		["3",Number(mmileage[2]),Number(mmileage1[2]),Number(mmileage2[2])],
 	       	         		["4",Number(mmileage[3]),Number(mmileage1[3]),Number(mmileage2[3])],
 	       	         		["5",Number(mmileage[4]),Number(mmileage1[4]),Number(mmileage2[4])],
 	       	        	 	["6",Number(mmileage[5]),Number(mmileage1[5]),Number(mmileage2[5])],	
 	       			        ["7",Number(mmileage[6]),Number(mmileage1[6]),Number(mmileage2[6])],
			 	       	    ["8",Number(mmileage[7]),Number(mmileage1[7]),Number(mmileage2[7])],
 	       					["9",Number(mmileage[8]),Number(mmileage1[8]),Number(mmileage2[8])],
 	       					["10",Number(mmileage[9]),Number(mmileage1[9]),Number(mmileage2[9])],
 	       					["11",Number(mmileage[10]),Number(mmileage1[10]),Number(mmileage2[10])],
 	       					["12",Number(mmileage[11]),Number(mmileage1[11]),Number(mmileage2[11])],
 	       	      		    ]);
      						var options = {
      					        curveType: 'function',
      					        legend: { position: 'bottom' }
      					      };
      					      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
      					      chart.draw(data, options);
      					    }
      					};
      				  xhr.open('get','${pageContext.request.contextPath}/admin/main/chart.do',true);
		      		  xhr.send();
         	}
          window.onload=function(){
        	  let xhr=new XMLHttpRequest();
        		xhr.onreadystatechange=function(){
        			if(xhr.readyState==4 && xhr.status==200){
        				const result=document.getElementById("result");
        				let xml=xhr.responseXML;
        				let qid=xml.getElementsByTagName("qid")[0].textContent;
        				result.innerHTML=+qid+"건";
        			}
        		};
        		xhr.open('get','<%=request.getContextPath()%>/admin/admin_content/item/main_ajax.jsp',true);
        		xhr.send(); 
          }
</script>
