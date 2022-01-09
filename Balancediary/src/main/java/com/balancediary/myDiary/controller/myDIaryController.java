package com.balancediary.myDiary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class myDIaryController {

	
	@GetMapping("my-diary")
	public String myPage() {
		
		return "my-diary";
	}
}
