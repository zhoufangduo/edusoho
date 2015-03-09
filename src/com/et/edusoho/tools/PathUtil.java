package com.et.edusoho.tools;

public abstract class PathUtil {
	
	private static ClassLoader getClassLoader(){
		return Thread.currentThread().getContextClassLoader();
	}
	
	
	public static String getAllPath(String resource){
		return getClassLoader().getResource(resource).getPath();
	}
	
}
