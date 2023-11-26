package servlet.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginsession")
public class LoginSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginSessionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩 요청
		request.setCharacterEncoding("utf-8");
		
		// 폼에 입력된 데이터 가져오기
		String id = request.getParameter("uid");
		String pw = request.getParameter("upwd");
		
		// 브라우저로 보내기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 로그인 인증 후 세션 발급
		HttpSession session = request.getSession();
		
		if(id.equals("khit") && pw.equals("1234")) {
			session.setAttribute("userID", id);
			String sessionId = (String)session.getAttribute("userID");
			out.println(sessionId + "님이 로그인했습니다.");
		} else {
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	
		// out.println("아이디 : " + id + "<br>");
		// out.println("비밀번호 : " + pw + "<br>");
	}

}
