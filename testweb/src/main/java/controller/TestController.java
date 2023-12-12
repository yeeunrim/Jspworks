package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TestDAO;

@WebServlet("*.do") // 디랙터리 패턴 - 끝에 와일드카드(*)가 필요하다. (에러 발생 ...)
public class TestController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	TestDAO tDAO = new TestDAO();

    public TestController() {
        tDAO = new TestDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8080/testweb/board/list.do
		
		// 경로 생성 (컨텍스트 + 요청경로)
		String uri = request.getRequestURI();
		// String contextPath = request.getContextPath();
		String nextPage = "";
		
		// 커멘트 패턴 (요청경로)
		// 맨 뒤에서부터 "/"를 찾을 것이다.
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		
		if(command.equals("/list.do")) { // 가상 경로를 요청 시, 
			// System.out.println("/list.do 경로가 요청되었습니다.");
			tDAO.list();
			
			nextPage = "/board/boardlist.jsp";
			
			// RequestDispatcher dispatch = request.getRequestDispatcher("/board/boardlist.jsp"); // 실제 경로로 이동
			// dispatch.forward(request, response);
		}
		
		else if(command.equals("/write.do")) {
			// System.out.println("/write.do 경로가 요청되었습니다.");
			tDAO.write();
		}
		
		else if(command.equals("/test.do")) {
			String message = "안녕하세요.";
			
			request.setAttribute("msg", message);
			
			nextPage = "test.jsp";
		}
		
		// System.out.println(uri);
		// System.out.println(contextPath);
		

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
