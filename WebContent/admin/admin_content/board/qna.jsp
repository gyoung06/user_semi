<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#qnabox{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="qnabox">
	<form method="post" action="${cp }/admin/qna" enctype="multipart/form-data">
		<select name="field">
			<option value="item">��ǰ����</option>
			<option value="delivery">��۹���</option>
			<option value="refund">ȯ�ҹ���</option>
		</select>
		<br>
		�ۼ���<br>
		<input type="text" name="qwriter" value="${vo.mid }" readonly="readonly"><br>
		����<br>
		<input type="text" name="qtitle"><br>
		����<br>
		<textarea rows="5" cols="50" name="qcontent"></textarea><br>
		��й�ȣ<br>
		<input type="password" name="qpw"><br>
		÷������<br>
		<input type="file" name="file1" >
		<input type="submit" value="����">
	</form>
</div>
</body>
</html>