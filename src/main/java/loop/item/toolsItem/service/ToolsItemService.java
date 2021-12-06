package loop.item.toolsItem.service;

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
import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.toolsItem.model.ToolsItemRepository;

@Service
@Transactional
public class ToolsItemService {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private ToolsItemRepository toolsRepo;
	
	@Autowired
	private AllItemService allItemService;
	
	@Autowired
	private ItemImgService itemImgService;
	
	public void create(ToolsItemBean bean) {
		toolsRepo.save(bean);
		AllItemBean allItem = new AllItemBean();
		allItem.setItemId(bean.getItemId());
		allItem.setToolsItem(bean);
		allItemService.save(allItem);
	}
	
	public ToolsItemBean persist(ToolsItemBean bean) {
		entityManager.persist(bean);
		return bean;

	}
	
	public List<ToolsItemBean> findAll() {
		return toolsRepo.findAll();
	}
	
	public ToolsItemBean findById(int itemId) {
		Optional<ToolsItemBean> bean = toolsRepo.findById(itemId);
		if(bean.isEmpty()) {
			return null;
		}
		return bean.get();
	}
	
	public ToolsItemBean update(ToolsItemBean bean) {
		return toolsRepo.save(bean);
	}
	
	public void deleteById(Integer id) {		
		AllItemBean allItem = allItemService.findById(id);
		allItem.setToolsItem(null);
		toolsRepo.deleteById(id);
	}
	
	public List<ItemDisplay> list(){
		
		List<ToolsItemBean> list = findAll();
		List<ItemDisplay> items = new ArrayList<ItemDisplay>();
		for (ToolsItemBean i : list) {
			items.add(new ItemDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
			, itemImgService.findByItemId(i.getItemId()).get(0).getImg()
			,allItemService.getItemPrice(i.getItemId())));
		}
		return items;
	}

}
