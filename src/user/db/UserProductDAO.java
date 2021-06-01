package user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.User_ProductVo;

public class UserProductDAO {
	public String sid(int sid) {
		String sql = "select sname from stock where sid=?";
		String sname = "";
		try(Connection con = DBConnection.getCon();
				PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setInt(1, sid);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					sname = rs.getString("sname");
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return sname;
	}
	
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
	public ArrayList<User_ProductVo> category(String category){
		//String sql = "select sname,sid from stock";
		String sql1 = "select tename from inbound where tecategory='"+category+"'";
		String sql2 = "select sid from stock where sname = ?";
		String sql3 = "select * from product where sid = ?";
		ArrayList<String> tenameList = new ArrayList<>();
		ArrayList<Integer> sidList = new ArrayList<>();
		ArrayList<User_ProductVo> list = new ArrayList<>();
		User_ProductVo vo = null;
		try(Connection con = DBConnection.getCon();
				PreparedStatement pstmt3 = con.prepareStatement(sql3);
				PreparedStatement pstmt2 = con.prepareStatement(sql2);
				PreparedStatement pstmt1 = con.prepareStatement(sql1);){
				try(ResultSet rs1 = pstmt1.executeQuery();){
					while(rs1.next()) {
						String tename = rs1.getString("tename");
						tenameList.add(tename);
						System.out.println(tename);
					}
				}
				for (int i = 0; i < tenameList.size(); i++) {
					pstmt2.setString(1, tenameList.get(i)); 
					try(ResultSet rs2 = pstmt2.executeQuery();){
						if(rs2.next()) {
							int sid = rs2.getInt("sid");
							sidList.add(sid);
							//중복제거하기
							System.out.println("sid"+sid);
						}
					}
				}
				for (int i = 0; i < sidList.size(); i++) {
					pstmt3.setInt(1, sidList.get(i)); 
					try(ResultSet rs3 = pstmt3.executeQuery();){
						if(rs3.next()) {
							int pid = rs3.getInt("pid");
							int pprice = rs3.getInt("pprice");
							int pdiscount = rs3.getInt("pdiscount");
							String pimage1 = rs3.getString("pimage1");
							int psid = rs3.getInt("sid");
							vo = new User_ProductVo(pid, pprice, pdiscount, pimage1, psid);
							list.add(vo);
							//중복제거하기
							System.out.println(vo.getSid());
						}
					}
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
