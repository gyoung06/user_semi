<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String OrderList=(String)session.getAttribute("OrderList");
%>
order list
<!-- �ֹ����� ���� count -->
�ֹ�������ȸ(x��)
<div role="tabpanel">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">�ֹ�������ȸ</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">���/��ǰ/��ȯ����</a></li>
  </ul>
  <!-- Tab panes -->
  <form action="${cp }/user/purchase" method="post">
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<select name = "field">
				<option value="��ü �ֹ�����Ʈ"<c:if test="${field=='orderall' }">selected="selected"</c:if>>��ü �ֹ�����Ʈ</option>
				<option value="��� �غ���"<c:if test="${field=='ready' }">selected="selected"</c:if>>��� �غ���</option>
				<option value="�����"<c:if test="${field=='halfway' }">selected="selected"</c:if>>�����</option>
				<option value="��ۿϷ�"<c:if test="${field=='finish' }">selected="selected"</c:if>>��ۿϷ�</option>
				<option value="���"<c:if test="${field=='cancel' }">selected="selected"</c:if>>���</option>
				<option value="��ȯ"<c:if test="${field=='exchange' }">selected="selected"</c:if>>��ȯ</option>
				<option value="��ǰ"<c:if test="${field=='return' }">selected="selected"</c:if>>��ǰ</option>
		</select>
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active">
		    <input type="radio" name="options" value="option1" autocomplete="off" checked> ����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option2" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option3" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option4"  autocomplete="off"> 3����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" value="option5" autocomplete="off"> 6����
		  </label>
		</div>
		<div>
			<input type="date" id="3mago"/>~<input type="date" id="currentDate"/><input type="submit" value="��ȸ">
		</div>
		
		</form>
		<script type="text/javascript">	
			document.getElementById("currentDate").value= 
				new Date().toISOString().substring(0,10);
		
			$("input:radio[name=options]").click(function () {
			var radioValue = $(this).val();
			if(radioValue=="option1"){
			let now = new Date();//����
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth()+1)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option2"){
			let now = new Date();//1�� ������
			let day = ("0" + now.getDate()-7).slice(-2);
			let month = ("0" + (now.getMonth()+1)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option3"){
			let now = new Date();//1�� ������
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth())).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option4"){
			let now = new Date();//3�� ������
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth() -2)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			
			}else if(radioValue=="option5"){
			let now = new Date();//6�� ������
			let day = ("0" + now.getDate()).slice(-2);
			let month = ("0" + (now.getMonth() -5)).slice(-2);
			let today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			$('#3mago').val(today);
			}

			});
		</script>
		<ul>
			<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
			<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
		</ul>
		<br>
		<h4>��ǰ����</h4>
		<table class="table">
			<tr class="active">
				<th>�ֹ�����<br>[�ֹ���ȣ]</th>
				<th>�̹���</th>
				<th>��ǰ����</th>
				<th>����</th>
				<th>��ǰ���űݾ�</th>
				<th>�ֹ�ó������</th>
				<th>���/��ȯ/��ǰ<th>
			</tr>
			<c:choose>
				<c:when test="${empty OrderList}">
					<tr>
						<td>�ֹ������� �����ϴ�.</td>
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
	<!-- ����¡ó��!!!!!!!!!!!!!!!!!! -->
    <div role="tabpanel" class="tab-pane" id="profile">
	    ���ȯ�ұ�ȯ����
	    <form action="${cp }/user/purchase" method="post">
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active">
		    <input type="radio" name="options" id="option1" autocomplete="off" checked> ����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option2" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option3" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option4" autocomplete="off"> 3����
		  </label>
		  <label class="btn btn-primary">
		    <input type="radio" name="options" id="option5" autocomplete="off"> 6����
		  </label>
		</div>
		<div>
			<input type="date" id="3mago1">~<input type="date" id="currentDate1"><input type="submit" value="��ȸ">
		</div>
		</form>
				<script type="text/javascript">
				var now = new Date(); //3�� ������
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
			<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
			<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
		</ul>
		<br>
		<h4>��ǰ����</h4>
		<table class="table">
			<tr class="active">
				<th>�ֹ�����<br>[�ֹ���ȣ]</th>
				<th>�̹���</th>
				<th>��ǰ����</th>
				<th>����</th>
				<th>��ǰ���űݾ�</th>
				<th>�ֹ�ó������</th>
				<th>���/��ȯ/��ǰ<th>
			</tr>
			<c:choose>
				<c:when test="${empty OrderList}">
					<tr>
						<td>���, ��ȯ, ȯ�ҳ����� �����ϴ�.</td>
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
	<!-- ����¡ó��!!!!!!!!!!!!!!!!!! -->
			<c:if test="${startPageNum>10 }">
		<a href="${cp}/user/purchase?pageNum=${startPageNum-1 }&field=${field}">[����]</a> <!-- ���������� ���̱� -->
		</c:if>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }">
					<a href="${cp}/user/purchase?pageNum=${i }&field=${field}">
					<span style="color:blue">[${i }]</span></a>
					<!-- <a href="${cp}/board/list?pageNum=${i}" �� �൵ �� -->
				</c:when>
				<c:otherwise>
					<a href="${cp}/user/purchase?pageNum=${i }&field=${field}">
					<span style="color:gray">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${endPageNum<pageCount }">
			<a href="${cp}/user/purchase?pageNum=${endPageNum+1 }&field=${field}">[����]</a>
		</c:if>
	</div>
</div>
<script>
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show')
	})
</script>

