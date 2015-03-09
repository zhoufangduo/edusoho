package com.et.edusoho.context.dao;

import java.util.List;

import com.et.edusoho.admin.menu.bean.Menu;

public interface ApplicationContextDao {
	
	public List<Menu> getContextMenus();
}
