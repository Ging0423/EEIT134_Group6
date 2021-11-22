package loop.user.controller;

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
	
	@GetMapping("/userinsert.controller")
//	public String processInsertAction(Model m) {
//		UsersBean user1 = new UsersBean();
//		user1.setAccount("test123");
//		user1.setUserPassword("5566");
//		user1.setUserIdentity("0");
//		user1.setUserName("GER");
//		user1.setEmail("GER@hotmail.com");
//		user1.setTel("0987654321");
//		user1.setUserAddress("earth");
//		user1.setRegisterDate(null);
//		m.addAttribute("User", user1); //傳至.JSP的${}
//		return "user";
//	}
	public UsersBean processInsertAction() {
		UsersBean user1 = new UsersBean();
		user1.setAccount("test123");
		user1.setUserPassword("5566");
		user1.setUserIdentity("0");
		user1.setUserName("GER");
		user1.setEmail("GER@hotmail.com");
		user1.setTel("0987654321");
		user1.setUserAddress("earth");
		user1.setRegisterDate(null);
		return uService.insert(user1);
	}
	
	@GetMapping("/userinsert1.controller")
	public UsersBean processInsertAction2(@RequestBody UsersBean user) {		
		return uService.insert(user);
	}
	
	@GetMapping("/userupdate.controller")
	public UsersBean processUpdateAction() {
		UsersBean user2 = new UsersBean();
		user2.setUserId(7);
		user2.setUserPassword("556677");
		user2.setUserName("GERSH");
		user2.setEmail("GERSH@hotmail.com");
		user2.setTel("0978654321");
		user2.setUserAddress("Earth");
		return uService.update(user2);		
	}
	
	@GetMapping("/userdelete.controller")
	public String processDelete() {
		uService.deleteById(1);
		return "Delete successful !";
	}
}
