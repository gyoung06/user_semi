package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import test.db.DBConnection;

public class User_OrdersDetailDao {
	public int buyproduct(String color, String size, int amount, int allPay, int payment, int orid, int pid) {
		String sql = "insert into order_detail(odid,odcolor,odsize,odcount,odmileage,odtotal,orpaymoney,orid,pid) "
				+ "values(ORDER_DETAIL_seq.nextval,addr,?,?,0,?,?,?,?)";
		// 색상,사이즈,수량,총주문가격,지불각격(마일리지결제시 빼ㅔ고계산),orid,pid
		int n = 0;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, color);
			pstmt.setString(2, size);
			pstmt.setInt(3, amount);
			pstmt.setInt(4, allPay);
			pstmt.setInt(5, payment);
			pstmt.setInt(6, orid);
			pstmt.setInt(7, pid);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
}