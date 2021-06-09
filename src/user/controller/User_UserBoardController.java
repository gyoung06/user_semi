package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import user.dao.UserQnaDAO;
import user.dao.User_UserBoardDao;
import user.vo.UserQnaVo;

@WebServlet("/user/userBoard")
public class User_UserBoardController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String field = req.getParameter("field");
		String keyword = req.getParameter("keyword");
		String spageNum = req.getParameter("pageNum");
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}

		User_UserBoardDao dao = new User_UserBoardDao();
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		ArrayList<UserQnaVo> Qlist = dao.Qlist(id,startRow, endRow, field, keyword);
		int pageCount = (int) Math.ceil(dao.getCount(id,field, keyword) / 10.0);
		int startPageNum = ((pageNum - 1) / 10 * 10) + 1;
		int endPageNum = startPageNum + 9;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		ArrayList<UserQnaVo> Rlist = dao.Rlist(id ,startRow, endRow);
		req.setAttribute("Rlist", Rlist);
		req.setAttribute("Qlist", Qlist);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/userInfo/UserBoard.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
		
	}
}
