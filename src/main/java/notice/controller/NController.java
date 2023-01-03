package notice.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface NController {
	//interface - 추상메소드 모임
	
	//Conteroller에 execute가 있음
	//중괄호가 있으면 추상메소드가 아님
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
		
}
