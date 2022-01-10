package com.balancediary.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class userController {

	@GetMapping("login")
	public String login() {

		return "login";
	}

	@GetMapping("signup")
	public String signUp() {

		return "signUp";
	}
}
