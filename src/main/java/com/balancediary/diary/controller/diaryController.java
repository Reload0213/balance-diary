package com.balancediary.diary.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.balancediary.diary.service.diaryService;
import com.balancediary.diary.vo.diaryVO;
import com.balancediary.user.vo.userVO;

@Controller
// @RequestMapping("/member")
public class diaryController {
	
	@Autowired
	diaryService diaryService = new diaryService();
	
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
	
	@GetMapping("setdiary")
	public String setdiary(@RequestParam("mcontent") MultipartFile file) throws Exception {
		// ���� üŷ ����� ������(ex ���� ���� �뷮�� 0�̶��)
				// �Ʒ��� ������ �̸� ��ü�� ���� ����ִٸ�
				if (!file.getOriginalFilename().isEmpty()) {
					// �ش� ��η� ������ ����(����)��Ű�ڴ�.
					file.transferTo(new File("C:\\diaryfile", file.getOriginalFilename()));
				} else {
					System.out.println("���� �߻�");
				}

				return "testdiary";
	}
	
	@PostMapping("testdiary")
	public String signUp(diaryVO vo) {
		diaryService.testSetDiary(vo);
		
		return "testdiary";
	}
	
}
