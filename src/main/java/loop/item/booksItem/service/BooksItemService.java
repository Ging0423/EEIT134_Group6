package loop.item.booksItem.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.service.AllItemService;
import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.model.BooksItemRepository;

@Service
@Transactional
public class BooksItemService {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private BooksItemRepository booksRepo;
	
	@Autowired
	private AllItemService allItemService;
	
	public void create(BooksItemBean bean) {
		booksRepo.save(bean);
		AllItemBean allItem = new AllItemBean();
		allItem.setItemId(bean.getItemId());
		allItem.setBooksItem(bean);
		allItemService.save(allItem);
	}
	
	public BooksItemBean persist(BooksItemBean bean) {
		entityManager.persist(bean);
		return bean;

	}

	public List<BooksItemBean> findAll() {
		return booksRepo.findAll();
	}

	public BooksItemBean findById(int itemId) {
		Optional<BooksItemBean> bean = booksRepo.findById(itemId);
		if(bean.isEmpty()) {
			return null;
		}
		return bean.get();
	}
	
	public BooksItemBean update(BooksItemBean bean) {
		return booksRepo.save(bean);
	}
	
	public void deleteById(Integer id) {

		AllItemBean allItem = allItemService.findById(id);
		allItem.setBooksItem(null);
		booksRepo.deleteById(id);
	}

}
