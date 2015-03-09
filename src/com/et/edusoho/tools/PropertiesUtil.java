package com.et.edusoho.tools;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public abstract class PropertiesUtil {
	
	private static Properties properties;
	
	private static final String file = "configuration.properties";
	
	static{
		if (properties == null) {
			properties = new Properties();
			
			try {
				properties.load(new FileInputStream(PathUtil.getAllPath(file)));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public static String getString(String key, String defaultValue){
		return properties.getProperty(key, defaultValue);
	}
	
	public static String getString(String key){
		return properties.getProperty(key);
	}
	
	public static int getInt(String key, int defaultValue){
		String value = properties.getProperty(key);
		
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			return  defaultValue;
		}
	}
	
	public static int getInt(String key){
		String value = properties.getProperty(key);
		
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			throw new NumberFormatException("error message: " + value);
		}
	}
	
	public static boolean getBoolean(String key, boolean defaultValue){
		String value = properties.getProperty(key);
		
		try {
			return Boolean.parseBoolean(value);
		} catch (Exception e) {
			return  defaultValue;
		}
	}
	
	public static boolean getBoolean(String key){
		String value = properties.getProperty(key);
		
		try {
			return Boolean.parseBoolean(value);
		} catch (Exception e) {
			throw new NumberFormatException("error message: " + value);
		}
	}
	
	public void update(String key, Object value){
		properties.put(key, value);
		try {
			properties.store(new FileOutputStream(PathUtil.getAllPath(file)),null);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
