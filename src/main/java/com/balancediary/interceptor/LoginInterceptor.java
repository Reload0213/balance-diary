package com.balancediary.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = "";
		path = "/isLogin";
		
		HttpSession session = request.getSession();
		if(session.getAttribute("account")==null) {
			session.invalidate();
			response.sendRedirect(request.getContextPath()+path);
			
			return false;
		}
		return true;
	}
}
