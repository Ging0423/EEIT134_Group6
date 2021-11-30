package loop.login.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import loop.login.service.LoginService;
import loop.user.model.UsersBean;
@Component("myAuthenticationSuccessHandler")
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Autowired
	private LoginService loginService;
	
	public MyAuthenticationSuccessHandler() {
		setDefaultTargetUrl("/");
		}

	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws ServletException, IOException {
		System.out.println("登入成功");
        HttpSession session = request.getSession();
        UserDetails username = (UserDetails) authentication.getPrincipal();
        UsersBean bean = loginService.findByAccount(username.getUsername()).get();
        session.setAttribute("isLogin", bean);
        super.onAuthenticationSuccess(request, response, authentication);
    }
}
