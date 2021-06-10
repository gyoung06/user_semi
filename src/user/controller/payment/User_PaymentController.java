package user.controller.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.User_OrdersDao;
import user.dao.User_OrdersDetailDao;

@WebServlet("/user/payment")
public class User_PaymentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// 결제내역에 추가하기.
		// 결제가 완료되었습니다 창 뜨고 구매리스트 이동할 수 있는 버튼 만들기
		// 마일리지 추가
		// 상품테이블에서 재고 빼기
//		insert into orders values(ORDERS_seq.nextval,sysdate,'허지영','01052199755','경기 안양시 동안구 관평로 257경기 안양시 동안구 관양동 1586-5123호 (관양동)','15201',0,0,0,'N','N',null,'1234');
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		User_OrdersDao ordersdao = new User_OrdersDao();
		String[] saveDir = req.getParameterValues("saveDir");
		String[] newDir = req.getParameterValues("newDir");
		String[] upDir = req.getParameterValues("upDir");
		int allSum = Integer.parseInt(req.getParameter("allSum"));
		int useMil = Integer.parseInt(req.getParameter("useMil"));
		int ori = 0;
		if (saveDir.length == 3) {
			ori = ordersdao.buyproduct(saveDir[0], saveDir[2], saveDir[1], allSum, allSum - useMil, id);
		} else if (newDir.length == 3) {
			ori = ordersdao.buyproduct(newDir[0], newDir[2], newDir[1], allSum, allSum - useMil, id);
		} else if (upDir.length == 3) {
			ori = ordersdao.buyproduct(upDir[0], upDir[2], upDir[1], allSum, allSum - useMil, id);
		}
		if (ori <= 1) {
			System.out.println("ordersdao오류발생");
		}

// insert into order_detail(odid,odcolor,odsize,odcount,odmileage,orid,pid) values(1,'레드','s',1,0,18000,18000,1,1);
		String[] orSize = req.getParameterValues("orSize");
		String[] orColor = req.getParameterValues("orColor");
		String[] amount = req.getParameterValues("amount");
		int leng = Integer.parseInt(req.getParameter("leng"));
		User_OrdersDetailDao ordersdetaildao = new User_OrdersDetailDao();
		for (int i = 0; i < leng; i++) {
//			int n = ordersdetaildao.buyproduct(orColor[i], orSize[i], amount[i], orid, pid);
		}
//		update product set psell = psell+(select odcount from order_detail where pid=1) where pid=1;
//		update stock set samount= samount-(select odcount from order_detail where pid=1) where sid=(select sid from stock where sname=(select sname from stock where sid=(select sid from product where pid=1)) and scolor='레드' and ssize='S');
		req.setAttribute("top", "/user/user_content/header.jsp");
		req.setAttribute("content", "/user/user_content/user_board/purchaseOk.jsp");
		req.setAttribute("bottom", "/user/user_content/footer.jsp");

		req.getRequestDispatcher("/user/user_content/index.jsp").forward(req, resp);
	}
}
