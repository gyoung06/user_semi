package admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import admin.dao.Admin_InboundDao;
import admin.dao.Admin_StockDao;
import admin.vo.Admin_InboundVo;
import admin.vo.Admin_StockVo;
@WebServlet("/admin/inbound/insert")
public class Admin_inbound_InsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//값 받아오기
		Date indate=null;
		try{
			String indate1=req.getParameter("input_indate");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			indate=(Date)sdf.parse(indate1);
		}catch (Exception e) {
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(indate.getTime());
		
		String inname=req.getParameter("input_inname");
		String inprice1=req.getParameter("input_inprice");
		int inprice=Integer.parseInt(inprice1);
		String inamount1=req.getParameter("input_inamount");
		int inamount=Integer.parseInt(inamount1);
		String incolor=req.getParameter("input_incolor");
		String insize=req.getParameter("input_insize");
		String incategory=req.getParameter("input_incategory");
		
		
		//기존 재고 확인하여 넣기
		boolean check=false;
		int sid=0;
		String sname=null;
		String scolor=null;
		String ssize=null;
		int samount=0;
		Admin_StockDao dao=Admin_StockDao.getInstance();
		ArrayList<Admin_StockVo> stlist=dao.list();
		for(int i=0;i<stlist.size(); i++) {
			sname=stlist.get(i).getSname();
			scolor=stlist.get(i).getScolor();
			ssize=stlist.get(i).getSsize();
			samount=stlist.get(i).getSamount();
			System.out.println(sname);
			System.out.println(scolor);
			System.out.println(ssize);
			System.out.println(samount);
			if(inname.equals(sname) && incolor.equals(scolor) && insize.equals(ssize)) {
				check=true;
				sid=stlist.get(i).getSid();
			}
		}
		if(check==true) {
			int amount=samount+inamount;
			Admin_StockVo stvo=new Admin_StockVo(sid, inname, incolor, insize, amount);
			int n1=Admin_StockDao.getInstance().update(stvo);
			System.out.println("update");
		}else {
			Admin_StockVo stvo1=new Admin_StockVo(0, inname, incolor, insize, inamount);
			int n2=Admin_StockDao.getInstance().insert(stvo1);
			System.out.println("insert");
		}
		
		Admin_InboundVo vo=new Admin_InboundVo(0, sqlDate, inname, inprice, inamount, incolor, insize, incategory);
		int n = Admin_InboundDao.getInstance().insert(vo);
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/admin/inbound/list");
	}
}
