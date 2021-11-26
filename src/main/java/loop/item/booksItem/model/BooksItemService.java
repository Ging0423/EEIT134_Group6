package loop.item.booksItem.model;

import java.util.List;
import java.util.Optional;
<<<<<<< Updated upstream:src/main/java/loop/item/booksItem/service/BooksItemService.java
=======

import javax.transaction.Transactional;
>>>>>>> Stashed changes:src/main/java/loop/item/booksItem/model/BooksItemService.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< Updated upstream:src/main/java/loop/item/booksItem/service/BooksItemService.java
import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.model.BooksItemRepository;

=======
>>>>>>> Stashed changes:src/main/java/loop/item/booksItem/model/BooksItemService.java
@Service
public class BooksItemService {
	
	@Autowired
	private BooksItemRepository booksRepo;
	
	public void create(BooksItemBean bean) {
		booksRepo.save(bean);	
	}

	public List<BooksItemBean> findAll() {
<<<<<<< Updated upstream:src/main/java/loop/item/booksItem/service/BooksItemService.java
		return booksRepo.findAll();
=======
		return booksItemRepository.findAll();
	}
	
	public Optional<BooksItemBean> findById(Integer itemId) {
		return booksItemRepository.findById(itemId);
>>>>>>> Stashed changes:src/main/java/loop/item/booksItem/model/BooksItemService.java
	}

	public BooksItemBean findById(int itemId) {
		Optional<BooksItemBean> bean = booksRepo.findById(itemId);
		return bean.get();
	}
	
<<<<<<< Updated upstream:src/main/java/loop/item/booksItem/service/BooksItemService.java
	public BooksItemBean update(BooksItemBean bean) {
		return booksRepo.save(bean);
=======
	public void deleteById(Integer itemId) {
		booksItemRepository.deleteById(itemId);		
>>>>>>> Stashed changes:src/main/java/loop/item/booksItem/model/BooksItemService.java
	}
	
	public void deleteById(Integer id) {
		booksRepo.deleteById(id);
	}

}
