package loop.item.booksItem.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.booksItem.dao.BooksItemRepository;
import loop.item.booksItem.model.BooksItemBean;

@Service
@Transactional
public class BooksItemService {
	
	@Autowired
	private BooksItemRepository booksItemRepository;
	
	public void save(BooksItemBean booksItemBean) {
		booksItemRepository.save(booksItemBean);	
	}

	public List<BooksItemBean> findAll() {
		return booksItemRepository.findAll();
	}
	
	public BooksItemBean findById(Integer itemId) {
		return booksItemRepository.findById(itemId);
	}

    public void update(BooksItemBean booksItemBean) {
    	booksItemRepository.update(booksItemBean);		
	}
	
	public void deleteBooksItemByPrimaryKey(Integer itemId) {
		booksItemRepository.deletebooksItemByPrimaryKey(itemId);		
	}
}
