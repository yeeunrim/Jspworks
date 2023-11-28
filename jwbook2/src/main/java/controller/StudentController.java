package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.Student;
import student.StudentDAO;

@WebServlet("*.do") // '/'루트 경로 아래에 새로운 경로가 추가됨
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDAO sDAO;
       
    public StudentController() {
        sDAO = new StudentDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 컨텐츠 유형 응답하기
		response.setContentType("text/html; charset=utf-8");
		
		// 경로(uri) 설정 - 커맨드패턴(command)
		// 맨 뒤 경로 추출 - lastIndexOf('/'), subString(1)
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		
		// 이동할 페이지
		String nextPage = "";
		
		if(command.equals("/studentlist.do")) {
			List<Student> students = sDAO.getStudentList();
			
			// 모델 생성
			request.setAttribute("students", students);
			// 뷰 페이지 이동
			nextPage = "/student/studentlist.jsp";	
		} else if(command.equals("/studentform.do")){
			nextPage = "/student/studentform.jsp";
		} else if(command.equals("/insertstudent.do")) {
			// 폼에 입력된 데이터 받기
			String username = request.getParameter("username");
			String univ = request.getParameter("univ");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			
			// db에 저장 (빈 객체에 데이터 넣어서 db에 보냄)
			Student s = new Student();
			s.setUsername(username);
			s.setUniv(univ);
			s.setBirth(birth);
			s.setEmail(email);
			
			sDAO.insertStudent(s);
			nextPage = "/studentlist.do";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}