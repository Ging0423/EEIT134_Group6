package loop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import loop.login.model.AuthUserDetailsService;
import loop.login.model.MyAuthenticationFailureHandler;
import loop.login.model.MyAuthenticationSuccessHandler;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private AuthUserDetailsService userDetailService;
		
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailService).passwordEncoder(new BCryptPasswordEncoder());

	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
		.httpBasic()
		.and()
		.authorizeRequests()
		.antMatchers(HttpMethod.GET, "/cart/**").authenticated()
		.antMatchers(HttpMethod.GET, "/order/**").authenticated()
		.antMatchers(HttpMethod.GET, "/forum/newPost").authenticated()
		.antMatchers(HttpMethod.GET, "/backend/**").authenticated()
		.antMatchers(HttpMethod.GET, "/backend/**").hasAuthority("ROLE_ADMIN")
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST, "/cart/**").authenticated()
		.antMatchers(HttpMethod.POST, "/backend/**").hasAuthority("ROLE_ADMIN")
		.antMatchers(HttpMethod.POST, "/order/**").authenticated()
		.antMatchers(HttpMethod.POST, "/forum/newPost/**").authenticated()
		.antMatchers(HttpMethod.POST, "/video/comment").hasAuthority("ROLE_ADMIN")
		.antMatchers(HttpMethod.POST).permitAll()
		.anyRequest().authenticated()
		.and()
		.rememberMe()
        .rememberMeCookieName("rememberme")
        .alwaysRemember(true)
        .useSecureCookie(true)
		.tokenValiditySeconds(864000)
		.key("rememberMe")
		.and()
		.csrf().disable()
		.formLogin()
		.loginPage("/login")
		.usernameParameter("account")
		.passwordParameter("password")
		.successHandler(successHandler())
		.failureHandler(failureHandler())
		.and()
		.logout()
        .logoutUrl("/logout")
        .logoutSuccessUrl("/");
		
	}
	
	@Autowired
	@Qualifier("MyAuthenticationSuccessHandler")
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new MyAuthenticationSuccessHandler();
	}
	@Autowired
	@Qualifier("MyAuthenticationFailureHandler")
	@Bean
	public AuthenticationFailureHandler failureHandler() {
		return new MyAuthenticationFailureHandler();
	}
	
}
