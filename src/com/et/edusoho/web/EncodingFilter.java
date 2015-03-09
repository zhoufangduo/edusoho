package com.et.edusoho.web;


import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter {
	
	private String encoding ;
	
	private final String ENCODINGNAME = "encoding";

	public void destroy() {
		this.encoding = null;
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)res;
		setEncoding(request, response);
		
		if (chain != null) {
			chain.doFilter(request, response);
		}
	}

	private void setEncoding(HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding(encoding);
			response.setCharacterEncoding(encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}

	public void init(FilterConfig config) throws ServletException {
		if (encoding == null) {
			this.encoding = config.getInitParameter(ENCODINGNAME);
		}
	}

}
