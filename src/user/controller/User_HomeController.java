package user.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/home")
public class User_HomeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String top=(String)req.getAttribute("top");
		String content=(String)req.getAttribute("content");
		String bottom=(String)req.getAttribute("bottom");
		if(top==null) {
			top="/user/user_content/header.jsp";
		}
		if(content==null) {
			content="/user/user_content/main.jsp";
		}
		if(bottom==null) {
			bottom="/user/user_content/footer.jsp";
		}
		req.setAttribute("top", top);
		req.setAttribute("content", content);
		req.setAttribute("bottom", bottom);
		
		String cp=req.getContextPath();
		ServletContext application=getServletContext();
		application.setAttribute("cp", cp);

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
