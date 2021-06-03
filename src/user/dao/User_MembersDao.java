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
	         }
	         return n;
	      }catch(SQLException se) {
	         se.printStackTrace();
	         return -1;
	      }finally {
	         DBConnection.close(con,pstmt,rs);
	      }
	   }
	public int join(String mid, String mpw, String mname, String mphone, String memail) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into members(mid, mpw,mname,mphone,mrdate,mdrop, mmileage,memail) values(?,?,?,?,sysdate,0,1000,?)";
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			pstmt.setString(3, mname);
			pstmt.setString(4, mphone);
			pstmt.setString(5, memail);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con,pstmt,null);
		}
	}
	public boolean idcheck(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select mid from members where mid=?";
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			pstmt.setString(1, id);
			if(rs.next()) {
				if(rs.getString("id").equals(id)) {
					return true;
				}else {
					return false;
				}
			}
			}catch(SQLException e) {
				e.printStackTrace();
				return false;
			}finally {
				DBConnection.close(con,pstmt,rs);
			}
		return false;
		}
	public int passcheck(String id, String pwd) {
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
	         }
	         return n;
	      }catch(SQLException se) {
	         se.printStackTrace();
	         return -1;
	      }finally {
	         DBConnection.close(con,pstmt,rs);
	      }
	   }
	}
