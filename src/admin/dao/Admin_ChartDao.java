package admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.vo.Admin_InboundVo;
import admin.vo.Admin_ProductVo;
import admin.vo.Admin_StockVo;
import test.db.DBConnection;
import user.vo.UserQnaVo;
import user.vo.User_MembersVo;

public class Admin_ChartDao {
	private static Admin_ChartDao instance=new Admin_ChartDao();
	private Admin_ChartDao() {}
	public static Admin_ChartDao getInstacne() {
		return instance;
	}
	public ArrayList<Admin_InboundVo> inbound_2020(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select to_char(indate,'mm') as indate, sum(inprice) as inprice from inbound WHERE indate >='2020-01-01' AND indate <= '2020-12-31' group by to_char(indate, 'mm') order by indate";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<Admin_InboundVo> list=new ArrayList<Admin_InboundVo>();
			while(rs.next()) {
				int indate=rs.getInt("indate");
				int inprice=rs.getInt("inprice");
				Admin_InboundVo vo=new Admin_InboundVo(indate, null,null, inprice,0,null,null,null);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public ArrayList<Admin_ProductVo> product_2020(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select to_char(prdate,'mm') as prdate, sum((pprice*psell)-(pprice/100*pdiscount)) as pprice from product WHERE prdate >='2020-01-01' AND prdate <= '2020-12-31' group by to_char(prdate,'mm') order by prdate";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<Admin_ProductVo> list=new ArrayList<Admin_ProductVo>();
			while(rs.next()) {
				int prdate=rs.getInt("prdate");
				int pprice=rs.getInt("pprice");
				Admin_ProductVo vo=new Admin_ProductVo(prdate, pprice, 0, null, null, null, 0, 0);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public UserQnaVo qlist(int qlev){
		String sql="select count(*) qid from userqna where qlev=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qlev);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int qid = rs.getInt("qid");
				UserQnaVo vo=new UserQnaVo(qid, null, null, null, null, null, null, 0, 0, null, 0);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public ArrayList<User_MembersVo> joinmember(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select to_char(mrdate,'mm') as mrdate, count(mid) as mmileage from members WHERE mrdate >='2020-01-01' AND mrdate <= '2020-12-31' group by to_char(mrdate, 'mm') order by mrdate";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<User_MembersVo> list=new ArrayList<User_MembersVo>();
			while(rs.next()) {
				int mrdate=rs.getInt("mrdate");
				int mmileage=rs.getInt("mmileage");
				User_MembersVo vo=new User_MembersVo(null, null, null, null, null, null,null, null, mrdate, mmileage, null, null, null, null);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public ArrayList<User_MembersVo> adultmember(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select to_char(MBIRTH,'mm') as MBIRTH, count(mid) as num from members where trunc(months_between(sysdate,mbirth)/12) > 18 group by to_char(MBIRTH, 'mm') order by MBIRTH";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<User_MembersVo> list=new ArrayList<User_MembersVo>();
			while(rs.next()) {
				int mmileage=rs.getInt("num");
				User_MembersVo vo=new User_MembersVo(null, null, null, null, null, null,null, null, 0, mmileage, null, null, null, null);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public ArrayList<User_MembersVo> minormember(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select to_char(MBIRTH,'mm') as MBIRTH, count(mid) as num from members where trunc(months_between(sysdate,mbirth)/12) <= 18 group by to_char(MBIRTH, 'mm') order by MBIRTH";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<User_MembersVo> list=new ArrayList<User_MembersVo>();
			while(rs.next()) {
				int mmileage=rs.getInt("num");
				User_MembersVo vo=new User_MembersVo(null, null, null, null, null, null,null, null, 0, mmileage, null, null, null, null);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
	public ArrayList<Admin_StockVo> underlist(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select sname,samount from stock where samount <50";
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<Admin_StockVo> list=new ArrayList<Admin_StockVo>();
			while(rs.next()) {
				String sname=rs.getString("sname");
				int samount=rs.getInt("samount");
				Admin_StockVo vo=new Admin_StockVo(0, sname,null , null, samount, 0);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
