<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<%
	int Countorid=(int)request.getAttribute("Countorid");
%>
order list
<!-- �ֹ����� ���� count -->
�ֹ�������ȸ(<%= Countorid%>��)
<div role="tabpanel">
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">�ֹ�������ȸ</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">���/��ǰ/��ȯ����</a></li>
  </ul>
  <!-- Tab panes -->
	<div class="tab-content">
 	<div role="tabpanel" class="tab-pane active" id="home">
  <form action="${cp }/user/purchase" method="post">
    	<select name = "field">
				<option value="��ü �ֹ�����Ʈ"<c:if test="${field=='orderall' }">selected="selected"</c:if>>��ü �ֹ�����Ʈ</option>
				<option value="�����"<c:if test="${field=='halfway' }">selected="selected"</c:if>>�����</option>
				<option value="��ۿϷ�"<c:if test="${field=='finish' }">selected="selected"</c:if>>��ۿϷ�</option>
				<option value="���"<c:if test="${field=='cancel' }">selected="selected"</c:if>>���</option>
				<option value="��ǰ"<c:if test="${field=='return' }">selected="selected"</c:if>>��ǰ</option>
		</select>
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-primary active" id="t">
		    <input type="radio" name="options" value="option1" autocomplete="off"  > ����
		  </label>
		  <label class="btn btn-primary" id="1w">
		    <input type="radio" name="options" value="option2" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary" id="1m">
		    <input type="radio" name="options" value="option3" autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary" id="3m">
		    <input type="radio" name="options" value="option4"  autocomplete="off" checked="checked"> 3����
		  </label>
		  <label class="btn btn-primary" id="6m">
		    <input type="radio" name="options" value="option5" autocomplete="off"> 6����
		  </label>
		</div>
		<div>
			<input type="text" id="datepicker" name="startdate"/>~<input type="text" id="currentDate" name="enddate"/><input type="submit" value="��ȸ">
		</div>
		
		</form>
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
						<c:forEach var="vo" items="${OrderList }">
						<tr>
						<td>${vo.ordate }<br>[${vo.orid }]</td>
						<td><img src = "${cp }${vo.pimage2}"></td>
						<td>${vo.sname }<br>${vo.odcolor }</td>
						<td>${vo.odcount }</td>
						<td>${vo.pprice }</td>
						<td>${vo.ordelivery }<br><input type="button" value="�����ı�" onclick="valuesend()"></td>
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
		  <label class="btn btn-primary active" id="t1">
		    <input type="radio" name="options"  autocomplete="off" > ����
		  </label>
		  <label class="btn btn-primary" id="1w1">
		    <input type="radio" name="options"  autocomplete="off"> 1����
		  </label>
		  <label class="btn btn-primary" id="1m1">
		    <input type="radio" name="options"  autocomplete="off" > 1����
		  </label>
		  <label class="btn btn-primary" id="3m1">
		    <input type="radio" name="options"  autocomplete="off" checked="checked"> 3����
		  </label>
		  <label class="btn btn-primary" id="6m1">
		    <input type="radio" name="options"  autocomplete="off"> 6����
		  </label>
		</div>
		<div>
			<input type="text" id="datepicker1">~<input type="text" id="currentDate1"><input type="submit" value="��ȸ">
		</div>
		</form>
		<ul>
			<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
			<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
		</ul>
		<br>
		<h4>��ǰ����</h4>
		<form name="frm" method="post">
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
						<tr> 
							<td>${vo.ordate }<br>[${vo.orid }]</td>
							<td><img src = "${cp }${vo.pimage2}"></td>
							<td>${vo.sname }<br>${vo.odcolor }</td>
							<td>${vo.odcount }</td>
							<td>${vo.pprice }</td>
							<td>${vo.ordelivery }<br><input type="button" value="�����ı�" onclick="valuesend()"></td>
							<td>${vo.orcancel }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		</div>
	</div>
	<!-- ����¡ó��!!!!!!!!!!!!!!!!!! -->
</div>
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">	
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show')
	});
	
	
	$("#currentDate1").datepicker().datepicker("setDate", new Date());
//document.getElementById("currentDate1").value= 
//new Date().toISOString().substring(0,10);
$("#datepicker1").datepicker().datepicker("setDate", '-3M');
 $(function() {
        //input�� datepicker�� ����
        $("#datepicker1").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format ����
            ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
            ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
            ,changeYear: true //�޺��ڽ����� �� ���� ����
            ,changeMonth: true //�޺��ڽ����� �� ���� ����                
            ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
            ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
            ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
            ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
            ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
            ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
            ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
            ,minDate: "-1Y" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
            ,maxDate: "+1Y" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
        });                    
        $("#3m1").click(function(){
         	  $('#datepicker1').datepicker('setDate', '-3M');
           })
        //$('input:checkbox[input[name="options"]:checked').val(); // üũ�� ��(checked value)
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
 		/*���Ź�ư �̺�Ʈ*/
 	
 });
			/*input type ="date" �� ��� �⺻�� ����
			document.getElementById("currentDate").value= 
				new Date().toISOString().substring(0,10);*/
				$("#datepicker").datepicker().datepicker("setDate", '-3M');
				$("#currentDate").datepicker().datepicker("setDate", new Date());
			 $(function() {
		            //input�� datepicker�� ����
		            $("#datepicker").datepicker({
		                dateFormat: 'yy-mm-dd' //Input Display Format ����
		                ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
		                ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
		                ,changeYear: true //�޺��ڽ����� �� ���� ����
		                ,changeMonth: true //�޺��ڽ����� �� ���� ����                
		                ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
		                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
		                ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
		                ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
		                ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
		                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
		                ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
		                ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
		                ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
		                ,minDate: "-1Y" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
		                ,maxDate: "+1Y" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
		            }); 
		            $("#3m").click(function(){
	                  	  $('#datepicker').datepicker('setDate', '-3M');
	                    })
			            //$('input:checkbox[input[name="options"]:checked').val(); // üũ�� ��(checked value)
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

