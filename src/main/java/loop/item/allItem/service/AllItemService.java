package loop.item.allItem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.AllItemRepository;
import loop.item.allItem.model.ItemDisplay;

@Service
@Transactional
public class AllItemService {

	private AllItemRepository allItemRepo;
	private CrudRepository<AllItemBean, Integer> allItemService;

	@Autowired
	public AllItemService(AllItemRepository allItemRepo) {
		super();
		this.allItemRepo = allItemRepo;
	}

	public AllItemBean findById(Integer itemId) {	
		Optional<AllItemBean> allItemBean = allItemRepo.findById(itemId);
		if(allItemBean.isEmpty()) {
			return null;
		}
		return allItemBean.get();
	}
	
	public void save(AllItemBean bean) {
		allItemRepo.save(bean);
	}
	
	public String getItemName(Integer itemId) {

		String itemName = "";
		Optional<AllItemBean> allItemOp = allItemRepo.findById(itemId);
		AllItemBean allItem = allItemOp.get();
		char id = Integer.toString(itemId).charAt(0);
		if (id == '1') {
			itemName = allItem.getYarnItem().getItemName();
		} else if (id == '2') {
			itemName = allItem.getToolsItem().getItemName();
		} else if (id == '3') {
			itemName = allItem.getBooksItem().getItemName();
		} else if (id == '4') {
			itemName = allItem.getKitsItem().getItemName();
		}
		return itemName;
	}

	public Integer getItemPrice(Integer itemId) {
		Optional<AllItemBean> allItemOp = allItemRepo.findById(itemId);
		AllItemBean allItem = allItemOp.get();
		int price = 0;
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
			price = allItem.getKitsItem().getPrice();
		}		
		return price;
	}
	
	public Integer getItemQty(Integer itemId) {
		Optional<AllItemBean> allItemOp = allItemRepo.findById(itemId);
		AllItemBean allItem = allItemOp.get();
		int qty = 0;
		char id = Integer.toString(itemId).charAt(0);
		if (id == '1') {
			qty = allItem.getYarnItem().getQty();
			}
		if (id == '2') {
			qty = allItem.getToolsItem().getQty();
		}
		if (id == '3') {
			qty = allItem.getBooksItem().getQty();
		}
		if (id == '4') {
			qty = allItem.getKitsItem().getQty();
		}
		return qty;
	}

	public List<AllItemBean> findAll() {
		return allItemRepo.findAll();
	}
	
	public List<ItemDisplay> list(){
		List<AllItemBean> allItem = findAll();
		List<ItemDisplay> list = new ArrayList<ItemDisplay>();
		for(AllItemBean i : allItem) {
			list.add(new ItemDisplay(i.getItemId(), getItemName(i.getItemId())
					, getItemPrice(i.getItemId()), getItemQty(i.getItemId())));
		}
		return list;
	}
	
	public void deleteByItemId(Integer id) {		
//		AllItemBean allItem = allItemService.findById(id);
//		allItem.setallItem(null);
		allItemRepo.deleteById(id);
	}
}
