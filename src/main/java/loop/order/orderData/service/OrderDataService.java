package loop.order.orderData.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.order.orderData.model.OrderDataBean;
import loop.order.orderData.model.OrderDataRepository;


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
}
