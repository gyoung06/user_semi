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
			<option value="item">공지1</option>
			<option value="delivery">공지2</option>
			<option value="refund">공지3</option>
		</select>
		<br>
		작성자<br>
		<input type="text" name="qwriter" value="${vo.aid }" readonly="readonly"><br>
		제목<br>
		<input type="text" name="ftitle"><br>
		내용<br>
		<textarea rows="5" cols="50" name="qcontent"></textarea><br>
		첨부파일<br>
		<input type="file" name="file1" >
		<input type="submit" value="전송">
		공개<input type="radio" name="fpublic_private" value="1" checked>
		비공개<input type="radio" name="fpublic_private" value="0">
	</form>
</div>

</body>
</html>