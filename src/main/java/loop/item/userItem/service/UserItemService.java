package loop.item.userItem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.service.AllItemService;
import loop.item.allItem.service.ItemImgService;
import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.model.UserItemRepository;

@Service
@Transactional
public class UserItemService {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private UserItemRepository userRepo;
	
	@Autowired
	private AllItemService allItemService;
	
	@Autowired
	private ItemImgService itemImgService;
	
	public void create(UserItemBean bean) {
		userRepo.save(bean);
		AllItemBean allItem = new AllItemBean();
		allItem.setItemId(bean.getItemId());
		allItem.setUserItem(bean);
		allItemService.save(allItem);
	}
	
	public UserItemBean persist(UserItemBean bean) {
		entityManager.persist(bean);
		return bean;
	}

	public List<UserItemBean> findAll() {
		return userRepo.findAll();
	}

	public UserItemBean findById(int itemId) {
		Optional<UserItemBean> bean = userRepo.findById(itemId);
		if(bean.isEmpty()) {
			return null;
		}
		return bean.get();
	}
	
	public UserItemBean update(UserItemBean bean) {
		return userRepo.save(bean);
	}
	
	public void deleteById(Integer id) {
		allItemService.deleteByItemId(id);
		userRepo.deleteById(id);
	}
	
	public List<ItemDisplay> list() {

		List<UserItemBean> list = findAll();
		List<ItemDisplay> items = new ArrayList<ItemDisplay>();
		for (UserItemBean i : list) {
			items.add(new ItemDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
			, itemImgService.findByItemId(i.getItemId()).get(0).getImg()
			, allItemService.getItemPrice(i.getItemId())));
		}
		return items;
	}

}
