package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.UserOrderlistVo;

public class User_OrdersDao {
	public ArrayList<UserOrderlistVo> OrderList(int startRow, int endRow, String field, String id, String startdate, String enddate){ //string인지 date인지 확인
		String sql=null;
		if(field==null || field.equals("")) {
			sql="select * from (select o.orid, o.ordate, o.ordelivery, o.orcancel, od.odcolor, od.odcount, p.pimage2, p.pprice, s.sname " + 
					"from orders o, order_detail od, product p, stock s " + 
					"where o.orid=od.orid and od.pid=p.pid and p.sid=s.sid and o.mid=?) where orid>=? and orid<=? and ordate>=sysdate-90 and ordate<=sysdate+90";
		}else if(field.equals("전체 주문리스트")) {
			sql="select * from (select o.orid, o.ordate, o.ordelivery, o.orcancel, od.odcolor, od.odcount, p.pimage2, p.pprice, s.sname " + 
					"from orders o, order_detail od, product p, stock s " + 
					"where o.orid=od.orid and od.pid=p.pid and p.sid=s.sid and o.mid=?) where orid>=? and orid<=? and TO_CHAR(ordate,'MM/DD/YYYY')>=? and TO_CHAR(ordate,'MM/DD/YYYY')<=?";
		}else {
			if(field.equals("배송 준비중") || field.equals("배송중") || field.equals("배송완료")) {
				sql=" select * from (select o.orid, o.ordate, o.ordelivery, o.orcancel, od.odcolor, od.odcount, p.pimage2, p.pprice, s.sname " + 
					"from orders o, order_detail od, product p, stock s " + 
					"where o.orid=od.orid and od.pid=p.pid and p.sid=s.sid and o.mid=? and o.ordelivery  = " + field +") where orid>=? and orid<=? and TO_CHAR(ordate,'MM/DD/YYYY')>=? and TO_CHAR(ordate,'MM/DD/YYYY')<=?";
			}else {
				sql="select * from (select o.orid, o.ordate, o.ordelivery, o.orcancel, od.odcolor, od.odcount, p.pimage2, p.pprice, s.sname " + 
						"from orders o, order_detail od, product p, stock s " + 
						"where o.orid=od.orid and od.pid=p.pid and p.sid=s.sid and o.mid=? and o.orcancel = " + field +") where orid>=? and orid<=? and TO_CHAR(ordate,'MM/DD/YYYY')>=? and TO_CHAR(ordate,'MM/DD/YYYY')<=?";
			}
		}
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			System.out.println(startRow+endRow+field+id);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, startdate);
			pstmt.setString(5, enddate);
			rs=pstmt.executeQuery();
			ArrayList<UserOrderlistVo> list=new ArrayList<UserOrderlistVo>();
			while(rs.next()) {
				Date ordate=rs.getDate("ordate");
				int orid=rs.getInt("orid");
				String pimage2=rs.getString("pimage2");
				String sname=rs.getString("sname");
				String odcolor=rs.getString("odcolor");
				int odcount=rs.getInt("odcount");
				int pprice=rs.getInt("pprice");
				String ordelivery=rs.getString("ordelivery");
				String orcancel=rs.getString("orcancel");
				UserOrderlistVo vo=new UserOrderlistVo(ordate, orid, pimage2, sname, odcolor, odcount, pprice, ordelivery, orcancel);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con,pstmt,rs);
		}
	}
	
	public int getCount(String field) { //전체 글의 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select NVL(count(orid),0) from orders";
			if(field!=null && !field.equals("")) {
				sql+=" where " +field + "=" + field; //띄어쓰기 주의! . 필드가 널이 아니라면 검색조건에 얘가 붙음
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			int mnum=rs.getInt(1); //NVL(count(num),0)이 컬럼1
			return mnum;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1; //글번호가 -1이 들어가지 않을꺼니까 -1주기
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public int CountOrid(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select count(orid) from orders where mid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			int countorid=rs.getInt(1);
			return countorid;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1; //글번호가 -1이 들어가지 않을꺼니까 -1주기
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}