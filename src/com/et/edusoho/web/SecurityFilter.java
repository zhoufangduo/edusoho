package com.et.edusoho.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.et.edusoho.tools.CONSTANTCONTEXT;

public class SecurityFilter implements Filter {
	
	private String[] paths;

	public void destroy() {
		this.paths = null;

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		HttpSession session  = request.getSession();
		Object user = session.getAttribute(CONSTANTCONTEXT.USER);
		
		if (user != null) {
			chain.doFilter(request, res);
		}else{
			
			String path = request.getServletPath();
			
			int index = path.lastIndexOf(".");
			if(index > 0){
				chain.doFilter(request, response);
				return ;
			}
			
			boolean isExit = false;
			
			for(String str : paths){
				if (path.equals(str)) {
					isExit = true;
					break;
				}
			}
			
			if(isExit){
				chain.doFilter(request, response);
			}else{
				
				String url = request.getContextPath() + "/toLogin";
				
				response.sendRedirect(url);
			}
		}
	}

	public void init(FilterConfig config) throws ServletException {
		String configPath = config.getInitParameter("check");
		if (StringUtils.isNotEmpty(configPath)) {
			this.paths = configPath.split(",");
		}
	}
}
