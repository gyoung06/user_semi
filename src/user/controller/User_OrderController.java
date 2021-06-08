package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.UserProductDAO;
import user.dao.UserStockDAO;
import user.dao.User_MembersDao;
import user.vo.UserStockVo;
import user.vo.User_MembersVo;
import user.vo.User_ProductVo;

@WebServlet("/user/order")
public class User_OrderController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		String size = req.getParameter("size");
		String color = req.getParameter("color");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		UserProductDAO productdao = new UserProductDAO();
		User_ProductVo productvo = productdao.productDetail(Integer.parseInt(pid));
		UserStockDAO stockdao = new UserStockDAO();
		UserStockVo stockvo = stockdao.stockDetail(productvo.getSid());
		User_MembersDao memberdao = new User_MembersDao();
		User_MembersVo membervo = memberdao.findInfo(id);
		req.setAttribute("productvo", productvo);
		req.setAttribute("stockvo", stockvo);
		req.setAttribute("membervo", membervo);
		req.setAttribute("size", size);
		req.setAttribute("color", color);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/goodsOrder.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
