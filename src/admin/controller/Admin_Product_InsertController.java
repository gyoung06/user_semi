package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//@WebServlet("/admin/product/upload")
public class Admin_Product_InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir=getServletContext().getRealPath("/upload");
		MultipartRequest mr=new MultipartRequest(req, 
				saveDir,
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		System.out.println("업로드 경로:"+saveDir);
		int pprice=Integer.parseInt(mr.getParameter("pprice"));
		int pdiscount=Integer.parseInt(mr.getParameter("pdiscount"));
		String orgpimage1=mr.getOriginalFileName("pimage1");
		String savepimage1=mr.getFilesystemName("pimage1");
		String orgpimage2=mr.getOriginalFileName("pimage2");
		String savepimage2=mr.getFilesystemName("pimage2");
		String orgpimage3=mr.getOriginalFileName("pimage3");
		String savepimage3=mr.getFilesystemName("pimage3");
		
	}
}
