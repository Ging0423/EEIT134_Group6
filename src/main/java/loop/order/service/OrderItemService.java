package loop.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.service.AllItemService;
import loop.order.model.OrderDataBean;
import loop.order.model.OrderItemBean;
import loop.order.model.OrderItemRepository;
import loop.shoppingCart.model.ShoppingCartBean;

@Service
@Transactional
public class OrderItemService {
	
	@Autowired
	private OrderItemRepository orderItemRepo;
	@Autowired
	private AllItemService allItemService;
	
	public void save(OrderItemBean bean) {
		orderItemRepo.save(bean);
		
	}
}
