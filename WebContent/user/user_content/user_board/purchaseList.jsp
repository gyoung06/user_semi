<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<select name = "select">
				<option value="��ü �ֹ�����Ʈ">��ü �ֹ�����Ʈ</option>
				<option value="��� �غ���">��� �غ���</option>
				<option value="�����">�����</option>
				<option value="��ۿϷ�">��ۿϷ�</option>
				<option value="���">���</option>
				<option value="��ȯ">��ȯ</option>
				<option value="��ǰ">��ǰ</option>
		</select>
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
			<input type="date" >~<input type="date" ><input type="button" value="��ȸ">
		</div>
		<ul>
			<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
			<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
		</ul>
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
			<tr>
				<td>�ֹ������� �����ϴ�.</td>
			</tr>
		</table>
	</div>
	<!-- ����¡ó��!!!!!!!!!!!!!!!!!! -->
    <div role="tabpanel" class="tab-pane" id="profile">
	    ���ȯ�ұ�ȯ����
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
			<input type="date" >~<input type="date" ><input type="button" value="��ȸ">
		</div>
		<ul>
			<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
			<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
		</ul>
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
			<tr>
				<td>�ֹ������� �����ϴ�.</td>
			</tr>
		</table>
	</div>
	<!-- ����¡ó��!!!!!!!!!!!!!!!!!! -->
	</div>
</div>
<script>
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show')
	})
</script>

