package com.et.edusoho.context.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.menu.Menu;
import com.et.edusoho.context.dao.ApplicationContextDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class ApplicationContextDaoImpl extends BaseDaoSupport implements ApplicationContextDao {
	
	public List<Menu> getContextMenus() {
		return getList("AppCtx.getContextMenu");
	}

}
