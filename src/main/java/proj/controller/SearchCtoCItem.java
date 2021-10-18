package proj.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.models.UserItemBean;
import proj.models.UserItemService;

/**
 * Servlet implementation class SearchCtoCItem
 */
@WebServlet("/proj/SearchCtoCItem")
public class SearchCtoCItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("search");
		String select = request.getParameter("select");
		UserItemService service = new UserItemService();
		List<UserItemBean> item = service.search(keyword, select);
		request.setAttribute("allItem", item);
		RequestDispatcher rd = request.getRequestDispatcher("/proj/ShowItems.do");	
		rd.forward(request, response);
		return;
	}

}
