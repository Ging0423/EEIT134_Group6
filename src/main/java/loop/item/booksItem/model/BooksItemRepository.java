package loop.item.booksItem.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface BooksItemRepository extends JpaRepository<BooksItemBean, Integer> {
	
	@Query(value = "from BooksItemBean where itemName like concat('%',?1,'%')")
	public List<BooksItemBean> findBooksItemBeanSearch(String key);
	
//	@Query(value = "from BooksItemBean where price like concat(?1)")
//	public List<BooksItemBean> findBooksItemBeanPrice(Integer price);
}
