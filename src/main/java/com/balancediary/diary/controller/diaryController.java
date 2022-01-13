package com.balancediary.diary.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.balancediary.diary.service.diaryService;
import com.balancediary.diary.vo.diaryVO;
import com.balancediary.user.vo.userVO;
import com.google.gson.JsonObject;

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

	@ResponseBody
	@PostMapping("/profileImage")
	public void summer_image(MultipartFile file, HttpServletRequest request,
	    HttpServletResponse response) throws Exception {
		   
	  response.setContentType("text/html;charset=utf-8");
	  String uploadPath = "${pageContext.request.contextPath}/resources/images/";
	  //String uploadPath = "/Users/hongmac/Documents/WebProject/ImFind/src/main/webapp/resources/el/images/";
	      
	  PrintWriter out = response.getWriter();
	  String originalFileExtension = file.getOriginalFilename(); 
	  String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");// + originalFileExtension

	  System.out.println("storedFileName : " + storedFileName);
	  file.transferTo(new File(uploadPath+storedFileName));
	  out.println("/imfind/upload/"+storedFileName);
	   out.close();
}
}
