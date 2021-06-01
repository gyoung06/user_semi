package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.vo.Admin_FaqVo;
import admin.vo.Admin_MembersVo;
import test.db.DBConnection;

public class Admin_FaqDao {
	public ArrayList<Admin_FaqVo> list(int startRow,int endRow,String field,String keyword){
		String sql=null;
		if(field==null || field.equals("")) { //검색조건이 없는 경우
		    sql= "select * from " + 
				"( " + 
				"  select board.*,rownum rnum from " + 
				"  (" + 
				"	  select * from faq order by mid desc" + 
				"  ) board" + 
				") where rnum>=? and rnum<=?";
		}else{ //검색조건이 있는 경우
			sql="select * from " + 
				"( " + 
				"  select board.*,rownum rnum from " + 
				"  (" + 
				"	  select * from faq where "+ field +" like '%"+ keyword + "%' order by mid desc" + 
				"  ) board" + 
				") where rnum>=? and rnum<=?";
		 }
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs=pstmt.executeQuery();
			ArrayList<Admin_FaqVo> list=new ArrayList<Admin_FaqVo>();
			while(rs.next()) {
				Admin_FaqVo vo=new Admin_FaqVo(
						rs.getInt("fid"),
						rs.getString("ftitle"),
						rs.getString("fcontent"), 
						rs.getString("ffile"), 
						rs.getDate("frdate"),
						rs.getInt("fhit"),
						rs.getInt("fpublic_private"),
						rs.getString("aid"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
