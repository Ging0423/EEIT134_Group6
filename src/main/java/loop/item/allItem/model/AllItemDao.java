package loop.item.allItem.model;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AllItemDao {
	@Autowired
	private SessionFactory sessionFactory; 
	
	public String getItemName(int itemId) {
		String itemName = "";
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allItem = session.get(AllItemBean.class, itemId);
		if(Math.floor(itemId/10000) == 1) {
			itemName = allItem.getYarnItem().getItemName();
		}
		if(Math.floor(itemId/20000) == 1) {
			itemName = allItem.getToolsItem().getItemName();
		}
		if(Math.floor(itemId/30000) == 1) {
			itemName = allItem.getBooksItem().getItemName();
		}
		if(Math.floor(itemId/40000) == 1) {
			itemName = allItem.getPackageItem().getItemName();
		}		
		return itemName;
	}
	
}
