package loop.item.kitsItem.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.service.AllItemService;
import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.model.KitsItemRepository;

@Service
@Transactional
public class KitsItemService {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private KitsItemRepository kitsRepo;
	
	@Autowired
	private AllItemService allItemService;
	
	public void create(KitsItemBean bean) {
		kitsRepo.save(bean);
		AllItemBean allItem = new AllItemBean();
		allItem.setItemId(bean.getItemId());
		allItem.setKitsItem(bean);
		allItemService.save(allItem);
	}
	
	public KitsItemBean persist(KitsItemBean bean) {
		entityManager.persist(bean);
		return bean;

	}
	
	public List<KitsItemBean> findAll(){
		return kitsRepo.findAll();
	}

	public KitsItemBean findById(int itemId) {
		Optional<KitsItemBean> bean = kitsRepo.findById(itemId);
		if(bean.isEmpty()) {
			return null;
		}
		return bean.get();
	}
	
	public KitsItemBean update(KitsItemBean bean) {
		return kitsRepo.save(bean);
	}

	public void deleteById(Integer id) {
		AllItemBean allItem = allItemService.findById(id);
		allItem.setKitsItem(null);
		kitsRepo.deleteById(id);
	}

}

