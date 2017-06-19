package com.team168.shy.model;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Repository
public class Min_DAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	// 메인글 남기기 메소드
	public void Mainput(HashMap<String, Object> map) {
		sqlsession.insert("min.Mainput", map);
		
	}
	
	

    
    
}
