package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDAO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	ProductDAO pDAO;

    public FrontController() {
    	pDAO = new ProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String nextPage = "";
		
		String command = uri.substring(uri.lastIndexOf("/"));
		
		if(command.equals("/list.do")) {
			List<String> products = pDAO.list();
			
			request.setAttribute("products", products);
			
			nextPage = "/product/list.jsp";
		} else if(command.equals("/cart.do")) {
			nextPage = "/product/cart.jsp";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}