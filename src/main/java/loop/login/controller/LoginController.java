
package loop.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import loop.login.service.LoginService;

@Controller
@SessionAttributes({ "isLogin" })
public class LoginController {
	
	private LoginService loginService;
	
	@Autowired
	public LoginController(LoginService loginService) {
		super();
		this.loginService = loginService;
	}
	
	@GetMapping("/login")
	public String loginFailurePage(@RequestParam(value="failure",required = false) String account, Model m) {
		try {
			if (!account.equals(null)) {
				m.addAttribute("errorMsg", "帳號密碼錯誤");
				return "login";
			}
		} catch (NullPointerException e) {
			return "login";
		}
		return "login";
	}
	
	@GetMapping("/logout")
	public String logOut(HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
		HttpSession session = request.getSession();
		// 清除session
		status.setComplete();
		session.invalidate();
		return "redirect:/";
	}
	//	@GetMapping("/userinsert.controller")
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
//		uService.insert(user1);
//		m.addAttribute("User", user1); //傳至.JSP的${}
//		return "user";
//	}
////	public UsersBean processInsertAction() {
////		UsersBean user1 = new UsersBean();
////		user1.setAccount("test123");
////		user1.setUserPassword("5566");
////		user1.setUserIdentity("0");
////		user1.setUserName("GER");
////		user1.setEmail("GER@hotmail.com");
////		user1.setTel("0987654321");
////		user1.setUserAddress("earth");
////		user1.setRegisterDate(null);
////		return uService.insert(user1);
////	}
//	
//	@GetMapping("/userinsert1.controller")
//	public UsersBean processInsertAction2(@RequestBody UsersBean user) {		
//		return uService.insert(user);
//	}
//	
//	@GetMapping("/userupdate.controller")
//	public UsersBean processUpdateAction() {
//		UsersBean user2 = new UsersBean();
//		user2.setUserId(24);
//		user2.setAccount("dadsadsa");
//		user2.setUserPassword("556677");
//		user2.setUserName("GERSH");
//		user2.setEmail("GERSH@hotmail.com");
//		user2.setTel("0978654321");
//		user2.setUserAddress("Earth");
//		return uService.update(user2);		
//	}
//	
//	@GetMapping("/userdelete.controller")
//	public String processDelete() {
//		uService.deleteById(25);
//		return "userdelete";
//	}
//}
	
}

