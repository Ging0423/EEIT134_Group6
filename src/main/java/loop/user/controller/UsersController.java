package loop.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
public class UsersController {

	private UsersService usersService;
	
	@Autowired
	public UsersController(UsersService usersService) {
		super();
		this.usersService = usersService;
	}
	
	@GetMapping("/joinmember")
	public String joinMember(Model m) {
		UsersBean bean = new UsersBean();
		m.addAttribute("usersData", bean);
		return "joinmember";
	}
	@PostMapping("joinmember")
	public String joinMember(@ModelAttribute("usersBean") UsersBean bean) {
		String password = new BCryptPasswordEncoder().encode(bean.getUserPassword());
		bean.setUserPassword(password);
		bean.setUserIdentity("1");
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String registerDate = sdFormat.format(current);
		bean.setRegisterDate(registerDate);
		usersService.save(bean);
		return "redirect:/login";
	}
}
