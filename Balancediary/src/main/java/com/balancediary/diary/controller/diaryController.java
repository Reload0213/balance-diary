package com.balancediary.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class diaryController {
	
	@GetMapping("diary-main")
	public String diaryMain() {
		
		return "diary-main";
	}
	
	@GetMapping("write-diary")
	public String writeDiary() {
		
		return "write-diary";
	}
}
