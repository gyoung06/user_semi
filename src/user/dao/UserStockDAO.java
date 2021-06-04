package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.UserStockVo;

public class UserStockDAO {

	public String sid(int sid) {
		String sql = "select sname from stock where sid=?";
		String sname = "";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, sid);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					sname = rs.getString("sname");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sname;
	}

	public UserStockVo stockDetail(int sid) {
		String sql = "select * from stock where sid=?";
		UserStockVo vo = null;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, sid);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					int sid1 = rs.getInt("sid");
					String sname = rs.getString("sname");
					String scolor = rs.getString("scolor");
					String ssize = rs.getString("ssize");
					int samount = rs.getInt("samount");
					vo = new UserStockVo(sid1, sname, scolor, ssize, samount);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ArrayList<String> chooseColor(String sname) {
		ArrayList<String> list = new ArrayList<>();
		String sql = "select scolor from stock where sname = '" + sname + "'";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					String scolor = rs.getString("scolor");
					list.add(scolor);
					for (int i = 0; i < list.size(); i++) {
						for (int j = i + 1; j < list.size(); j++) {
							if (list.get(i).equals(list.get(j))) {
								list.remove(j);
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<String> chooseSize(String color, String sname) {
		ArrayList<String> list = new ArrayList<>();
		String sql = "select ssize from stock where sname = '" + sname + "' and scolor ='" + color + "'";
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					String ssize = rs.getString("ssize");
					list.add(ssize);
					for (int i = 0; i < list.size(); i++) {
						for (int j = i + 1; j < list.size(); j++) {
							if (list.get(i).equals(list.get(j))) {
								list.remove(j);
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
