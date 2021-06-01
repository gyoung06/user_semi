package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.Admin_MembersDao;
import admin.vo.Admin_MembersVo;

@WebServlet("/admin/memberupdate")
public class Admin_MemberupdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		Admin_MembersDao dao=new Admin_MembersDao();
		dao.getinfo(mid);
		req.setAttribute("mid", mid);	
		
		req.setAttribute("content", "/admin/admin_content/member/memberupdate.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		Admin_MembersDao dao=new Admin_MembersDao();
		Admin_MembersVo vo=new Admin_MembersVo();
		dao.update(vo);
		
		req.setAttribute("mid", mid);
		req.setAttribute("content", "/admin/admin_content/member/memberupdate.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
