package servlet.session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session1")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SessionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 사용하기
		HttpSession session = request.getSession();
		System.out.println("세션 아이디 : " + session.getId());
		System.out.println("최초 세션 생성 시각 : " + new Date(session.getCreationTime()));
		System.out.println("세션 유효 시간 : " + session.getMaxInactiveInterval() + "초");
		
		// 세션 유효 시간 변경
		session.setMaxInactiveInterval(10*60);
		System.out.println("세션 유효 시간 : " + session.getMaxInactiveInterval() + "초" );
		
		// 브라우저에 text/html 보내기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("세션 아이디 : " + session.getId() + "<br>");
		out.println("최초 세션 생성 시각 : " + new Date(session.getCreationTime()) + "<br>");
		out.println("세션 유효 시간 : " + session.getMaxInactiveInterval() + "초<br>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
