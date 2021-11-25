package loop.item.yarnItem.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface YarnItemRepository extends JpaRepository<YarnItemBean, Integer> {
	
	@Query("from YarnItemBean")
	public List<YarnItemBean> findAll();
	
}
