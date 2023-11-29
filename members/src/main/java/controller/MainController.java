package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 10L;
	MemberDAO mDAO;
 
    public MainController() {
    	// MainController가 실행될 때마다 계속 생성 (생성자)
        mDAO = new MemberDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 경로 설정
		// uri = context(/) + 파일 경로
		String uri = request.getRequestURI();
		System.out.println(uri);
		// command 패턴으로 경로 지정
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		
		String nextPage = "";
		
		if(command.equals("/memberlist.do")) {
			// 회원정보를 db에서 가져옴
			List<Member> memberList = mDAO.getMemberList();
			
			// 모델 생성 
			request.setAttribute("memberList", memberList);
			
			// 이동할 페이지
			nextPage = "/member/memberlist.jsp";
		} else if(command.equals("/joinform.do")) {
			nextPage = "/member/joinform.jsp";
		} else if(command.equals("/insertmember.do")) {
			// 빈 회원 객체 생성해서 데이터를 받아서 세팅
			// 폼 데이터 받기
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			
			// 객체에 데이터 세팅
			Member m = new Member();
			m.setId(id);
			m.setPasswd(passwd);
			m.setName(name);
			m.setEmail(email);
			m.setGender(gender);
			
			// db에 저장함
			mDAO.insertMember(m);
			
			// 회원가입 후 페이지 이동
			nextPage = "/index.jsp";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
