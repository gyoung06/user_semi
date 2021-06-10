<%@page import="org.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int fid=Integer.parseInt(request.getParameter("fid"));
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String fcontent=null;
	try{
		con=DBConnection.getCon();
		String sql="select fcontent from notice where fid=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, fid);
		rs=pstmt.executeQuery();
		if(rs.next()){
			fcontent=rs.getString("fcontent");
		}
	}catch(SQLException s){
		s.printStackTrace();
	}finally{
		DBConnection.close(con, pstmt, rs);
	}
	System.out.println(fcontent);
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=response.getWriter();
	JSONObject json=new JSONObject();
	json.put("fcontent",fcontent);
	pw.print(json);
%>