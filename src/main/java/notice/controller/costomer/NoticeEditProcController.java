package notice.controller.costomer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements NController{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditProcController mvc2 신호");
		
		request.setCharacterEncoding("utf-8");

		String num=request.getParameter("c");

		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice n=new Notice();
		n.setSeq(num);
		n.setTitle(title);
		n.setContent(content);

		NoticeDao dao=new NoticeDao();
		int cnt=dao.update(n); //여기까지 정상처리 되었다면 업데이트 완료
		
		
		//detail로 가는 처리
		n=dao.getNotice(num); //20라인에 객체가 있으니 그대로 가져옴
		
		
		//request에 Notice n을 담기
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}
