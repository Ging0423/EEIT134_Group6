package loop.shoppingCart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.shoppingCart.model.ShoppingCartBean;
import loop.shoppingCart.model.ShoppingCartDao;

@Service
@Transactional
public class ShoppingCartService {
	
	@Autowired
	ShoppingCartDao dao;
	
	public void addToCart(int itemId, int userId, int qty) {
		dao.addToCart(itemId, userId, qty);
	}
	
	public void removeItem() {
		
	}
	
	public List<ShoppingCartBean> selectById(int userId) {
		return dao.selectById(userId);
	}
	
}
