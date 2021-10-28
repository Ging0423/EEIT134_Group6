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
import org.hibernate.Transaction;

/**
 * Servlet Filter implementation class OpenSessionViewFilter
 */
@WebFilter("/OpenSessionViewFilter")
public class OpenSessionViewFilter implements Filter {
	private Session session;
	private Transaction trans;
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();
			this.session = factory.getCurrentSession();
//			this.session = factory.openSession();
			trans = session.beginTransaction();
			System.out.println("begin transcation");
			
			chain.doFilter(request, response);
			
			trans.commit();
//			session.getTransaction().commit();
			System.out.println("commit ok");
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			//session.getTransaction().rollback();
			System.out.println("rollback");
		} finally {
			System.out.println("session closed");
		}
		return;

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("filter init");
		
	}

	@Override
	public void destroy() {
		System.out.println("filter destroy");
		
	}


}
