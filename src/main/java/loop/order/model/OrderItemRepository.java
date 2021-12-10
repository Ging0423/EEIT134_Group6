package loop.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderItemRepository extends JpaRepository<OrderItemBean, Integer> {
	
	@Query(value="from OrderItemBean where orderId = ?1")
	public List<OrderItemBean> findByOrderId(Integer orderId);
}
