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
import user.dao.User_GradeDao;
import user.dao.User_MembersDao;
import user.vo.UserStockVo;
import user.vo.User_GradeVo;
import user.vo.User_MembersVo;
import user.vo.User_ProductVo;

@WebServlet("/user/order")
public class User_OrderController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pid = req.getParameter("pid");
		String[] orSize = req.getParameterValues("orSize");
		String[] orColor = req.getParameterValues("orColor");
		String[] amount = req.getParameterValues("amount");
		String[] orMileage = req.getParameterValues("orMileage");
		int leng = orSize.length;
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		UserProductDAO productdao = new UserProductDAO();
		User_ProductVo productvo = productdao.productDetail(Integer.parseInt(pid));
		UserStockDAO stockdao = new UserStockDAO();
		UserStockVo stockvo = stockdao.stockDetail(productvo.getSid());
		User_MembersDao memberdao = new User_MembersDao();
		User_MembersVo membervo = memberdao.findInfo(id);
		User_GradeDao gradedao = new User_GradeDao();
		User_GradeVo gradevo = gradedao.getGrade(id);
		int per = 0;
		if (gradevo.getGlevel().equals("friend")) {
			per = 1;
		}
		if (gradevo.getGlevel().equals("family")) {
			per = 3;
		}
		if (gradevo.getGlevel().equals("vip")) {
			per = 5;
		}
		if (gradevo.getGlevel().equals("vvip")) {
			per = 7;
		}
		req.setAttribute("productvo", productvo);
		req.setAttribute("stockvo", stockvo);
		req.setAttribute("membervo", membervo);
		req.setAttribute("size", orSize);
		req.setAttribute("color", orColor);
		req.setAttribute("amount", amount);
		req.setAttribute("mileage", orMileage);
		req.setAttribute("leng", leng);
		req.setAttribute("gradevo", gradevo);
		req.setAttribute("gradevo", gradevo);
		req.setAttribute("per", per);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/goodsOrder.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
