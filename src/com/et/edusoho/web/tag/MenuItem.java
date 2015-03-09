package com.et.edusoho.web.tag;


import java.util.List;

import com.et.edusoho.admin.menu.bean.Menu;

public class MenuItem {

	private Menu menu;

	private List<MenuItem> subMenus;

	public MenuItem(Menu menu, List<MenuItem> subMenus) {
		this.menu = menu;
		this.subMenus = subMenus;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<MenuItem> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<MenuItem> subMenus) {
		this.subMenus = subMenus;
	}

}
