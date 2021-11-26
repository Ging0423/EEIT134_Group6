package loop.item.allItem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.model.ItemImgRepository;

@Service
public class ItemImgService {
	
	@Autowired ItemImgRepository repo;
	
	public void save(ItemImgBean bean) {
		repo.save(bean);
	}
}
