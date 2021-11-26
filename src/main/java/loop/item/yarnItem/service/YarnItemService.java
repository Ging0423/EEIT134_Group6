package loop.item.yarnItem.service;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.model.YarnItemRepository;

@Service
public class YarnItemService{

	@Autowired
	YarnItemRepository yarnRepo;
	
	public void create(YarnItemBean bean) {
		yarnRepo.save(bean);
	}
	
	public List<YarnItemBean> findAll(){
		return yarnRepo.findAll();
	}
	public YarnItemBean findById(Integer itemId) {
		Optional<YarnItemBean> bean = yarnRepo.findById(itemId);
		return bean.get();
	}
	
	public YarnItemBean update(YarnItemBean bean) {
		return yarnRepo.save(bean);
	}
	
	public void deleteById(Integer id) {
		yarnRepo.deleteById(id);
	}

}
