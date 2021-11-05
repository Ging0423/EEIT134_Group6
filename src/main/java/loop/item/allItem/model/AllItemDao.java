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
	
	public String getItemName(Integer itemId) {
		String itemName = "";
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allItem = session.get(AllItemBean.class, itemId);
		char id = Integer.toString(itemId).charAt(0);
		System.out.println(id);
		if(id == '1') {
			itemName = allItem.getYarnItem().getItemName();
		}
		else if(id == '2') {
			itemName = allItem.getToolsItem().getItemName();
		}
		else if(id == '3') {
			itemName = allItem.getBooksItem().getItemName();
		}
		else if(id == '4') {
			itemName = allItem.getPackageItem().getItemName();
		}		
		return itemName;
	}
	
	public Integer getItemPrice(int itemId) {
		int price = 0;
		Session session = sessionFactory.getCurrentSession();
		AllItemBean allItem = session.get(AllItemBean.class, itemId);
		char id = Integer.toString(itemId).charAt(0);
		if(id == '1') {
			price = allItem.getYarnItem().getPrice();
		}
		if(id == '2') {
			price = allItem.getToolsItem().getPrice();
		}
		if(id == '3') {
			price = allItem.getBooksItem().getPrice();
		}
		if(id == '4') {
			price = allItem.getPackageItem().getPrice();
		}		
		return price;
	}
	
}
