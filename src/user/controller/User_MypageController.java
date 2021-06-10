package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.User_GradeDao;
import user.dao.User_MembersDao;
import user.dao.User_OrdersDao;
import user.vo.User_GradeVo;

@WebServlet("/user/mypage")

public class User_MypageController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String pwd=(String)session.getAttribute("pwd");
		User_MembersDao daom=new User_MembersDao();
		int getCountOrder=daom.getCountOrder(id);
		int getCountTotal=daom.getCountTotal(id);
		
		User_OrdersDao DAOO=new User_OrdersDao();
		int DelReady=DAOO.DelReady(id); //마이페이지 : 배송중~ 반품
		int UnderDel=DAOO.DelReady(id);
		int DelFin=DAOO.DelReady(id);
		int OrderCc=DAOO.DelReady(id);
		int OrderReturn=DAOO.DelReady(id);
		
		User_GradeDao dao=new User_GradeDao();
		User_GradeVo vo=dao.getGrade(id);
		System.out.println(id + pwd);
		session.setAttribute("gid", vo.getGid());
		session.setAttribute("glevel", vo.getGlevel());
		session.setAttribute("gbuy", vo.getGbuy());
		if(vo.getGlevel().equals("friend")) {
			String nextSum="100000";
			String nextDrate="3";
			session.setAttribute("nextSum", nextSum);
			session.setAttribute("nextDrate", nextDrate);
		}else if(vo.getGlevel().equals("family")) {
			String nextSum="300000";
			String nextDrate="5";
			session.setAttribute("nextSum", nextSum);
			session.setAttribute("nextDrate", nextDrate);
		}else if(vo.getGlevel().equals("vip ")) {
			String nextSum="500000";
			String nextDrate="7";
			session.setAttribute("nextSum", nextSum);
			session.setAttribute("nextDrate", nextDrate);
		}//vvip는 어떻게 나타낼지
		
		req.setAttribute("DelReady", DelReady);
		req.setAttribute("UnderDel", UnderDel);
		req.setAttribute("DelFin", DelFin);
		req.setAttribute("OrderCc", OrderCc);
		req.setAttribute("OrderReturn", OrderReturn);
		req.setAttribute("getCountTotal", getCountTotal);
		req.setAttribute("getCountOrder", getCountOrder);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content","/user/user_content/user_board/userInfo/mypage.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");
		
		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
