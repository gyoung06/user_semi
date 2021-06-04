package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserProductDAO;
import user.dao.UserQnaDAO;
import user.dao.UserStockDAO;
import user.vo.UserQnaVo;
import user.vo.UserStockVo;
import user.vo.User_ProductVo;

@WebServlet("/user/productDetail")
public class User_ProductDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		UserProductDAO dao = new UserProductDAO();
		User_ProductVo vo = dao.productDetail(Integer.parseInt(pid));
		UserStockDAO stockDao = new UserStockDAO();
		UserStockVo stockVo = stockDao.stockDetail(vo.getSid());
		ArrayList<String> colorList = stockDao.chooseColor(stockVo.getSname());
		UserQnaDAO userDao = new UserQnaDAO();
		UserQnaVo userVo = userDao.productQnaList(vo.getPid());
		req.setAttribute("vo", vo);
		req.setAttribute("userVo", userVo);
		req.setAttribute("stockVo", stockVo);
		req.setAttribute("colorList", colorList);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/productDetail.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
