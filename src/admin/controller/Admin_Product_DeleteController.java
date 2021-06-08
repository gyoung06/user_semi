package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.Admin_ProductDao;
@WebServlet("/admin/product/delete")
public class Admin_Product_DeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("pid"));
		Admin_ProductDao dao=Admin_ProductDao.getInstance();
		int n=dao.delete(pid);
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/admin/product/list");
	}
}
