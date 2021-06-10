<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate();

request.setAttribute("top", "/user/user_content/header.jsp");
request.setAttribute("content","/user/user_content/main.jsp");
request.setAttribute("bottom", "/user/user_content/footer.jsp");

request.getRequestDispatcher("/user/user_content/index.jsp").forward(request,response);
%>


