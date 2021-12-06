package loop.item.allItem.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AllItemRepository extends JpaRepository<AllItemBean, Integer> {

	@Query(value = "from AllItemBean where itemId = ?1")
	void deleteByItemId(Integer id);

}
