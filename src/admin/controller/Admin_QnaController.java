package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/qna")
public class Admin_QnaController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String field=req.getParameter("field");
		
		String qwriter=req.getParameter("qwriter");
		String qpw=req.getParameter("qpw");
		String qtitle=req.getParameter("qtitle");
		String qcontent=req.getParameter("qcontent");
		//파일경로 다시받아와야함 (jsp18)
		String qfile=req.getParameter("qfile");
				
		req.setAttribute("content","/admin/admin_content/board/qna.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
