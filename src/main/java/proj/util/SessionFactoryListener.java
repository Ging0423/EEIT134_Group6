package proj.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class SessionFactoryListener implements ServletContextListener {


    public SessionFactoryListener() {
        
    }
    
    public void contextInitialized(ServletContextEvent sce)  { 
        HibernateUtil.getSessionFactory();
        System.out.println("sessionfactory created");
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
         HibernateUtil.closeSessionFatcory();
         System.out.println("sessionfactory close");
    }

    
	
}
