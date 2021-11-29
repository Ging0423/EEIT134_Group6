package loop.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDataRepository extends JpaRepository<OrderDataBean, Integer> {

	@Query(value="from OrderDataBean where userId = ?1")
	public List<OrderDataBean> findByUserId(Integer userId);
}