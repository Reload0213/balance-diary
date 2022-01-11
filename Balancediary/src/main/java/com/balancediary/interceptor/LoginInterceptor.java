package com.balancediary.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// ������ ��ȸ�غ���
		HttpSession session = request.getSession();
		// ���� ���ǿ� account�� ���ٸ�(null)�̶��
		if(session.getAttribute("account")==null) {
			// ���� �ѹ� �ʱ�ȭ = ��� ��Ʈ�� ���� �ʱ����� ���� ����
			session.invalidate();
			// �ʱ�â���� �Ѱ������
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
		return true;
	}
}
