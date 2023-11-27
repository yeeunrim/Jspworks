<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String realFolder = "/Users/rim-yeeun/eclipse/jspworks/jwbook2/src/main/webapp/upload";

	// 5가지의 생성자 포함
	// request, 업로드폴더경로, 파일사이즈, 인코딩, 중복파일이름추가
	// 5*1024*1024 = 최대 5Mb (mega byte)
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
				5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	// 일반 name 속성
	// String name = request.getParameter("username");
	// String title = request.getParameter("title");
	String name = multi.getParameter("username");
	String title = multi.getParameter("title");
	
	out.println("이름 : " + name + "<br>");
	out.println("제목 : " + title + "<br>");
	
	// file name 속성
	Enumeration<String> files = multi.getFileNames(); // 복수
	while(files.hasMoreElements()){
		String fname = files.nextElement(); // 파일의 name 속성이 있으면
		String filename = multi.getFilesystemName(fname); // 업로드된 파일
		String original = multi.getOriginalFileName(fname); // 원본 파일
		String type = multi.getContentType(fname); // 원본 파일
		
		// 파일의 용량 알기 (file 객체 생성)
		File file = multi.getFile(fname);
		
		out.println("파일 이름 : " + filename + "<br>");
		out.println("원본 파일 : " + original + "<br>");
		out.println("파일 유형 : " + type + "<br>");
		
		if(file != null){
			out.println("파일 크기 : " + file.length() + "B");
		}
	}
%>