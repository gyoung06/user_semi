package admin.controller;

import java.io.IOException;
import java.net.http.HttpConnectTimeoutException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin/main")
public class Admin_HomeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String content = (String)req.getAttribute("content");
		if(content==null) {
			content="/admin/admin_content/main.jsp";
		}
		String cp = req.getContextPath();
		ServletContext application = getServletContext();
		application.setAttribute("cp", cp);
		req.setAttribute("content", content);
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
