package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.Admin_MembersDao;

@WebServlet("/admin/memberlist")
public class Admin_MemberList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		Admin_MembersDao dao=new Admin_MembersDao();
		if(mid==null) {
			
		}
		
		int n=dao.getinfo(Integer.parseInt(mid));
		if(n>0) {
			
		}else {
			
		}
		String cp = req.getContextPath();
		ServletContext application = getServletContext();
		application.setAttribute("cp", cp);
		req.setAttribute("content","/admin/admin_content/memberlist.jsp");
		req.getRequestDispatcher("/admin/admin_content/memberlist.jsp").forward(req, resp);
	}
}
