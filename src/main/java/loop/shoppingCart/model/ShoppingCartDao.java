package loop.shoppingCart.model;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import loop.item.allItem.model.AllItemBean;
import loop.user.model.UsersBean;

@Repository
@Transactional
public class ShoppingCartDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addToCart(int itemId, int userId, int qty) {
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allItem = session.get(AllItemBean.class, itemId);
		UsersBean user = session.get(UsersBean.class, userId);
		ShoppingCartBean bean = new ShoppingCartBean();

		bean.setItemId(allItem.getItemId());
		bean.setUserId(user.getUserId());
		bean.setQty(qty);
		bean.setAllItem(allItem);
		bean.setUsers(user);
//		Set<ShoppingCartBean> sc = new LinkedHashSet<ShoppingCartBean>(); 
//		sc.add(bean);
//		allItem.setShoppingCart(sc);
//		user.setShoppingCart(sc);

		session.save(bean);
	}

	public List<ShoppingCartBean> selectById(int userId) {
		List<ShoppingCartBean> list = new ArrayList<ShoppingCartBean>();
		Session session = sessionFactory.getCurrentSession();
		String HQL = "from ShoppingCartBean where userId =: id";
		Query q = session.createQuery(HQL);
		q.setParameter("id", 1);
		list = q.getResultList();
		return list;
	}

	public void isExist(int itemId, int userId) {

	}
}
