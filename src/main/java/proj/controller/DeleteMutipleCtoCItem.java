package proj.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.models.UserItemService;

/**
 * Servlet implementation class deleteMutipleCtoCItem
 */
@WebServlet("/proj/deleteMutipleCtoCItem.do")
public class DeleteMutipleCtoCItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id = request.getParameterValues("array");
		String array[] = id[0].split(",");
		UserItemService service = new UserItemService();
		service.deleteMultiItem(array);
		String context = request.getContextPath();
		response.sendRedirect(response.encodeRedirectURL(context+"/proj/ShowItems.do"));
	}

}
