
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
	public String loginFailurePage(@RequestParam(value = "failure", required = false) String account, String password,
			Model m) {
		try {
			if (!account.equals("")) {
				m.addAttribute("accountMsg", "<img src='img/usercheck/checkNO.png'/> 帳號或密碼錯誤！");
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
}
