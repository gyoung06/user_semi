package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.vo.Admin_StockVo;
import test.db.DBConnection;

public class Admin_StockDao {
	private static Admin_StockDao instance=new Admin_StockDao();
	private Admin_StockDao() {}
	public static Admin_StockDao getInstance() {
		return instance;
	}
	public ArrayList<Admin_StockVo> list(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from stock order by sid asc";
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<Admin_StockVo> list=new ArrayList<Admin_StockVo>();
			while(rs.next()) {
				int sid=rs.getInt("sid");
				String sname=rs.getString("sname");
				String scolor=rs.getString("scolor");
				String ssize=rs.getString("ssize");
				int samount=rs.getInt("samount");
				Admin_StockVo vo=new Admin_StockVo(sid, sname, scolor, ssize, samount);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public int update(Admin_StockVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update stock set sname=?,scolor=?,ssize=?,samount=? where sid=?";
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getSname());
			pstmt.setString(2, vo.getScolor());
			pstmt.setString(3, vo.getSsize());
			pstmt.setInt(4, vo.getSamount());
			pstmt.setInt(5, vo.getSid());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt, null);
		}
	}
	public int insert(Admin_StockVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into stock values(STOCK_seq.nextval,?,?,?,?)";
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getSname());
			pstmt.setString(2, vo.getScolor());
			pstmt.setString(3, vo.getSsize());
			pstmt.setInt(4, vo.getSamount());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt, null);
		}
	}
}
