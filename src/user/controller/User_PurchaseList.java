package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.User_OrdersDao;
import user.vo.UserOrderlistVo;

@WebServlet("/user/purchase")
public class User_PurchaseList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");
		String field=req.getParameter("field");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		
		User_OrdersDao dao = new User_OrdersDao();
		int startRow=10*pageNum-9;
		int endRow=pageNum*10;

		ArrayList<UserOrderlistVo> list=dao.OrderList(startRow, endRow, field);
		int pageCount=(int)Math.ceil(dao.getCount(field)/10.0);
		int startPageNum=((pageNum-1)/10*10)+1;
		int endPageNum=startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount; //endPageNum값을 pageCount값으로 초기화
		}
		req.setAttribute("OrderList", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content","/user/user_content/user_board/purchaseList.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");
		
		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
