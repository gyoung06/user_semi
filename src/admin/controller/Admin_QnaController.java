package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/admin/qna")
public class Admin_QnaController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("content","/admin/admin_content/board/qna.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		
//		String saveDir=getServletContext().getRealPath("/upload");
//		MultipartRequest mr=new MultipartRequest(req, // request객체
//				saveDir,  //업로드할 디렉토리 경로
//				1024*1024*5, // 최대 업로드 크기(바이트)
//				"utf-8", //인코딩방식
//				new DefaultFileRenamePolicy()//동일한 파일명이 존재할시 파일명뒤에 일련번호(1,2,3,..)을 붙여서 파일 생성
//		);
//		
//		String field=req.getParameter("field");
//		String qwriter=req.getParameter("qwriter");
//		String qpw=req.getParameter("qpw");
//		String qtitle=req.getParameter("qtitle");
//		String qcontent=req.getParameter("qcontent");
//		String orgFileName=mr.getOriginalFileName("file1");//전송된 파일명
//		String saveFileName=mr.getFilesystemName("file1");//서버에 저장된 파일명
		//파일경로 다시받아와야함 (jsp18)
	
			System.out.println("test");
		System.out.println("업로드 경로:" + saveDir);
//		req.setAttribute("filed", field);
//		req.setAttribute("qwriter", qwriter);
//		req.setAttribute("qpw", qpw);
//		req.setAttribute("qtitlq", qtitle);
//		req.setAttribute("qcontent", qcontent);
		req.setAttribute("content","/admin/admin_content/board/qna.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
