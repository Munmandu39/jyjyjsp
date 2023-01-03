package notice.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.costomer.NoticeController;
import notice.controller.costomer.NoticeDelProcController;
import notice.controller.costomer.NoticeDetailController;
import notice.controller.costomer.NoticeEditController;
import notice.controller.costomer.NoticeEditProcController;
import notice.controller.costomer.NoticeRegController;
import notice.controller.costomer.NoticeRegProcController;

public class MyDispatcher extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(".do신호");
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
		
		
		System.out.println("com : "+com);
		
//		NoticeDetailController controller1=new NoticeDetailController();
//		NoticeEditController controller2=new NoticeEditController();

		NController ncontroller=null;
		
		try {
			if(com.equals("/customer/noticeDetail.do")) {
//				controller1.execute(request,response);
				ncontroller=new NoticeDetailController();
				
			}else if(com.equals("/customer/noticeEdit.do")) {
//				controller2.execute(request,response);
				ncontroller=new NoticeEditController(); 
			}else if(com.equals("/customer/noticeEditProc.do")) {
				ncontroller=new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
				ncontroller=new NoticeRegController();
			}else if(com.equals("/customer/noticeRegPro.do")) {
				ncontroller=new NoticeRegProcController();
			}else if(com.equals("/customer/notice.do")) {
				ncontroller=new NoticeController();
			}else if(com.equals("/customer/noticeDelProc.do")) {
				ncontroller=new NoticeDelProcController();
			}
						
			ncontroller.execute(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}	
}
