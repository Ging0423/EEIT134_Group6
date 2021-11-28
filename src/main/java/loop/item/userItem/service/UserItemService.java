package loop.item.userItem.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.model.UserItemRepository;

@Service
@Transactional
public class UserItemService {
	
	@Autowired
	private UserItemRepository userItemRepo;
	
	public void save(UserItemBean userItemBean) {
		userItemRepo.save(userItemBean);	
	}

	public List<UserItemBean> findAll() {
		return userItemRepo.findAll();
	}
	
	public UserItemBean findById(Integer itemId) {
		return userItemRepo.findById(itemId);
	}

    public void update(UserItemBean userItemBean) {
    	userItemRepo.update(userItemBean);		
	}
	
	public void deleteUserItemByPrimaryKey(Integer itemId) {
		userItemRepo.deleteuserItemByPrimaryKey(itemId);		
	}
}
