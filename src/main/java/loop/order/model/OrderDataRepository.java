package loop.order.orderData.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface OrderDataRepository extends JpaRepository<OrderDataBean, Integer> {

}
