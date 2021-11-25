package loop.shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCartBean, Integer> {

	@Query(value = "from ShoppingCartBean where userId = ?1")
	public List<ShoppingCartBean> findAllCartBeans(Integer userId);
	
	@Query(value = "from ShoppingCartBean where itemId = ?1 and userId =?2")
	public List<ShoppingCartBean> findByItemIdAndUserId(int itemId, int userId);
	
	@Modifying
	@Query(value = "delete from ShoppingCartBean where itemId = ?1 and userId =?2")
	public void deleteByItemIdAndUserId(Integer itemId, Integer userId);
}
