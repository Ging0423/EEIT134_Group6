package loop.item.allItem.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface ItemImgRepository extends JpaRepository<ItemImgBean, Integer> {

	@Query(value="from ItemImgBean where itemId = ?1")
	public List<ItemImgBean> findByItemId(Integer itemId);
	
	@Modifying
	@Query(value="delete from ItemImgBean where itemId = ?1")
	public void deleteByItemId(Integer itemId);

}
