package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.Admin_NoticeDao;
import admin.vo.Admin_NoticeVo;


@WebServlet("/admin/notice/insert")
public class Admin_NoticeinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String fwriter=req.getParameter("fwriter");
		String ftitle=req.getParameter("ftitle");
		String fcontent=req.getParameter("fcontent");
		int fpublic_private=Integer.parseInt(req.getParameter("fpublic_private"));
		
		Admin_NoticeDao dao=new Admin_NoticeDao();
		Admin_NoticeVo vo=new Admin_NoticeVo(0, ftitle, fcontent,null,null,0, fpublic_private,fwriter);
		dao.insert(vo);
		
		req.setAttribute("vo", vo);
		
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/admin/notice/list");
	}
}
