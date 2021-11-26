package loop.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

import loop.user.model.UsersBean;
import loop.user.service.UsersServiceByMe;
@Controller
public class UsersControllerByMe {
	@Autowired //撈取sersServiceByMe, 即Service<->Controller
	private UsersServiceByMe uService;
	
	@GetMapping("/create")
	public String create(HttpServletRequest request, HttpServletResponse response, Model m) {
		UsersBean user1 = new UsersBean();
//		user1.setAccount("test123");
//		user1.setUserPassword("5566");
//		user1.setUserIdentity("0");
//		user1.setUserName("GER");
//		user1.setEmail("GER@hotmail.com");
//		user1.setTel("0987654321");
//		user1.setUserAddress("earth");
//		user1.setRegisterDate(null);
//		uService.insert(user1);
//		m.addAttribute("uAccount", user1.getAccount()); //傳至.jsp的${}
//		m.addAttribute("uPassword", user1.getUserPassword());
//		m.addAttribute("uIdentity", user1.getUserIdentity());
//		m.addAttribute("uName", user1.getUserName());
//		m.addAttribute("uEmail", user1.getEmail());
//		m.addAttribute("uTel", user1.getTel());
//		m.addAttribute("uAddress", user1.getUserAddress());
//		m.addAttribute("uRegisterDate", user1.getRegisterDate());
		return "userinsert";
	}
	@GetMapping("/login")
	public String login(Model m) {
		return "login";		
	}
	@GetMapping("/index")
	public String index(Model m) {
		return "index";		
	}
	@GetMapping("/elements")
	public String elements(Model m) {
		return "elements";		
	}
	@GetMapping("/contact")
	public String contact(Model m) {
		return "contact";		
	}
//	public UsersBean processInsertAction() {
//		UsersBean user1 = new UsersBean();
//		user1.setAccount("test123");
//		user1.setUserPassword("5566");
//		user1.setUserIdentity("0");
//		user1.setUserName("GER");
//		user1.setEmail("GER@hotmail.com");
//		user1.setTel("0987654321");
//		user1.setUserAddress("earth");
//		user1.setRegisterDate(null);
//		return uService.insert(user1);
//	}
	
	@GetMapping("/userinsert1.controller")
	public UsersBean processInsertAction2(@RequestBody UsersBean user) {		
		return uService.insert(user);
	}
	
	@GetMapping("/userupdate.controller")
	public UsersBean processUpdateAction() {
		UsersBean user2 = new UsersBean();
		user2.setUserId(24);
		user2.setAccount("dadsadsa");
		user2.setUserPassword("556677");
		user2.setUserName("GERSH");
		user2.setEmail("GERSH@hotmail.com");
		user2.setTel("0978654321");
		user2.setUserAddress("Earth");
		return uService.update(user2);		
	}
	
	@GetMapping("/userdelete.controller")
	public String processDelete() {
		uService.deleteById(25);
		return "userdelete";
	}
}
