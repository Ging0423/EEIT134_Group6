package loop.user.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
@Transactional
public class UsersServiceByMe {
	@Autowired //撈取UsersRepository, 即DAO<->Service
	private UsersRepository uResp;
	
	public UsersBean insert(UsersBean user) {
		return uResp.save(user);

	}
	
	public UsersBean update(UsersBean user) {
		return uResp.save(user);
	}
	
	public void deleteById(Integer Id) {
		uResp.deleteById(Id);
	}
	
	public UsersBean findById(Integer Id) {
		Optional<UsersBean> op1 = uResp.findById(Id);
		return op1.get();
	}
}
