package loop.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

//相當於mvc-servlet.xml
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "loop")
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver irViewResolver = new InternalResourceViewResolver();
		irViewResolver.setPrefix("/WEB-INF/views/");
		irViewResolver.setSuffix(".jsp");
		irViewResolver.setOrder(6);
		return irViewResolver;
	}
	
}

