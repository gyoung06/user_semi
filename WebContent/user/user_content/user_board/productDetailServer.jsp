<%@page import="org.json.JSONArray"%>
<%@page import="test.db.DBConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String scolor = request.getParameter("scolor");
	String sname = request.getParameter("sname");
	String sql = "select ssize from stock where scolor = ?";
	JSONArray arr = new JSONArray();
	try(Connection con = DBConnection.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);){
		pstmt.setString(1, scolor);
		try(ResultSet rs = pstmt.executeQuery();){
			while(rs.next()){
				JSONObject obj = new JSONObject();
				String ssize = rs.getString("ssize");
				obj.put("ssize",ssize);
				arr.put(obj);
			}
		}
	}
	JSONObject result = new JSONObject();
	result.put("list",arr);
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw = response.getWriter();
	pw.print(result);
%>