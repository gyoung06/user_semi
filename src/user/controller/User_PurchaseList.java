package user.controller;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.User_OrdersDao;
import user.vo.UserOrderlistVo;

@WebServlet("/user/purchase")
public class User_PurchaseList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String startdate=req.getParameter("startdate");
		String enddate=req.getParameter("enddate");
		System.out.println("startdate:"+startdate + "enddate:"+enddate);
//		if(startdate==null || enddate==null) {
//			SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
//			Date now = new Date();
//			String enddate1 = sdf.format(now);
//		}
//		System.out.println("startdate1:"+startdate + "enddate1:"+enddate);
//		Date sstartdate=null;
//		Date eenddate=null;
//	    try{
//			String startdate1=req.getParameter("startdate");
//			String enddate1=req.getParameter("enddate");
//	        SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
//	        sstartdate=(Date)sdf.parse(startdate); 
//	        eenddate=(Date)sdf.parse(enddate); 
//	    }catch (Exception e) {
//	       e.printStackTrace();
//	    }
//	    java.sql.Date startdate1 = new java.sql.Date(sstartdate.getTime()); //sql.date로 넣어야 들어감
//	    java.sql.Date enddate1 = new java.sql.Date(eenddate.getTime());
//		}

		
		String spageNum=req.getParameter("pageNum");
		String field=req.getParameter("field");
		System.out.println("field"+field);
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}

		 //System.out.println("startdate:"+startdate+ "enddate:"+enddate);
		User_OrdersDao dao = new User_OrdersDao();
		int startRow=10*pageNum-9;
		int endRow=pageNum*10;
		
		int n=dao.CountOrid(id);
		if(n>0) {
			req.setAttribute("Countorid", n);
		}
		ArrayList<UserOrderlistVo> OrderList=dao.OrderList(startRow, endRow, field, id, startdate, enddate);
		int pageCount=(int)Math.ceil(dao.getCount(field)/10.0);
		int startPageNum=((pageNum-1)/10*10)+1;
		int endPageNum=startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount; //endPageNum값을 pageCount값으로 초기화
		}
		req.setAttribute("OrderList", OrderList);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startdate", startdate);
		req.setAttribute("enddate", enddate);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content","/user/user_content/user_board/purchaseList.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");
		
		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
