package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserQnaDAO;
import user.vo.UserQnaVo;

@WebServlet("/admin/qna/reply")
public class Admin_QnareplyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String qid = req.getParameter("qid");
		String qcate = req.getParameter("qcate");
		String qpw = req.getParameter("qpw");
		String qtitle = req.getParameter("qtitle");
		String qcontent = req.getParameter("qcontent");
		String qfile = req.getParameter("qfile");
		int pid = Integer.parseInt(req.getParameter("pid"));

		String mid = req.getParameter("mid");
		int qid1 = Integer.parseInt(req.getParameter("qid"));
		int ref = Integer.parseInt(req.getParameter("qref"));
		int lev = Integer.parseInt(req.getParameter("qlev"));
		int step=Integer.parseInt(req.getParameter("qstep"));
		
		UserQnaVo vo = new UserQnaVo(qid1, qcate, qpw, qtitle, qcontent, qfile, null, lev, ref, mid, pid, step);

		UserQnaDAO dao = new UserQnaDAO();
		dao.reply(vo);

		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/admin/admin_content/board/popupclose.jsp").forward(req, resp);
	}
}
