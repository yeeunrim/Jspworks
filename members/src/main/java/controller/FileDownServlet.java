package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filedown.do")
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String filename = request.getParameter("filename");
			
			ServletContext context = getServletContext();
			String realFolder = context.getRealPath("upload");
			
			//실제 서버에 저장된 파일이름
			String realFile = realFolder + "/" + filename;
			
			//파일 객체 생성
			File file = new File(realFile);
			
			//파일이름에 한글이 포함되어 있는 경우 - 인코딩
			filename = new String(filename.getBytes("utf-8"), "ISO-8859-1");
			
			//헤더 설정
			//Content-Disposition-저장 형태, attachment-파일저장, inline-브라우저 저장
			response.setHeader("Content-Disposition", 
								"attachment;filename=\"" + filename + "\"");
			//다운로드할 파일 크기를 클라이언트에 전달
			response.setContentLength((int)file.length());
			//항상 파일이 서버에서 다운로드 되도록함, cache(임시저장)에서 다운로드되지 않고..
			response.setHeader("Cache-control", "no-cache");
			
			//파일 쓰기- 다운로드(저장)
			//파일 읽어오기
			FileInputStream in = new FileInputStream(file);
			//파일 쓰기
			OutputStream out = response.getOutputStream();
			
			//저장할 배열 생성
			byte[] data = new byte[1024*1024];
			
			int count = -1; //읽은 바이트 수
			while((count = in.read(data)) != -1) {
				out.write(data, 0, count);
			}
			in.close();
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}