package proj.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.models.UserItemBean;
import proj.service.UserItemService;

/**
 * Servlet implementation class CtoCUpdate
 */
@WebServlet("/proj/UpdateCtoCItem.do")
public class UpdateCtoCItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String itemId = request.getParameter("itemId");
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		String img = request.getParameter("img");
		String description = request.getParameter("description");
		int qty = Integer.parseInt(request.getParameter("qty"));
		int price = Integer.parseInt(request.getParameter("price"));
		UserItemBean bean = new UserItemBean(itemId, memberId, name, qty, price, description, img);
		UserItemService service = new UserItemService();
		service.updateItem(bean, itemId);
		String context = request.getContextPath();
		response.sendRedirect(response.encodeRedirectURL(context+"/proj/ShowItems.do"));
	}

}
