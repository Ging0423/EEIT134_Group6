package loop.order.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.order.model.OrderDataBean;
import loop.order.model.OrderDataRepository;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;


@Service
@Transactional
public class OrderDataService {
	@Autowired
	private OrderDataRepository orderDataRepo;
	
	@Autowired
	private UsersService usersService;

	public OrderDataBean insert(OrderDataBean orderdata) {
		return orderDataRepo.save(orderdata);
	}

//	public OrderDataBean update(OrderDataBean orderdata) {
//		return orderDataRepo.save(orderdata);
//	}

	public void deleteById(Integer id) {
		orderDataRepo.deleteById(id);
	}

	public List<OrderDataBean> findByUserId(Integer id) {
		
		return orderDataRepo.findByUserId(id);
	}
	
	public OrderDataBean save(OrderDataBean orderData, Integer userId) {
		  UsersBean user = usersService.findById(userId);
		  orderData.setUserId(userId);
		  orderData.setUsers(user);
		  orderDataRepo.save(orderData);
		  return orderData;
		 }
	
	public void update(OrderDataBean bean) {
		orderDataRepo.save(bean);
	}
	
	public OrderDataBean findById(Integer orderId) {
		Optional<OrderDataBean> op = orderDataRepo.findById(orderId);
		if(op.isEmpty()) {
			return null;
		}
		return op.get();
	}
	
	public List<OrderDataBean> findAll() {
		return orderDataRepo.findAll();
	}
	
	public List<OrderDataBean> findState(String state) {
		return orderDataRepo.findPayState(state);
	}

	
	public Long count() {
		return orderDataRepo.count();
	}
	public List<OrderDataBean> countOrderState(String state){
		return orderDataRepo.countOrderState(state);
	}
	
	public Page<OrderDataBean> findAllDsc(Pageable page){
		return orderDataRepo.findAll(page);
	}
	
	
}
