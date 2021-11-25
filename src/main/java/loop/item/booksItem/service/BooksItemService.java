package loop.item.booksItem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.model.BooksItemRepository;

@Service
public class BooksItemService {
	
	@Autowired
	private BooksItemRepository booksRepo;
	
	public void create(BooksItemBean bean) {
		booksRepo.save(bean);	
	}

	public List<BooksItemBean> findAll() {
		return booksRepo.findAll();
	}

	public BooksItemBean findById(int itemId) {
		Optional<BooksItemBean> bean = booksRepo.findById(itemId);
		return bean.get();
	}
	
	public BooksItemBean update(BooksItemBean bean) {
		return booksRepo.save(bean);
	}
	
	public void deleteById(Integer id) {
		booksRepo.deleteById(id);
	}

}
