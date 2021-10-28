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
import proj.service.YarnItemService;

@WebServlet("/item/yarn")
public class ReadCtoC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		YarnItemService itemService = new YarnItemService();
		List<YarnItemBean> Item = itemService.selectAll();
		request.setAttribute("allItem", Item);
		request.setAttribute("test", "test");
		RequestDispatcher rd = request.getRequestDispatcher("/item/yarn.jsp");	
		rd.forward(request, response);
		return;
	}

}
