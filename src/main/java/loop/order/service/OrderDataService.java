package loop.order.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.order.model.OrderDataBean;
import loop.order.model.OrderDataRepository;


@Service
@Transactional
public class OrderDataService {
	@Autowired
	private OrderDataRepository odResp;

	public OrderDataBean insert(OrderDataBean orderdata) {
		return odResp.save(orderdata);
	}

	public OrderDataBean update(OrderDataBean orderdata) {
		return odResp.save(orderdata);
	}

	public void deleteById(Integer id) {
		odResp.deleteById(id);
	}

	public OrderDataBean findById(Integer id) {
		Optional<OrderDataBean> op1 = odResp.findById(id);
		return op1.get();
	}

	public OrderDataBean save(OrderDataBean orderData, Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	public OrderDataBean findById(Integer orderId) {
//		Optional<OrderDataBean> op = orderDataRepo.findById(orderId);
//		if(op.isEmpty()) {
//			return null;
//		}
//		return op.get();
//	}
	
<<<<<<< Updated upstream
	public void update(OrderDataBean bean) {
		orderDataRepo.save(bean);
		
	}
	
	public List<OrderDataBean> findAll() {
		return odResp.findAll();
	}
	
	public List<OrderDataBean> findState(String state) {
		return odResp.findPayState(state);
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
	
=======
//	public void update(OrderDataBean bean) {
//		orderDataRepo.save(bean);
//	}
>>>>>>> Stashed changes

	public List<OrderDataBean> findByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
