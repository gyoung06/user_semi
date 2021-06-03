package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;

public class USerInboundDAO {
	public ArrayList<String> tenameList(String category) {
		String sql = "select tename from inbound where tecategory='" + category + "'";
		ArrayList<String> tenameList = new ArrayList<>();
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					String tename = rs.getString("tename");
					tenameList.add(tename);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tenameList;
	}
}
