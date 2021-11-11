package loop.util;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//相當於web.xml
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override//用來設定相當於beans.config.xml的java程式組態
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}

	@Override//用來設定相當於mvc-servlet.xml的java程式組態
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {WebAppConfig.class};
//		return null;
	}

	@Override//用來設定ServletMapping
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter cef = new CharacterEncodingFilter("UTF-8", true);
		return new Filter[] {cef};
	}

}
