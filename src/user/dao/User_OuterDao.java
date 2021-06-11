package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.dao.Admin_ProductDao;
import admin.vo.Admin_ProductVo;
import test.db.DBConnection;
import user.vo.User_ProductVo;

public class User_OuterDao {
	private static User_OuterDao instance=new User_OuterDao();
	private User_OuterDao() {}
	public static User_OuterDao getInstance() {
		return instance;
	}
	public ArrayList<User_ProductVo> best4(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select * from (select p.pid as pid, substr(p.pimage1,(instr(p.pimage1,'/',-1)+1)) as pimage1, p.pprice as pprice, p.pdiscount as pdiscount, s.sname as sname from product p, stock s order by p.psell desc) where rownum<=4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<User_ProductVo> list=new ArrayList<User_ProductVo>();
			while(rs.next()) {
				int pid=rs.getInt("pid");
				int pprice=rs.getInt("pprice");
				int pdiscount=rs.getInt("pdiscount");
				String pimage1=rs.getString("pimage1");
				String sname=rs.getString("sname");//이름 가져오기
				User_ProductVo vo=new User_ProductVo(pid, pprice, pdiscount, pimage1, sname, null, 0, 0);
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
	public ArrayList<User_ProductVo> list(int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select * from(select board.*,rownum rnum from (select p.pid as pid, substr(p.pimage1,(instr(p.pimage1,'/',-1)+1)) as pimage1, p.pprice as pprice, p.pdiscount as pdiscount, s.sname as sname from product p, stock s where p.sid=s.sid order by p.prdate desc) board) where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<User_ProductVo> list=new ArrayList<User_ProductVo>();
			while(rs.next()) {
				int pid=rs.getInt("pid");
				int pprice=rs.getInt("pprice");
				int pdiscount=rs.getInt("pdiscount");
				String pimage1=rs.getString("pimage1");
				String sname=rs.getString("sname");//이름 가져오기
				User_ProductVo vo=new User_ProductVo(pid, pprice, pdiscount, pimage1, sname, null, 0, 0);
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
	public int getCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			String sql="select NVL(count(*),0) from product";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int n=rs.getInt(1);
				return n;
			}
			return -1;
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
