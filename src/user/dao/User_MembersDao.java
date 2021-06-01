package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.db.DBConnection;

public class User_MembersDao {
	public int findaccount(String id, String pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int n=0;
		try {
			con=DBConnection.getCon();
			String sql="select * from members where mid=? and mpw=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=1;
				System.out.println(n);
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			DBConnection.close(con,pstmt,rs);
		}
		return n;
	}
	public int join(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int n=0;
		String sql="insert into members values(?,?,?,?,?)";
		try {
			con=DBConnection.getCon();
			
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			DBConnection.close(con,pstmt,null);
		}
	}
}
