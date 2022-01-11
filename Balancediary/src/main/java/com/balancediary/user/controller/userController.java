package com.balancediary.user.controller;

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

	@GetMapping("isSignup")
	public String isSignUp() {

		return "signUp";
	}
	
	@PostMapping("signup")
	public String signUp(userVO vo) {
		userService.setUser(vo);
		
		return "login";
	}
}
