package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;
import reply.Reply;
import reply.ReplyDAO;
import voter.Voter;
import voter.VoterDAO;

@WebServlet("*.do") // '/'이하의 경로에서 do로 끝나면 모두 허용
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 10L;
	
	// 필드
	MemberDAO mDAO;
	BoardDAO bDAO;
	ReplyDAO rDAO;
	VoterDAO vDAO;
 
    public MainController() {
    	// MainController가 실행될 때마다 계속 생성 (생성자)
        mDAO = new MemberDAO();
        bDAO = new BoardDAO();
        rDAO = new ReplyDAO();
        vDAO = new VoterDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		// 컨첵츠 유형
		response.setContentType("text/html; charset=utf-8");
		
		String contentType = request.getContentType();
		System.out.println("Content-Type: " + contentType);
		
		// 경로 설정
		// uri = context(/) + 파일 경로 (.do)
		String uri = request.getRequestURI();
		System.out.println(uri);
		// command 패턴으로 경로 지정
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		
		// 이동할 페이지 초기화
		String nextPage = "";
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		
		// view에 출력 객체 생성
		PrintWriter out = response.getWriter();
		
		// 회원
		if(command.equals("/main.do")) {
			// 메인 페이지에 게시글 보내기
			List<Board> boardList = bDAO.getBoardList();
			request.setAttribute("boardList", boardList);
			// System.out.println(boardList.size() + "개");
			
			if(boardList.size() >= 3) {
				// 게시글 3개를 저장할 배열 생성
				Board[] newBoards = {boardList.get(0), boardList.get(1),  boardList.get(2)};
				request.setAttribute("boardList", newBoards);
			}
			
			nextPage = "/main.jsp";
		} else if(command.equals("/memberlist.do")) {
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
		} else if(command.equals("/memberview.do")){
			String id = request.getParameter("id");
			
			Member member = mDAO.getMember(id);
			
			// 모델 생성
			request.setAttribute("member", member);
			
			nextPage = "/member/memberview.jsp";
		} else if(command.equals("/loginform.do")) { // 로그인 폼페이지 이동
			nextPage = "/member/loginform.jsp";
		} else if(command.equals("/login.do")) { // 로그인 처리
			// 아이디와 비밀번호 파라미터 받기
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			// 빈 객체를 생성해서 아이디와 비밀번호 세팅
			Member m = new Member();
			m.setId(id);
			m.setPasswd(passwd);
			
			// 로그인 인증
			Member member = mDAO.checkLogin(m);
			String name = member.getName();
			if(name != null) { //result가 true이면 세션 발급
				session.setAttribute("sessionId", id);  //아이디 세션발급
				session.setAttribute("sessionName", name); //이름 세션 발급
				//로그인 후 페이지 이동
				nextPage = "/index.jsp";
			}else {
				//에러를 모델로 보내기
				String error = "아이디나 비밀번호를 다시 확인해주세요.";
				request.setAttribute("error", error);
				//에러 발생후 페이지 이동
				nextPage ="/member/loginform.jsp";
			}	
		}else if(command.equals("/logout.do")) {
			session.invalidate(); //모든 세션 삭제
			nextPage = "/index.jsp";
		}
		
		// 게시판
		if(command.equals("/boardlist.do")) {
			// 페이지 처리
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) { // 페이지 번호를 클릭하지 않았을 때 기본값
				pageNum = "1";
			}
			
			// 현재 페이지
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			// 페이지 당 게시글 수 - 10(pageSize)
			// 첫 번째 행(startRow) - 1페이지 : 1번, 2페이지 : 11번, 3페이지 : 21번
			int startRow = (currentPage - 1) * pageSize + 1;
			// System.out.println(startRow);
			
			// 시작 페이지 
			int startPage = startRow / pageSize + 1;
			
			// 종료 페이지 (전체 게시글 수 / 페이지 당 개수)
			int totalRow = bDAO.getBoardCount();
			int endPage =  totalRow / pageSize;
			// 페이지당 개수(10)로 나누어 떨어지지 않는 경우 오류 해결
			endPage = (totalRow % pageSize == 0) ? endPage : endPage + 1;
			// System.out.println("마지막 페이지: " + endPage);
			
			
			// 검색 처리
			// 임시로 저장
			String _field = request.getParameter("field");
			String _kw = request.getParameter("kw");
			
			String field = "";
			String kw = "";
			// null 처리
			if(_field != null) {
				field = _field; 
			} else {
				field = "title";
			}
			
			if(_kw != null) {
				kw = _kw; 
			} else {
				kw = "";
			}
			
			// db에서 list를 가져옴
			// List<Board> boardList = bDAO.getBoardList(currentPage);
			// 검색 처리
			//List<Board> boardList = bDAO.getBoardList(field, kw);
			List<Board> boardList = bDAO.getBoardList(field, kw, currentPage);
			
			// 모델로 생성
			request.setAttribute("boardList", boardList);
			request.setAttribute("page", currentPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("kw", kw);
			request.setAttribute("field", field);
			
			nextPage = "/board/boardlist.jsp";
		} else if(command.equals("/writeform.do")) {
			nextPage = "/board/writeform.jsp";
		} else if(command.equals("/write.do")) {
			String realFolder = "Users/rim-yeeun/eclipse/jspworks/members/src/main/webapp/upload";
			int maxSize = 10*1024*1024;  //10MB
			String encType = "utf-8";    //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, 
								maxSize, encType, policy); 
			
			//폼 일반 속성 데이터 받기
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			//세션 가져오기
			String id = (String)session.getAttribute("sessionId");

			//file 파라미터 추출
			Enumeration<?> files = multi.getFileNames();
			String filename = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement(); 
				
				//실제 저장될 이름
				filename = multi.getFilesystemName(userFilename);
			}
			
			//db에 저장
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setFilename(filename);
			b.setId(id);
			//write 메서드 실행
			bDAO.write(b);
		} else if(command.equals("/boardview.do")) {
			// 글제목에서 요청한 글 번호 받기
			int bno =  Integer.parseInt(request.getParameter("bno"));
			// 글 상세보기 처리
			Board board = bDAO.getBoard(bno);
			// 세션 아이디 가져오기
			String id = (String)session.getAttribute("sessionId");
			
			// 좋아요 개수 - 해당 게시글의 총 개수를 출력
			int voteCount = vDAO.voteCount(bno);
			System.out.println("좋아요 수 :  " + voteCount);
			
			// 하트의 상태 바꾸기
			boolean sw = false;
			int result = vDAO.checkVoter(bno, id); // 게시글 번호, 세션 아이디
			if(result == 0) {
				sw = true;
			} else {
				sw = false;
			}
			
			//댓글 목록 보기
			List<Reply> replyList = rDAO.getReplyList(bno);
			
			//모델 생성해서 뷰로 보내기
			request.setAttribute("board", board);
			request.setAttribute("replyList", replyList);
			request.setAttribute("voteCount", voteCount); // 좋아요 수
			request.setAttribute("sw", sw);
			
			nextPage = "/board/boardview.jsp";
		} else if(command.equals("/deleteboard.do")) {
			int bno =  Integer.parseInt(request.getParameter("bno"));
			//삭제 처리
			bDAO.deleteboard(bno);
			
			nextPage ="/boardlist.do";
		} else if(command.equals("/updateBoardform.do")) {
			//수정을 위해서 게시글 가져오기
			int bno =  Integer.parseInt(request.getParameter("bno"));
			//게시글 1건 가져오기
			Board board = bDAO.getBoard(bno);
			//모델 생성
			request.setAttribute("board", board);
			
			nextPage = "/board/updateBoardform.jsp";
		} else if(command.equals("/updateboard.do")) {
			String realFolder = "/Users/rim-yeeun/eclipse/jspworks/members/src/main/webapp/upload";
			int maxSize = 10*1024*1024;  //10MB
			String encType = "utf-8";    //파일이름 한글 인코딩
			
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, 
								maxSize, encType, policy); 
			
			// 폼 일반 속성 데이터 받기
			int bno = Integer.parseInt(multi.getParameter("bno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
		
			//file 파라미터 추출
			Enumeration<?> files = multi.getFileNames();
			String filename = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement(); 
				
				//실제 저장될 이름
				filename = multi.getFilesystemName(userFilename);
			}
			
			// db에 저장
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setFilename(filename);
			b.setBno(bno);
			
			// 파일 유무에 따른 처리
			if(filename != null) {
				bDAO.updateboard(b);				
			} else {
				bDAO.updateboardNoFile(b);
			}
			
			//nextPage = "/boardlist.do";
		} else if(command.equals("/like.do")) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			String id = request.getParameter("id");
			
			// 좋아요 추가
			Voter voter = new Voter();
			voter.setBno(bno);
			voter.setMid(id);
			
			// 좋아요 저장 유무 체크
			int result = vDAO.checkVoter(bno, id);
			if(result == 0) { // db에 없으면 (저장 안됨)
				vDAO.insertVote(voter); // 좋아요 추가
			} else {
				vDAO.deleteVote(voter); // 좋아요 삭제
			}
			
			
			
			// 좋아요 삭제
			
		}
		
		//댓글 구현
		if(command.equals("/insertreply.do")) {
			//댓글 폼 데이터 받기
			int bno =  Integer.parseInt(request.getParameter("bno"));
			String rcontent = request.getParameter("rcontent");
			String replyer = request.getParameter("replyer");
			
			//댓글 등록 처리
			Reply r = new Reply();
			r.setBno(bno);
			r.setRcontent(rcontent);
			r.setReplyer(replyer);
			
			rDAO.insertreply(r);
		}if(command.equals("/deletereply.do")) {
			int rno = Integer.parseInt(request.getParameter("rno"));
			//삭제 처리 메서드 호출
			rDAO.deletereply(rno);
		}
			
		//redirect와 forword 구분하기
		//새로고침하면 게시글, 댓글 중복 생성 문제 해결
		if(command.equals("/write.do") || command.equals("/updateboard.do")) {
			response.sendRedirect("/boardlist.do");
		} else if(command.equals("/insertreply.do") || command.equals("/deletereply.do") || command.equals("/like.do")) {
			int bno =  Integer.parseInt(request.getParameter("bno"));
			response.sendRedirect("/boardview.do?bno=" + bno);
		} else {
			RequestDispatcher dispatch = 
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}

}
