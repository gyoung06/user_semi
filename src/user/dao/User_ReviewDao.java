package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.db.DBConnection;
import user.vo.User_GoReviewVo;

public class User_ReviewDao { 
	public int getMaxNum() {//rid
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getCon();
			String sql = "select NVL(max(rid),0) rid from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int rid = rs.getInt("rid");
			return rid;
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	//리뷰작성
	public int insertReview(String id, int odid, int sid, String rtitle, String rcontent, String rphoto1) {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		String sql=null;
		try {
			con = DBConnection.getCon();
			int rid=getMaxNum()+1;
			if(rphoto1==null || rphoto1=="") {
				System.out.println("sid:"+sid);
				sql = "insert into review values(?,null,?,?,null,null,null,sysdate,0,'" +id+ "', '" +sid+ "')"; //사진이 없는 리뷰
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setInt(1, rid);
				pstmt1.setString(2, rtitle);
				pstmt1.setString(3, rcontent);
//				pstmt1.setString(3, id);
//				pstmt1.setInt(4, pid);
				//pstmt1.setInt(5, odid);
			}else {
				sql = "insert into review values(?,null,?,?,?,null,null,sysdate,0)"; //사진이 1개만 있는 리뷰
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setInt(1, rid);
				pstmt1.setString(2, rtitle);
				pstmt1.setString(3, rcontent);
				pstmt1.setString(4, rphoto1);
//				pstmt1.setString(4, id);
//				pstmt1.setInt(5, pid);
				//pstmt1.setInt(5, odid);
			}
			int n=pstmt1.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt1, null);
		}
	}
}
