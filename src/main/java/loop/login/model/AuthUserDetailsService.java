package loop.login.model;

import java.util.Collections;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import loop.login.service.LoginService;
import loop.user.model.UsersBean;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private LoginService Service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<UsersBean> op = Service.findByAccount(username);
		op.orElseThrow(()->new UsernameNotFoundException("帳號密碼錯誤"));
		return new User(op.get().getAccount(), op.get().getUserPassword(), Collections.emptyList());
	}

}
