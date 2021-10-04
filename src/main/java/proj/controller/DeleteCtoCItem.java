package proj.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.models.CtoCItemService;

/**
 * Servlet implementation class DeleteCtoCItem
 */
@WebServlet("/proj/DeleteCtoCItem.do")
public class DeleteCtoCItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtoCItemService service = new CtoCItemService();
		service.deleteItem(request.getParameter("itemId"));
		String context = request.getContextPath();
		response.sendRedirect(response.encodeRedirectURL(context+"/proj/ShowItems.do"));

	}

}
