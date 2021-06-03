package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.User_ProductVo;

public class UserProductDAO {
//	public ArrayList<User_ProductVo> Bestlist(){
//		ArrayList<String> snameList = sid();
//		String sql = "select * from (select * from product order by psell desc) where sname = ?";
//		ArrayList<User_ProductVo> list = new ArrayList<>();
//		User_ProductVo vo = null;
//		try(Connection con = DBConnection.getCon();
//				PreparedStatement pstmt = con.prepareStatement(sql);){
//			for (int i = 0; i < snameList.size(); i++) {
//				pstmt.setString(1, snameList.get(i));
//			try(ResultSet rs = pstmt.executeQuery();){
//				if(rs.next()) {
//						int pid = rs.getInt("pid");
//						int pprice = rs.getInt("pprice");
//						int pdiscount=rs.getInt("pdiscount");
//						String pimage1=rs.getString("pimage1");
//						int sid=rs.getInt("sid");
//						vo = new User_ProductVo(pid, pprice, pdiscount, pimage1,sid);
//						list.add(vo);
//					}
//				}
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}

	public ArrayList<Integer> sidList(String category) {
		String sql = "select sid from stock where sname = ?";
		ArrayList<Integer> sidList = new ArrayList<>();
		USerInboundDAO dao = new USerInboundDAO();
		ArrayList<String> tenameList = dao.tenameList(category);
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			for (int i = 0; i < tenameList.size(); i++) {
				for (int j = 0; j < tenameList.size(); j++) {
					if (tenameList.get(i).equals(tenameList.get(j))) {
						tenameList.remove(j);
					}
				}
			}
			for (int i = 0; i < tenameList.size(); i++) {
				pstmt.setString(1, tenameList.get(i));
				try (ResultSet rs = pstmt.executeQuery();) {
					if (rs.next()) {
						int sid = rs.getInt("sid");
						sidList.add(sid);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sidList;
	}

	public ArrayList<User_ProductVo> category(String category) {
		String sql = "select * from product where sid = ?";
		ArrayList<User_ProductVo> list = new ArrayList<>();
		ArrayList<Integer> sidList = sidList(category);
		User_ProductVo vo = null;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			for (int i = 0; i < sidList.size(); i++) {
				pstmt.setInt(1, sidList.get(i));
				try (ResultSet rs = pstmt.executeQuery();) {
					if (rs.next()) {
						int pid = rs.getInt("pid");
						int pprice = rs.getInt("pprice");
						int pdiscount = rs.getInt("pdiscount");
						String pimage1 = rs.getString("pimage1");
						String pimage2 = rs.getString("pimage2");
						int psid = rs.getInt("sid");
						vo = new User_ProductVo(pid, pprice, pdiscount, pimage1, pimage2, null, null, 0, psid);
						list.add(vo);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public User_ProductVo productDetail(int pid) {
		String sql = "select * from product where pid =" + pid;
		User_ProductVo vo = null;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					int pid1 = rs.getInt("pid");
					int pprice = rs.getInt("pprice");
					int pdiscount = rs.getInt("pdiscount");
					String pimage1 = rs.getString("pimage1");
					String pimage2 = rs.getString("pimage2");
					String pimage3 = rs.getString("pimage3");
					Date prdate = rs.getDate("prdate");
					int psell = rs.getInt("psell");
					int sid = rs.getInt("sid");
					vo = new User_ProductVo(pid1, pprice, pdiscount, pimage1, pimage2, pimage3, prdate, psell, sid);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

}
