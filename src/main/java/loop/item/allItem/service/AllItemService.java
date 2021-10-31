package loop.item.allItem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemDao;

@Service
@Transactional
public class AllItemService {
	
	@Autowired
	AllItemDao Dao;
	public String getItemName(int itemId) {
		return Dao.getItemName(itemId);
	}
}
