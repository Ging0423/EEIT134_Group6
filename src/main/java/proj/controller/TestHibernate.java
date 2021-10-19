package proj.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import proj.models.AllItemBean;
import proj.models.PackageItemBean;
import proj.models.UserItemBean;
import proj.util.HibernateUtil;

public class TestHibernate {

	public static void main(String[] args) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();

		try {
			UserItemBean userItem = new UserItemBean();
			PackageItemBean packageItem = new PackageItemBean();
			AllItemBean allItem = new AllItemBean();

			System.out.println("test");
			System.out.println("test2");

			session.beginTransaction();
//			packageItem.setQty(5);
//			packageItem.setPrice(5);
//			packageItem.setItemName("test");
//			packageItem.setItemDescription("test");
//			packageItem.setImg("test");
//			session.persist(packageItem);
//			allItem.setCategoryId(4);
//			allItem.setId(packageItem.getItemId());
//			allItem.setPackageItem(packageItem);
//			userItem.setItemName("test2");
//			userItem.setUserId(123);
//			userItem.setItemDescription("test2");
//			userItem.setQty(5);
//			userItem.setPrice(555);
//			userItem.setImg("test2");
//			session.persist(userItem);
//			allItem.setCategoryId(5);
//			allItem.setId(userItem.getItemId());
//			allItem.setUserItem(userItem);
			allItem = session.get(AllItemBean.class, 50004);
			System.out.println(allItem.getUserItem().getItemName());
			
			
			
			
//			session.save(allItem);
			
			


			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFatcory();
		}

	}

}
