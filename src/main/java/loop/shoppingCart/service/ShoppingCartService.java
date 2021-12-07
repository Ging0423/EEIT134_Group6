package loop.shoppingCart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.service.AllItemService;
import loop.item.allItem.service.ItemImgService;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.model.ShoppingCartRepository;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Service
@Transactional
public class ShoppingCartService {

	private ShoppingCartRepository shoppingRepo;
	private AllItemService allItemService;
	private UsersService usersService;
	private ItemImgService itemImgService;


	@Autowired
	public ShoppingCartService(ShoppingCartRepository shoppingRepo, AllItemService allItemService,
			UsersService usersService, ItemImgService itemImgService) {
		this.shoppingRepo = shoppingRepo;
		this.allItemService = allItemService;
		this.usersService = usersService;
		this.itemImgService = itemImgService;
	}

	public void save(Integer itemId, Integer userId, Integer qty) {
		AllItemBean allItemBean = allItemService.findById(itemId);
		UsersBean usersBean = usersService.findById(userId);
		ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
		shoppingCartBean.setItemId(allItemBean.getItemId());
		shoppingCartBean.setUserId(usersBean.getUserId());
		shoppingCartBean.setQty(qty);
		shoppingCartBean.setAllItem(allItemBean);
		shoppingCartBean.setUsers(usersBean);
		shoppingRepo.save(shoppingCartBean);
	}

	

	public void updateQty(Integer itemId, Integer userId, Integer qty) {
		List<ShoppingCartBean> list = shoppingRepo.findByItemIdAndUserId(itemId, userId);
		ShoppingCartBean shoppingCartBean = list.get(0);
		shoppingCartBean.setQty(qty + shoppingCartBean.getQty());
		shoppingRepo.save(shoppingCartBean);
	}

	public void update(Integer itemId, Integer userId, Integer qty) {
		List<ShoppingCartBean> list = shoppingRepo.findByItemIdAndUserId(itemId, userId);
		ShoppingCartBean shoppingCartBean = list.get(0);
		shoppingCartBean.setQty(qty);
		shoppingRepo.save(shoppingCartBean);
	}
	
	public void deleteByItemIdAndUserId(Integer itemId, Integer userId) {
		shoppingRepo.deleteByItemIdAndUserId(itemId, userId);;
	}

	public List<ShoppingCartBean> findAllCartBeans(Integer userId) {

		return shoppingRepo.findAllCartBeans(userId);
	}

	public boolean isExist(Integer itemId, Integer userId) {
		List<ShoppingCartBean> list = shoppingRepo.findByItemIdAndUserId(itemId, userId);
		if (list.size() != 0) {
			return true;
		} else
			return false;
	}

	public List<ShoppingCartDisplay> list(Integer userId) {

		List<ShoppingCartBean> list = findAllCartBeans(userId);
		List<ShoppingCartDisplay> items = new ArrayList<ShoppingCartDisplay>();
		for (ShoppingCartBean i : list) {
			items.add(new ShoppingCartDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
					,allItemService.findById(i.getItemId()).getItemImg().get(0).getImg()
					,allItemService.getItemPrice(i.getItemId()), i.getQty()));
		}
		return items;
	}
	
	public void deleteByUserId(Integer userId) {
		shoppingRepo.deleteByUserId(userId);
	}

}
