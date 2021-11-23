package loop.item.userItem.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.userItem.dao.UserItemRepository;
import loop.item.userItem.model.UserItemBean;

@Service
@Transactional
public class UserItemService {
	
	@Autowired
	private UserItemRepository userItemRepository;
	
	public void save(UserItemBean userItemBean) {
		userItemRepository.save(userItemBean);	
	}

	public List<UserItemBean> findAll() {
		return userItemRepository.findAll();
	}
	
	public UserItemBean findById(Integer itemId) {
		return userItemRepository.findById(itemId);
	}

    public void update(UserItemBean userItemBean) {
    	userItemRepository.update(userItemBean);		
	}
	
	public void deleteUserItemByPrimaryKey(Integer itemId) {
		userItemRepository.deleteuserItemByPrimaryKey(itemId);		
	}
}
