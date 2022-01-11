package com.balancediary.user.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.balancediary.user.vo.userVO;

@Service
public class userService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String login(userVO vo, HttpSession session) {
		userVO vo1 = sqlSessionTemplate.selectOne("user.userLogin", vo);
		String path = "";
		

//		 String referer = request.getHeader("Referer");
		
		
		if(vo1 != null) {
			session.setAttribute("account", vo1);
			path = "home";
//			path = "redirect:"+referer;
		} else {
			path = "login";
		}
		return path;
	}
	
	public void setUser(userVO vo) {
		sqlSessionTemplate.insert("user.insertUser", vo);
	}
}

