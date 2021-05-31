package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;

public class Admin_FaqDao {
	public ArrayList<E> list(int fid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select * from faq";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				rs.getst
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
