<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
order
<form action="../../../payment" method="post">
	<br>
	<!-- ȸ�������߰�!!! -->
	������ ����, [FAMILY] ȸ���̽ʴϴ�.
	<br>
	1,000 �̻� ���Ž� 1%�� �߰����� ������ �� �ֽ��ϴ�.
	<br>
	����������: 1000�� &nbsp; ����:0��
	<br>
	īƮ����
	<br>
	<table class="table">
		<tr>
			<th><input type="checkbox"></th>
			<th>�̹���</th>
			<th>��ǰ����</th>
			<th>�ǸŰ�</th>
			<th>����</th>
			<th>������</th>
			<th>��۱���</th>
			<th>��ۺ�</th>
			<th>�հ�</th>
			<th>����</th>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td>�̹���</td>
			<td>
				��ǰ����<br>
				<input type="button" value="�ɼǺ���">
			</td>
			<!-- ���λ�ǰ�̸� ���εȰ� ǥ�õǰ� �ϱ� -->
			<td>�ǸŰ�</td>
			<td>
				<input type="number">
				<input type="button" value="����">
			</td>
			<td>������</td>
			<td>��۱���</td>
			<td>��ۺ�</td>
			<td>�հ�</td>
			<td>
				<input type="button" value="�ֹ��ϱ�">
				<input type="button" value="���ɻ�ǰ���">
				<input type="button" value="����">	
			</td>
		</tr>
		<!-- 
		<tr>
			<td>[�⺻���]</td>
			<td>��ǰ���űݾ� 66,000+��ۺ� 0(����)-��ǰ���αݾ� 6,600=�հ�: </td>
			<th>59,400</th>
		</tr>
		 -->
	</table>
	���û�ǰ <input type="button" value="����">
	<input type="button" value="��ٱ��� ����" style="float: right;">
	<table class="table">
		<tr>
			<td>�� ��ǰ �ݾ�</td>
			<td>��ۺ�</td>
			<td>�� ���αݾ� <input type="button" value="��������"></td>
			<td>�������� �ݾ�</td>
		</tr>	
		<tr>
			<th>66,000</th>
			<th>+0</th>
			<th>-6,600</th>
			<th>=59,400</th>
		</tr>	
	</table>
	<input type="submit" value="��ü��ǰ�ֹ�">
	<input type="submit" value="���û�ǰ�ֹ�">
	<input type="button" value="���ΰ���ϱ�">
</form>
<h4>�̿�ȳ�</h4>
��ٱ��� �̿�ȳ�
<ul>
	<li>
		�ؿܹ�� ��ǰ�� ������� ��ǰ�� �Բ� �����Ͻ� �� ������ ��ٱ��� ���� ���� ������ �ֽñ� �ٶ��ϴ�.
	</li>
	<li>
		�ؿܹ�� ���� ��ǰ�� ��� ������� ��ٱ��Ͽ� ��Ҵٰ� �ؿܹ�� ��ٱ��Ϸ� �̵��Ͽ� �����Ͻ� �� �ֽ��ϴ�.
	</li>
	<li>
		�����Ͻ� ��ǰ�� ������ �����Ͻ÷��� �������� �� [����] ��ư�� �����ø� �˴ϴ�.
	</li>
	<li>
		[���ΰ���ϱ�] ��ư�� �����ø� ������ ��� �Ͻ� �� �ֽ��ϴ�.
	</li>
	<li>
		��ٱ��Ͽ� ���ɻ�ǰ�� �̿��Ͽ� ���Ͻô� ��ǰ�� �ֹ��ϰų� ���ɻ�ǰ���� ����Ͻ� �� �ֽ��ϴ�.
	</li>
	<li>
		����÷�� �ɼ��� ���ϻ�ǰ�� ��ٱ��Ͽ� �߰��� ��� �������� ���ε� �� ���Ϸ� ��ü�˴ϴ�.
	</li>
</ul>
�������Һ� �̿�ȳ�
<ul>
	<li>
		��ǰ�� �������Һ� ������ �����÷��� �������Һ� ��ǰ�� �����Ͽ� [�ֹ��ϱ�] ��ư�� ���� �ֹ�/���� �Ͻø� �˴ϴ�.
	</li>
	<li>
		[��ü ��ǰ �ֹ�] ��ư�� �����ø� ��ٱ����� ���о��� ���õ� ��� ��ǰ�� ���� �ֹ�/������ �̷�����ϴ�.
	</li>
	<li>
		��, ��ü ��ǰ�� �ֹ�/�����Ͻ� ���, ��ǰ�� �������Һ� ������ ������ �� �����ϴ�.
	</li>
</ul>
