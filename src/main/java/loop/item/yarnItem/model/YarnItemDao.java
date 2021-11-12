package loop.item.yarnItem.model;

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
public class YarnItemDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public YarnItemBean selectById(Integer itemId) {
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allBean = new AllItemBean();
		YarnItemBean bean = new YarnItemBean();
		allBean = session.get(AllItemBean.class, itemId);
		bean = allBean.getYarnItem();
		return bean;
	}
	
	public List<YarnItemBean> selectAll() {
		List<YarnItemBean> list = new ArrayList<YarnItemBean>();
		Session session = sessionFactory.getCurrentSession();
		Query<YarnItemBean> query = session.createQuery("from YarnItemBean", YarnItemBean.class);
		list = query.getResultList();
		return list;
		
	}
}
