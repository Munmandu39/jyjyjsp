package notice.controller.costomer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeRegProcController implements NController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeRegProcController mvc2 신호");
		
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice n=new Notice();
		n.setTitle(title);
		n.setContent(content);

		NoticeDao dao=new NoticeDao();
		int cnt=dao.insert(n);

		if(cnt>0){
			response.sendRedirect("notice.jsp");
		}
		
		//내가 한 것
		//request.getRequestDispatcher("notice.jsp").forward(request, response);
	}

}
