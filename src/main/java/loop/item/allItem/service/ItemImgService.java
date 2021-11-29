package loop.item.allItem.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.model.ItemImgRepository;

@Transactional
@Service
public class ItemImgService {
	
	@Autowired ItemImgRepository repo;
	
	public void save(ItemImgBean bean) {
		repo.save(bean);
	}
	
	public List<ItemImgBean> findByItemId(Integer itemId) {
		return repo.findByItemId(itemId);
	}
	
	public void deleteByItemId(Integer itemId) {
		repo.deleteByItemId(itemId);
	}
	
	public String getRandomString() {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}
	
}
