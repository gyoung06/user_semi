package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.User_OrdersDao;
import user.dao.User_ReviewDao;
@WebServlet("/user/review")
public class User_ReviewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
//		String sname=req.getParameter("sname");
//		String ordate=req.getParameter("ordate");
//		String odcolor=req.getParameter("odcolor");
//		String odsize=req.getParameter("odsize");
//		String odcount=req.getParameter("odcount");
//		String pimage2=req.getParameter("pimage2");
		String rtitle=req.getParameter("rtitle");
		String rcontent=req.getParameter("rcontent");
		String rphoto1=req.getParameter("rphoto1");
//		String rphoto2=req.getParameter("rphoto2");
//		String rphoto3=req.getParameter("rphoto3");
		int odid=Integer.parseInt(req.getParameter("odid"));
		int sid=Integer.parseInt(req.getParameter("sid"));
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		
		User_ReviewDao dao = new User_ReviewDao();
		User_OrdersDao dao1=new User_OrdersDao();
		int n=dao.insertReview(id, odid, sid, rtitle, rcontent, rphoto1);
		int n1=dao1.CountOrid(id);
		if(n1>0) {
			req.setAttribute("Countorid", n);
		}
		
		req.getRequestDispatcher("/user/user_content/user_board/closePopup.jsp").forward(req, resp);
	}
}
