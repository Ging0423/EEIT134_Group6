package proj.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * Servlet Filter implementation class OpenSessionViewFilter
 */
@WebFilter("/OpenSessionViewFilter")
public class OpenSessionViewFilter implements Filter {
	private Session session;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();
			this.session = factory.getCurrentSession();
			session.beginTransaction();
			System.out.println("begin transcation");
			chain.doFilter(request, response);

			session.getTransaction().commit();
			System.out.println("commit ok");
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println("rollback");
		} finally {
			System.out.println("session closed");
		}

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
