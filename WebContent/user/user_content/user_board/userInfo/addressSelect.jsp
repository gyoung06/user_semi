<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getSession("id");
String sql = "select addphone,addname,addtitle";
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