<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style type="text/css">
	#top{display: table-header-group;}
	#content{display: table-row-group;}
	#bottom{display: table-footer-group;}
</style>
</head>
<body>
<div id = "top">
	<jsp:include page="${top }"/> <!-- requestScope.top인데 생략 -->
</div>
<div id = "content">
	<jsp:include page="${content }"/>
</div>
<div id = "bottom">
	<jsp:include page="${bottom }"/>
</div>
</body>
</html>