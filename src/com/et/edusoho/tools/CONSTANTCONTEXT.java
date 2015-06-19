package com.et.edusoho.tools;

import java.io.File;

public interface CONSTANTCONTEXT {
	
	public String USER = "user";
	
	public String SITE_INFO = "site";
	
	public String USER_ROLES = "user_roles";
	
	public String USER_MENU = "user_menu";

	public String APP_INSTALLED = "isInstalled";
	
	public String LOGIN_COOKIE_USERNAME = "login_cookie_username";
	
	public String LOGIN_COOKIE_PASSWORD = "login_cookie_password";
	
	public String USER_DEFAULT_ROLE = "STUDENT";
	
	public boolean OPEN_LOGIN_LOG = true;
	
	public String LOGO_DIR = "upload" + File.separator + "logo_images" + File.separator;

	public String LESSON_FILE_DIR = "upload" + File.separator + "lesson_file" + File.separator;
	
	public String IMAGE_TYPE = "bmp,gif,jpg,psd,png,ico,tiff";
	
	public String AUDIO_TYPE = "mp3,wav";
	
	public String USER_IMGS = "upload" + File.separator + "user_images" + File.separator;
	
}
