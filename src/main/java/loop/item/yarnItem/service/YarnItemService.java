package loop.item.yarnItem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.service.AllItemService;
import loop.item.allItem.service.ItemImgService;
import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.model.YarnItemRepository;

@Service
@Transactional
public class YarnItemService{
	
	@Autowired
	private EntityManager entityManager;

	@Autowired
	private YarnItemRepository yarnRepo;
	
	@Autowired
	private AllItemService allItemService;
	
	@Autowired
	private ItemImgService itemImgService;
	
	public void create(YarnItemBean bean) {
		yarnRepo.save(bean);
		AllItemBean allItem = new AllItemBean();
		allItem.setItemId(bean.getItemId());
		allItem.setYarnItem(bean);
		allItemService.save(allItem);
	}
	
	public YarnItemBean persist(YarnItemBean bean) {
		entityManager.persist(bean);
		return bean;
	}
	public List<YarnItemBean> findAll(){
		return yarnRepo.findAll();
	}
	public YarnItemBean findById(Integer itemId) {
		Optional<YarnItemBean> bean = yarnRepo.findById(itemId);
		if(bean.isEmpty()) {
			return null;
		}
		return bean.get();
	}
	
	public YarnItemBean update(YarnItemBean bean) {
		return yarnRepo.save(bean);
	}
	
	public void deleteById(Integer id) {
		AllItemBean allItem = allItemService.findById(id);
		allItem.setYarnItem(null);
		yarnRepo.deleteById(id);
	}

	public List<ItemDisplay> list(){
		
		List<YarnItemBean> list = findAll();
		List<ItemDisplay> items = new ArrayList<ItemDisplay>();
		for (YarnItemBean i : list) {
			items.add(new ItemDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
			, itemImgService.findByItemId(i.getItemId()).get(0).getImg()
			, allItemService.getItemPrice(i.getItemId())));
		}
		return items;
	}
}
