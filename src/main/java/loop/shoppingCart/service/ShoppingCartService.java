package loop.shoppingCart.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.AllItemRepository;
import loop.item.allItem.service.AllItemService;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.model.ShoppingCartRepository;
import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
@Transactional
public class ShoppingCartService {

	private ShoppingCartRepository shoppingRepo;
	private AllItemRepository allItemRepo;
	private UsersRepository usersRepo;
	private AllItemService allItemService;

	@Autowired
	public ShoppingCartService(ShoppingCartRepository shoppingRepo, AllItemRepository allItemRepo,
			UsersRepository usersRepo, AllItemService allItemService) {
		super();
		this.shoppingRepo = shoppingRepo;
		this.allItemRepo = allItemRepo;
		this.usersRepo = usersRepo;
		this.allItemService = allItemService;
	}

	public void save(Integer itemId, Integer userId, Integer qty) {
		Optional<AllItemBean> allItemOp = allItemRepo.findById(itemId);
		AllItemBean allItemBean = allItemOp.get();
		Optional<UsersBean> usersOp = usersRepo.findById(userId);
		UsersBean usersBean = usersOp.get();
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
	
	public void removeItem() {

	}

	public List<ShoppingCartBean> findAllCartBeans(int userId) {

		return shoppingRepo.findAllCartBeans(userId);
	}

	public boolean isExist(int itemId, int userId) {
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
			items.add(new ShoppingCartDisplay(i.getItemId(), allItemService.getItemName(i.getItemId()), "test",
					allItemService.getItemPrice(i.getItemId()), i.getQty()));
		}
		return items;
	}

}
