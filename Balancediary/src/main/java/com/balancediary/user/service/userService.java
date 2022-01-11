package com.balancediary.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.balancediary.user.vo.userVO;

@Service
public class userService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void setUser(userVO vo) {
		sqlSessionTemplate.insert("user.insertUser", vo);
	}
}

