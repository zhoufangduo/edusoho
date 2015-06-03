package com.et.edusoho.web.context;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.et.edusoho.admin.menu.Menu;
import com.et.edusoho.admin.system.bean.Site;
import com.et.edusoho.context.service.ApplicationContextService;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Component
public final class ApplicationContextLoader implements ApplicationListener<ApplicationEvent> {

	private List<Menu> menus;
	
	public static ApplicationContextLoader INSTANCE;
	
	private ApplicationContextService appCtxService;

	private ServletContext context;
	
	
	public ApplicationContextLoader(){
		INSTANCE = this;
	}

	public void onApplicationEvent(ApplicationEvent event) {
		
		WebApplicationContext webAppCtx  = null;
		
		if (event.getSource() instanceof WebApplicationContext) {
			 webAppCtx = (WebApplicationContext) event.getSource();
			if (this.context == null) {
				this.context = webAppCtx.getServletContext();
			}
			
			
			this.appCtxService =  getApplicationContextService(webAppCtx);
			
			initAppConfiguration(appCtxService);
		}
	}

	private ApplicationContextService getApplicationContextService(
			WebApplicationContext webAppCtx) {
		
		ApplicationContextService appCtxService = (ApplicationContextService) 
				webAppCtx.getBean("applicationContextServiceImpl");
		
		return appCtxService;
	}

	private void initAppConfiguration(ApplicationContextService appCtxService) {
		
		this.menus = appCtxService.getContextMenus();
		
		Site site = appCtxService.getSite();
		
		this.context.setAttribute(CONSTANTCONTEXT.USER_MENU, this.menus);
		
		this.context.setAttribute(CONSTANTCONTEXT.SITE_INFO, site);
	}
	
	
	public void onSiteUpdateEvent(HttpServletRequest request){
		if (this.context == null) {
			request.getSession().getServletContext();
		}
		
		initAppConfiguration(this.appCtxService);
	}
}
