package com.et.edusoho.tools;

import java.util.List;

import com.et.edusoho.login.bean.User;

public class UserRolesUtils {
	
	public static List<User> setRolesToUser(List<User> list) {
		for(User user: list){
			if (user != null) {
				String[]roles = user.getRole().split(",");
				user.setRoles(roles);
			}
		}
		
		return list;
	}
	
	public static User setRolesToUser(User user) {
		
		if (user != null) {
			String[]roles = user.getRole().split(",");
			user.setRoles(roles);
		}
		
		return user;
	}
}
