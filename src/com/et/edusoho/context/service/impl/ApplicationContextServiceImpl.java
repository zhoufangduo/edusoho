package com.et.edusoho.context.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.menu.bean.Menu;
import com.et.edusoho.context.dao.ApplicationContextDao;
import com.et.edusoho.context.service.ApplicationContextService;

@Service
public class ApplicationContextServiceImpl implements ApplicationContextService{
	
	@Autowired
	private ApplicationContextDao appCtxDao;

	public List<Menu> getContextMenus() {
		return appCtxDao.getContextMenus();
	}
}
