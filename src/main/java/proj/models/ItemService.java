package proj.models;

import java.lang.reflect.Member;
import java.util.List;

public class ItemService {
	ItemDao ItemDao;
	
	public ItemService() {
		this.ItemDao = new ItemDao();
	}
	
	public List<ItemBean> findAll() {
		return ItemDao.findAll();
	}



}
