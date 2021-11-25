package loop.item.kitsItem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.model.KitsItemRepository;

@Service
public class KitsItemService {
	
	@Autowired
	private KitsItemRepository kitsRepo;
	
	public void create(KitsItemBean bean) {
		kitsRepo.save(bean);
	}
	
	public List<KitsItemBean> findAll(){
		return kitsRepo.findAll();
	}

	public KitsItemBean findById(int itemId) {
		Optional<KitsItemBean> bean = kitsRepo.findById(itemId);
		return bean.get();
	}
	
	public KitsItemBean update(KitsItemBean bean) {
		return kitsRepo.save(bean);
	}

	public void deleteById(Integer id) {
		kitsRepo.deleteById(id);
	}

}

