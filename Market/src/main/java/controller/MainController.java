package controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.Product;
import model.ProductDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProductDAO pdao;
       
    public MainController() {
        pdao = new ProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	} // doGet() 끝

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		// command 패턴 경로 설정
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		String nextPage = "";
		
		if(command.equals("/main.do")) {
			nextPage = "/main.jsp";
		} else if(command.equals("/productlist.do")){		
			// 목록 보기 메서드 호출
			List<Product> productlist = pdao.getProductList();
			
			// 모델 생성하기
			request.setAttribute("products", productlist);
		
			nextPage = "/product/list.jsp";
		} else if(command.equals("/productform.do")) {
			nextPage = "/product/pform.jsp";
		} else if(command.equals("/insertproduct.do")) {
			String realFolder = "/Users/rim-yeeun/eclipse/jspworks/Market/src/main/webapp/upload";
			int maxSize = 10*1024*1024;  //10MB
			String encType = "utf-8";    //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy); 
			
			// 입력폼의 데이터 받기
			String pid = multi.getParameter("pid");
			String pname = multi.getParameter("pname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			int pstock = Integer.parseInt(multi.getParameter("pstock"));
			String condition = multi.getParameter("condition");
			
			//file 파라미터 추출
			Enumeration<?> files = multi.getFileNames();
			String pimage = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement(); 
				
				//실제 저장될 이름
				pimage = multi.getFilesystemName(userFilename);
			}
			
			// 상품 객체 1개를 생성
			Product product = new Product();
			
			product.setPid(pid);
			product.setPname(pname);
			product.setPrice(price);
			product.setDescription(description);
			product.setCategory(category);
			product.setPstock(pstock);
			product.setCondition(condition);
			product.setPimage(pimage);
			
			// DB에 저장할 함수 호출
			pdao.insertproduct(product);
			
			// JSP로 할 경우, 데이터가 들어가지 않는 문제 발생
			nextPage = "/productlist.do";
		} else if(command.equals("/productinfo.do")) {
			String pid = request.getParameter("pid");
			
			// 상품 상세보기 메서드 호출
			Product product = pdao.getProduct(pid);
			
			// 모델 생성
			request.setAttribute("product", product);
			
			nextPage = "/product/pinfo.jsp";
		}
		
		// 페이지 이동 (forward, redirect) 
		if(command.equals("/insertproduct.do")) {
			response.sendRedirect("/productlist.do");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);			
		}
		
	} // doPost() 끝
}
