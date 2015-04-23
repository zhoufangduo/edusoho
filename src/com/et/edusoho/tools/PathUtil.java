package com.et.edusoho.tools;

import javax.servlet.http.HttpServletRequest;

public abstract class PathUtil {
	
	private static ClassLoader getClassLoader(){
		return Thread.currentThread().getContextClassLoader();
	}
	
	
	public static String getAllPath(String resource){
		return getClassLoader().getResource(resource).getPath();
	}
	
	public static String getPath(){
		return getClassLoader().getResource("").getPath();
	}
	
	public static String getHttpPath(HttpServletRequest request){
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + path;
		
		return basePath;
	}
	
}
