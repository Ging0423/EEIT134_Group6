package loop.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
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
	
	@Override  //   /images/*: /images/1 or images/2    /images/**: /images/1/2..
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/fonts/");
		registry.addResourceHandler("/sass/**").addResourceLocations("/WEB-INF/sass/");



	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addRedirectViewController("/", "index");
//		registry.addViewController("/index").setViewName("index");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver cmr1 = new CommonsMultipartResolver();
		cmr1.setDefaultEncoding("UTF-8");
		return cmr1;
	}
}

