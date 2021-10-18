package proj.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import proj.models.AllItemBean;
import proj.models.UserItemBean;
import proj.util.HibernateUtil;

public class TestHibernate {

	public static void main(String[] args) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		

		try {
			UserItemBean userItem = new UserItemBean();
			
			AllItemBean allItem = new AllItemBean();
			
			userItem.setItemName("test1");
			userItem.setUserId(123);
			userItem.setItemDescription("test1");
			userItem.setQty(5);
			userItem.setPrice(555);
			userItem.setImg("test1");
			allItem.setCategoryId(5);
			allItem.setUserItem(userItem);
			
			
			
			session.beginTransaction();
			session.save(allItem);
			
			
			

			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFatcory();
		}


	}

}
