package loop.shoppingCart.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.AllItemRepository;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.shoppingCart.model.ShoppingCartRepository;
import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
@Transactional
public class ShoppingCartService {
	
	private ShoppingCartRepository shoppingRepo;
	private AllItemRepository allItemRepo;
	private UsersRepository usersRepo;
	
	
	@Autowired
	public ShoppingCartService(ShoppingCartRepository shoppingRepo, AllItemRepository allItemRepo,
			UsersRepository usersRepo) {
		super();
		this.shoppingRepo = shoppingRepo;
		this.allItemRepo = allItemRepo;
		this.usersRepo = usersRepo;
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
	
	public void removeItem() {
		
	}
	
	public List<ShoppingCartBean> findAllCartBeans(int userId) {

		return shoppingRepo.findAllCartBeans(userId);
	}
	
	public void isExist(int itemId, int userId) {
		//shoppingRepo.existsById(itemId, userId);
		
	}
	
}
