package loop.item.yarnItem.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface YarnItemRepository extends JpaRepository<YarnItemBean, Integer> {
	
//	@Query("from YarnItemBean")
//	public List<YarnItemBean> findAll();	
}
