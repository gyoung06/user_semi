package user.controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.User_OrdersDao;
import user.vo.UserOrderlistVo;

@WebServlet("/user/purchaseTEST")
public class User_PurchaseList2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String startdate=req.getParameter("startdate");
		String enddate=req.getParameter("enddate");
		String spageNum=req.getParameter("pageNum");
		String field=req.getParameter("field");
		User_OrdersDao dao = new User_OrdersDao();

		int n=dao.CountOrid(id);
		if(n>0) {
			req.setAttribute("Countorid", n);
		}
		
		ArrayList<UserOrderlistVo> OrderList=dao.TEST(field);
		req.setAttribute("OrderList", OrderList);
		req.setAttribute("field", field);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content","/user/user_content/user_board/purchaseList.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");
		
		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
