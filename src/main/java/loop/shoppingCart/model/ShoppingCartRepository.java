package loop.shoppingCart.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCartBean, Integer> {

	@Query(value = "from ShoppingCartBean where userId = ?1")
	public List<ShoppingCartBean> findAllCartBeans(Integer userId);
	
	@Query(value = "from ShoppingCartBean where itemId = ?1 and userId =?2")
	public List<ShoppingCartBean> findByItemIdAndUserId(int itemId, int userId);
	
}
