package notice.controller.costomer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements NController{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController mvc2 신호");
		
		String num=request.getParameter("c");
		
		if(num==null){
			num="1";
		}

		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(num);
		
		request.setAttribute("n", n);		
		
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		
	}
}
