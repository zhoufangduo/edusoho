package com.et.edusoho.context.service;

import java.util.List;

import com.et.edusoho.admin.menu.bean.Menu;
import com.et.edusoho.admin.system.bean.Site;

public interface ApplicationContextService {
	
	public List<Menu> getContextMenus();
	
	public Site getSite();
}
