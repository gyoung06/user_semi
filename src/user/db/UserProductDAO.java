package user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.User_ProductVo;

public class UserProductDAO {
	public ArrayList<String> sid() {
		String sql = "select sname from stock";
		ArrayList<String> snameList= new ArrayList<>();
		try(Connection con = DBConnection.getCon();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					String sname = rs.getString("sname");
					snameList.add(sname);
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return snameList;
	}
	
	public ArrayList<User_ProductVo> Bestlist(){
		ArrayList<String> snameList = sid();
		String sql = "select * from (select * from product order by psell desc) where sname = ?";
		ArrayList<User_ProductVo> list = new ArrayList<>();
		User_ProductVo vo = null;
		try(Connection con = DBConnection.getCon();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			for (int i = 0; i < snameList.size(); i++) {
				pstmt.setString(i, snameList.get(i));
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
						int pid = rs.getInt("pid");
						int pprice = rs.getInt("pprice");
						int pdiscount=rs.getInt("pdiscount");
						String pimage1=rs.getString("pimage1");
						int sid=rs.getInt("sid");
						vo = new User_ProductVo(pid, pprice, pdiscount, pimage1,sid);
						list.add(vo);
					}
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
