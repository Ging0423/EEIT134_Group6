package proj.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import proj.models.YarnItemBean;
import proj.service.YarnItemService;
import proj.util.HibernateUtil;

/**
 * Servlet implementation class YarnItemRead
 */
@WebServlet("/item/yarnItem")
public class YarnItemRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private YarnItemService service;
	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session = factory.getCurrentSession();

	public void init() {
		service = new YarnItemService(session);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("itemId"));
		int itemId = Integer.parseInt(request.getParameter("itemId"));			
		YarnItemBean bean = new YarnItemBean();
		bean = service.selectById(itemId);		
		request.setAttribute("allItem", bean);
		System.out.println(bean.getItemName());
		System.out.println(bean.getItemId());
		System.out.println("test");
		RequestDispatcher rd = request.getRequestDispatcher("/item/yarnItem.jsp");
		rd.forward(request, response);
		return;
	}

	

}
