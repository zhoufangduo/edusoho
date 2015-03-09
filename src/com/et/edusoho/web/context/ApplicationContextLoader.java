package com.et.edusoho.web.context;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.et.edusoho.admin.menu.bean.Menu;
import com.et.edusoho.context.service.ApplicationContextService;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Component
public final class ApplicationContextLoader implements ApplicationListener<ApplicationEvent> {

	private List<Menu> menus;

	private ServletContext context;

	public void onApplicationEvent(ApplicationEvent event) {
		
		WebApplicationContext webAppCtx  = null;
		
		if (event.getSource() instanceof WebApplicationContext) {
			 webAppCtx = (WebApplicationContext) event.getSource();
			if (this.context == null) {
				this.context = webAppCtx.getServletContext();
			}
			
			ApplicationContextService appCtxService = (ApplicationContextService) 
					webAppCtx.getBean("applicationContextServiceImpl");
			
			initAppConfiguration(appCtxService);
		}
	}

	private void initAppConfiguration(ApplicationContextService appCtxService) {
		
		this.menus = appCtxService.getContextMenus();
		
		this.context.setAttribute(CONSTANTCONTEXT.USER_MENU, this.menus);
		
	}
}
