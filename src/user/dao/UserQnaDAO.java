package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.UserQnaVo;

public class UserQnaDAO {
	public UserQnaVo productQnaList(int pid) {
		UserQnaVo vo = null;
		String sql = "select * from userqna where pid = " + pid;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					int qid = rs.getInt("qid");
					String qcate = rs.getString("qcate");
					String qpw = rs.getString("qpw");
					String qtitle = rs.getString("qtitle");
					String qcontent = rs.getString("qcontent");
					String qfile = rs.getString("qfile");
					Date qrdate = rs.getDate("qrdate");
					int qlev = rs.getInt("qlev");
					int qref = rs.getInt("qref");
					String mid = rs.getString("mid");
					int pid1 = rs.getInt("pid");
					vo = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ArrayList<UserQnaVo> list(int startRow, int endRow) {
		UserQnaVo vo = null;
		ArrayList<UserQnaVo> list = new ArrayList<>();
		String sql = "select * from (select g.*,rownum rnum from (select * from userqna order by qid desc) g) where rnum>=? and rnum<=?";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					int qid = rs.getInt("qid");
					String qcate = rs.getString("qcate");
					String qpw = rs.getString("qpw");
					String qtitle = rs.getString("qtitle");
					String qcontent = rs.getString("qcontent");
					String qfile = rs.getString("qfile");
					Date qrdate = rs.getDate("qrdate");
					int qlev = rs.getInt("qlev");
					int qref = rs.getInt("qref");
					String mid = rs.getString("mid");
					int pid1 = rs.getInt("pid");
					vo = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1);
					list.add(vo);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<UserQnaVo> findlist(int startRow, int endRow, String field, String keyword) {
		UserQnaVo vo = null;
		ArrayList<UserQnaVo> list = new ArrayList<>();
		String sql = "select * from (select g.*,rownum rnum from ((select * from userqna where "+field+" like '%"+keyword+"%')g)) where rnum>=? and rnum<=?";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					int qid = rs.getInt("qid");
					String qcate = rs.getString("qcate");
					String qpw = rs.getString("qpw");
					String qtitle = rs.getString("qtitle");
					String qcontent = rs.getString("qcontent");
					String qfile = rs.getString("qfile");
					Date qrdate = rs.getDate("qrdate");
					int qlev = rs.getInt("qlev");
					int qref = rs.getInt("qref");
					String mid = rs.getString("mid");
					int pid1 = rs.getInt("pid");
					vo = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1);
					list.add(vo);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCount(String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getCon();
			String sql = "select NVL(count(*),0) from userqna";
			if (field != null && !field.equals("")) {
				sql += " where " + field + " like '%" + keyword + "%'";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int n = rs.getInt(1);
				return n;
			}
			return -1;
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
