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
		left:500px;
	}
</style>
</head>
<body>
<div id="qnabox">
	<form method="post" action="${cp }/admin/qna" enctype="multipart/form-data">
		<select name="field">
			<option value="item">상품문의</option>
			<option value="delivery">배송문의</option>
			<option value="refund">환불문의</option>
		</select>
		<br>
		작성자<br>
		<input type="text" name="writer" value="${vo.mid }" readonly="readonly"><br>
		제목<br>
		<input type="text" name="title"><br>
		내용<br>
		<textarea rows="5" cols="50" name="content"></textarea><br>
		첨부파일<br>
		<input type="file" name="file1" >
		<input type="submit" value="전송">
	</form>
</div>
</body>
</html>