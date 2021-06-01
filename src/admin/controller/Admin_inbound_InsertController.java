package admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import admin.dao.Admin_InboundDao;
import admin.vo.Admin_InboundVo;
@WebServlet("/admin/inbound/insert")
public class Admin_inbound_InsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
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
		Admin_InboundVo vo=new Admin_InboundVo(0, sqlDate, inname, inprice, inamount, incolor, insize, incategory);
		int n = Admin_InboundDao.getInstance().insert(vo);
		String cPath=req.getContextPath();
		System.out.println(cPath);
		resp.sendRedirect(cPath+"/admin/inbound/list");
	}
}
