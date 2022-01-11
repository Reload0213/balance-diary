package com.balancediary.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.balancediary.user.service.userService;
import com.balancediary.user.vo.userVO;

@Controller
public class userController {

	@Autowired
	userService userService = new userService();

	@GetMapping("isLogin")
	public String isLogin() {

		return "login";
	}
	
	@PostMapping("login")
	public String isLogin(userVO vo, HttpSession session) {
		
		return userService.login(vo, session);
	}
//		 String referer = request.getHeader("Referer");
//		 return "redirect:"+ referer;

	@GetMapping("isSignup")
	public String isSignUp() {

		return "signUp";
	}
	
	@PostMapping("signup")
	public String signUp(userVO vo) {
		userService.setUser(vo);
		
		return "login";
	}

	@GetMapping("logout")
	public String logoutMainGET(HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/home";        
        
    }
	
}
