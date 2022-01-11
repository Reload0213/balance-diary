package com.balancediary.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @RequestMapping("/member")
public class diaryController {
	
	@GetMapping("diary-main")
	public String diaryMain() {
		
		return "diary-main";
	}
	
	@GetMapping("member/write-diary")
	public String writeDiary() {
		
		return "write-diary";
	}
	
	
	@GetMapping("member/my-diary")
	public String myDiaryPage() {
		
		return "my-diary";
	}
}
