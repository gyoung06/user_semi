<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fnq.jsp</title>
<style>
	#faqbox{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="faqbox">
	<form method="post" action="${cp }/admin/faq" enctype="multipart/form-data">
		<select name="field">
			<option value="item">����1</option>
			<option value="delivery">����2</option>
			<option value="refund">����3</option>
		</select>
		<br>
		�ۼ���<br>
		<input type="text" name="qwriter" value="${vo.aid }" readonly="readonly"><br>
		����<br>
		<input type="text" name="ftitle"><br>
		����<br>
		<textarea rows="5" cols="50" name="qcontent"></textarea><br>
		÷������<br>
		<input type="file" name="file1" >
		<input type="submit" value="����">
		����<input type="radio" name="fpublic_private" value="1" checked>
		�����<input type="radio" name="fpublic_private" value="0">
	</form>
</div>

</body>
</html>