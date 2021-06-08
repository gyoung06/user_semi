package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserQnaDAO;
import user.vo.UserQnaVo;

@WebServlet("/user/qnainsert")
public class User_QnaInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String qcate=req.getParameter("qcate");
		String qtitle=req.getParameter("qtitle");
		String qcontent=req.getParameter("qcontent");
		String qpw=req.getParameter("qpw");
		
		
		UserQnaDAO dao=new UserQnaDAO();
		
		UserQnaVo vo=new UserQnaVo(0, qcate, qpw, qtitle, qcontent, qcontent, null, 0, 0, mid, 0);
		dao.insert(vo);
						
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/qna.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
