package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.UserQnaVo;

public class User_UserBoardDao {
	public ArrayList<UserQnaVo> list(String id, int startRow, int endRow) { //목록 불러오기
		UserQnaVo vo = null;
		ArrayList<UserQnaVo> list = new ArrayList<>();
		String sql = "select * from (select g.*,rownum rnum from (select * from userqna where mid=? order by qid desc) g) where rnum>=? and rnum<=?";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
					int qstep = rs.getInt("qstep");
					UserQnaVo vo1 = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1, qstep);
					list.add(vo1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<UserQnaVo> Qlist(String id, int startRow, int endRow, String field, String keyword) { //검색
		String sql = null;
		if (field == null || field.equals("")) {
			sql = "select * from " + "( " + "  select board.*,rownum rnum from " + "  ("
					+ "     select * from userqna where mid=? order by qref desc, qstep asc " + "  ) board" + ") where rnum>=? and rnum<=? ";
		} else {
			sql = "select * from " + "( " + "  select board.*,rownum rnum from " + "  ("
					+ "     select * from userqna where mid=? and " + field + " like '%" + keyword + "%' order by qref desc, qstep asc"
					+ "  ) board" + ") where rnum>=? and rnum<=?";
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			ArrayList<UserQnaVo> qlist = new ArrayList<UserQnaVo>();
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
				int pid = rs.getInt("pid");
				int qstep = rs.getInt("qstep");
				UserQnaVo vo = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid, qstep);
				qlist.add(vo);
			}
			return qlist;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	//전체글의 개수
	public int getCount(String id, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getCon();
			String sql = "select NVL(count(*),0) from userqna where mid=? ";
			if (field != null && !field.equals("")) {
				sql += " where " + field + " like '%" + keyword + "%'";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	public ArrayList<UserQnaVo>	Rlist(String id, int startRow, int endRow) { //목록 불러오기
		UserQnaVo vo = null;
		ArrayList<UserQnaVo> list = new ArrayList<>();
		String sql = "select * from (select g.*,rownum rnum from (select * from userqna where mid=? order by qid desc) g) where rnum>=? and rnum<=?";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
					int qstep = rs.getInt("qstep");
					UserQnaVo vo1 = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1, qstep);
					list.add(vo1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}