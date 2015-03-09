package com.et.edusoho.support.constroller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.support.RequestContext;

import com.et.edusoho.login.bean.User;
import com.et.edusoho.tools.CONSTANTCONTEXT;


public abstract class BaseController {
	
	protected HttpServletRequest request;
	
	protected HttpServletResponse response;
	
	protected HttpSession session ;
	
	protected ServletContext context;
	
	protected final String ADD = "add";
	
	protected final String VIEW = "view";
	
	protected final String LIST = "list";
	
	protected final String UPDATE = "update";
	
	protected final String SUCCESS = "success";
	
	protected final String TRUE = "{\"result\":true}";
	
	protected final String FALSE = "{\"result\":false}";
	
	protected String dirPath ;
	
	private static Logger logger = Logger.getLogger(BaseController.class);
	
	protected BaseController(String dirPath ){
		this.dirPath = dirPath;
	}
	
	protected BaseController(){
		
	}
	
	protected String getContext(String jspName){
		return dirPath + jspName;
	}
	
	
	public void setWebContext(HttpServletRequest request, HttpServletResponse response){
		this.request = request;
		this.response = response;
		
		if (request != null) {
			this.session = request.getSession();
			this.context = this.session.getServletContext();
		}
	} 
	
	public void setWebContext(HttpServletRequest request, HttpServletResponse response,
			Map<String, Object> params){
		this.request = request;
		this.response = response;
		
		String start = (String)params.get("start");
		String limit = (String)params.get("limit");
		if (NumberUtils.isNumber(start)) {
			params.put("start", Integer.parseInt(start));
		}
		
		if (NumberUtils.isNumber(limit)) {
			params.put("limit", Integer.parseInt(limit));
		}
		
		if (request != null) {
			this.session = request.getSession();
			this.context = this.session.getServletContext();
		}
	} 
	

	public String getText(String key) {
		RequestContext requestContext = new RequestContext(request);
		return requestContext.getMessage(key);
	}
	
	
	public String getText(String key, HttpServletRequest request) {
		RequestContext requestContext = new RequestContext(request);
		return requestContext.getMessage(key);
	}
	
	public void write(String json){
		try {
			
			response.reset();
			
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected String getEncoding(String value) {
		
		try {
			String result = new String(value.getBytes("UTF-8"), "ISO8859-1");
			logger.info(result + "\n" + value);
			return result;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return value;
	}
	
	
	
	protected String getName(){
		
		User user = getUser();
		if (user != null) {
			return user.getName();
		}
		
		return "";
	}
	
	protected String getUsername(){
		
		User user = getUser();
		if (user != null) {
			
			return user.getUsername();
		}
		
		return "";
		
	}
	
	protected User getUser(){
		if (session != null) {
			return (User)session.getAttribute(CONSTANTCONTEXT.USER);
		}
		
		return null;
	}

}
