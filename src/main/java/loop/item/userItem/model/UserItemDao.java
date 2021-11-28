package loop.item.userItem.model;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import loop.item.allItem.model.AllItemBean;

@Repository
@Transactional
public class UserItemDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public UserItemBean selectById(Integer itemId) {
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allBean = new AllItemBean();
		UserItemBean bean = new UserItemBean();
		allBean = session.get(AllItemBean.class, itemId);
		bean = allBean.getUserItem();
		return bean;
	}
	
	public List<UserItemBean> selectAll() {
		List<UserItemBean> list = new ArrayList<UserItemBean>();
		Session session = sessionFactory.getCurrentSession();
		Query<UserItemBean> query = session.createQuery("from UserItemBean", UserItemBean.class);
		list = query.getResultList();
		return list;
		
	}
}
