package loop.shoppingCart.controller;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import loop.item.allItem.model.AllItemBean;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.user.model.UsersBean;

public class TestHibernate {

	
	public static void main(String[] args) {
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();	
		Session session = factory.getCurrentSession();	
		try {
			session.beginTransaction();
			AllItemBean allItem = session.get(AllItemBean.class, 10001);
			UsersBean user = session.get(UsersBean.class, 1);
			ShoppingCartBean bean = new ShoppingCartBean();
			String sql = "from ShoppingCartBean where itemId =: id";
			Query q = session.createQuery(sql);
			q.setParameter("id", allItem.getItemId());
			
//			List<ShoppingCartBean> bean = q.getResultList();
			
//			for(ShoppingCartBean i : bean) {
//				System.out.println(i.getUserId());
//			}
			
			bean.setItemId(allItem.getItemId());
			bean.setUserId(1);
			bean.setQty(2);
			bean.setAllItem(allItem);
			bean.setUsers(user);			
//			Set<ShoppingCartBean> sc = new LinkedHashSet<ShoppingCartBean>(); 
//			sc.add(bean);
//			allItem.setShoppingCart(sc);
//			user.setShoppingCart(sc);
			
			session.save(bean);
			
//			//System.out.println(bean.getItemId());
//			AllItemService service = new AllItemService();
//			String test = service.getItemName(10001);
//			System.out.println(test);
			
			
			session.getTransaction().commit();
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

}
