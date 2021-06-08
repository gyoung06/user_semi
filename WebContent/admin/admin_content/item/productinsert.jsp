<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/productinsert.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<%
	String sid=request.getParameter("sid");
%>

<div style="background:#086701; width:100%;height:100%;">
<div style="position:absolute; background:white; top:10px;left:10px;width:980px;height:780px;">
<img src="<%=request.getContextPath()%>/admin/img/j4.png" style="position:absolute; top:50px; left:400px;">
 <form class="well form-horizontal" enctype="multipart/form-data" >
	<fieldset>
	 <div class="border border-success" style="position: absolute; top:250px; left:50px; width:875px;height:40px;">
	 <div class="control-group">
     	<label style="position:absolute;top:8px;left:10px;">재고번호</label>
     	<div class="controls">
     		<input id="input_sid" type="text" value="<%=sid %>" style="position:absolute;top:5px;left:80px; width:50px; text-align:center;">
     	</div>
      </div>
      <div class="control-group">
     	<label style="position:absolute;top:8px;left:300px;">할인율</label>
     	<div class="controls">
     		<input id="input_discount" type="text" style="position:absolute;top:5px;left:350px; width:50px; text-align:center;">
     		<select id="selectdiscount" onchange="chang_discount()" style="position:absolute;top:5px;left:400px;height:30px;">
            	<option>5</option>
                <option>10</option>
                <option>15</option>
                <option>20</option>
            </select>
     	</div>
     </div>
     <div class="control-group">
     	<label style="position:absolute;top:8px;left:600px;">가격</label>
     	<div class="controls">
     		<input id="input_inprice" type="text" style="position:absolute;top:5px;;left:650px; width:170px;">
     	</div>
     </div>
     </div>
      <div class="control-group">
     	<label style="position:absolute;top:300px;left:150px;">대표이미지</label>
     	<input type="file"  name="pimage1" id="upload1" style="position: absolute;top:300px;left:250px;width:250px; font-size: 0.9rem;">
     	<div class="controls">
     		<div id="large_img1" class="border border-success" style="position: absolute; top:330px; left:50px; width:400px;height:300px;"></div>
     	</div>
     </div>
     <div class="control-group">
     	<label style="position:absolute;top:300px;left:610px;">추가이미지</label>
     	<input type="file"  name="pimage2" id="upload2" style="position: absolute;top:300px;left:710px;width:250px; font-size: 0.9rem;">
     	<div class="controls">
     		<div id="large_img2" class="border border-success" style="position: absolute; top:330px; left:530px; width:400px;height:300px;"></div>
     	</div>
     </div>
     
     <div class="form-actions">
     	<button id="insertbtn" class="btn btn-outline-dark" type="submit" style="position:absolute;top:680px;left:360px;">등록</button>
     	<button  onclick="self.close();" class="btn btn-outline-dark" type="button" style="position:absolute;top:680px;left:540px;">취소</button>
     </div>
	 </fieldset>
   </form>
 </div>
</div>
<script type="text/javascript">
	var upload1=document.querySelector("#upload1");
	var upload2=document.querySelector("#upload2");
	var large_img1=document.querySelector("#large_img1");
	var large_img2=document.querySelector("#large_img2");
	upload1.addEventListener('change',function (e) {
        var get_file = e.target.files;
        var image = document.createElement('img');
        var reader = new FileReader();
        reader.onload = (function (aImg) {
            return function (e) {
                aImg.src = e.target.result
            }
        })(image)
        if(get_file){
            reader.readAsDataURL(get_file[0]);
        }
        large_img1.appendChild(image);
    })
    upload2.addEventListener('change',function (e) {
        var get_file = e.target.files;
        var image = document.createElement('img');
        var reader = new FileReader();
        reader.onload = (function (aImg) {
            return function (e) {
                aImg.src = e.target.result
            }
        })(image)
        if(get_file){
            reader.readAsDataURL(get_file[0]);
        }
        large_img2.appendChild(image);
    })
	
	
	
	function chang_discount(){
		var select=document.getElementById("selectdiscount");
		document.getElementById("input_discount").value=select.options[select.selectedIndex].text;
	}

	function moveClose() {
	  opener.location.href="<%=request.getContextPath()%>/admin/inbound/list";
	  self.close();
	}
	insertbtn=document.getElementById("insertbtn");
	insertbtn.addEventListener('click',function(e){
		const sid=document.getElementById("input_sid").value;
		const pdiscount=document.getElementById("input_discount").value;
		const pprice=document.getElementById("input_inprice").value;
		const pimage1=document.getElementById("upload1").value;
		const pimage2=document.getElementById("upload2").value;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let xml=xhr.responseXML;
			}
		};
		xhr.open('post','${pageContext.request.contextPath}/admin/product/upload',true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		let params="sid="+sid+"&pdiscount="+pdiscount+"&pprice="+pprice+"&pimage1="+pimage1+"&pimage2="+pimage2;
		xhr.send(params);
		opener.parent.location="<%=request.getContextPath()%>/admin/product/list";
		window.close();
	});
</script>