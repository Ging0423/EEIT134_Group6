package proj.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.models.*;

@WebServlet("/proj/ShowItems.do")
public class ReadCtoC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getAttribute("allItem") == null) {
			UserItemService itemService = new UserItemService();
		List<UserItemBean> Item = itemService.selectAll();
		request.setAttribute("allItem", Item);
		RequestDispatcher rd = request.getRequestDispatcher("/proj/ShowItems.jsp");	
		rd.forward(request, response);
		return;
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/proj/ShowItems.jsp");	
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
