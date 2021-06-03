package user.controller.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author hgyou
 *	결제컨트롤러
 */
@WebServlet("/payment")
public class User_PaymentController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/user/user_content/user_board/goodsOrder.jsp").forward(req, resp);
	}
}
