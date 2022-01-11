package com.balancediary.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션을 조회해보고서
		HttpSession session = request.getSession();
		// 만약 세션에 account가 없다면(null)이라면
		if(session.getAttribute("account")==null) {
			// 세션 한번 초기화 = 어떠한 힌트를 주지 않기위해 정보 말소
			session.invalidate();
			// 초기창으로 넘겨줘버림
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
		return true;
	}
}
