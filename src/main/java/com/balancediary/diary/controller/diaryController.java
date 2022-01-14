package com.balancediary.diary.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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


	@PostMapping("testdiary")
	public String signUp(diaryVO vo) {
		diaryService.testSetDiary(vo);

		return "testdiary";
	}

	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map<String, String>> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		//JsonObject jsonObject = new JsonObject();
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		String fileRoot = "C:\\temp\\";	//����� �ܺ� ���� ���
		String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
				
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//���� ����
			//jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			//jsonObject.addProperty("responseCode", "success");
				
			
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			//jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		//jsonObject.addProperty("aaa", "aaa");
		ResponseEntity<Map<String, String>> entity = new ResponseEntity<Map<String, String>>(map,HttpStatus.OK);
		map.put("url", "/temp/"+savedFileName);
		map.put("responseCode", "success");
	
		//return jsonObject;
		
		return entity;
	}
	
	@GetMapping("/temp")
	public void download(HttpServletResponse response) {
		
		try {
			String path = "C:/Temp/**";
			
			Path file = Paths.get(path);
			// 1. ��� �ۼ�
			response.setHeader("Content-Disposition", "attachment;filename"+file.getFileName());
			// 2. ���� ���� �� ���� �ҷ�����
			FileChannel fc = FileChannel.open(file, StandardOpenOption.READ);
			
			// 3. response�� file�� �����͸� �����ϴ� ���� �����
			WritableByteChannel outputChannel = Channels.newChannel(response.getOutputStream());
			
			// 4. file���� response�� ������ ����
			// 0������ ���� fc.size()����
			fc.transferTo(0, fc.size(), outputChannel);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
