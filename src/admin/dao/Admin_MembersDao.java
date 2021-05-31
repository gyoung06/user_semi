package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.vo.Admin_MembersVo;
import test.db.DBConnection;

public class Admin_MembersDao {
	public int getinfo(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.getCon();
			String sql="select * from members where mid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "mid");
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt, null);
		}
	}
	public ArrayList<Admin_MembersVo> list(Admin_MembersVo){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="selectg * from members";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
