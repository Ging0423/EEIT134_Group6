package loop.item.allItem.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.AllItemRepository;

@Service
@Transactional
public class AllItemService {

	private AllItemRepository allItemRepo;

	@Autowired
	public AllItemService(AllItemRepository allItemRepo) {
		super();
		this.allItemRepo = allItemRepo;
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
}
