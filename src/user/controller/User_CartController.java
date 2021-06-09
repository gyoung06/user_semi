package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/cart")
public class User_CartController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//여기로 넘어온것들 추가
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/cart.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
