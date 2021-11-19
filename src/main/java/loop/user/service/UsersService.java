package loop.user.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
public class UsersService {
	
	@Autowired
	private UsersRepository userRepo;
	
	public UsersBean findById(Integer userId) {
		Optional<UsersBean> op = userRepo.findById(userId);
		return op.get();
	}
}