<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mid = request.getParameter("mid");
String sql = "select * from members where mid =?";
JSONArray arr = new JSONArray();
try(Connection con = DBConnection.getCon();
		PreparedStatement pstmt = con.prepareStatement(sql);){
	pstmt.setString(1, Integer.parseInt(mid));
	try(ResultSet rs = pstmt.executeQuery();){
		if(rs.next()){
			JSONObject obj = new JSONObject();
			String 
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