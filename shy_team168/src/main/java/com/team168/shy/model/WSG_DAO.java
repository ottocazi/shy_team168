package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WSG_DAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	public void shyup(HashMap<String, String> shyform) {
		
		sqlsession.insert("", shyform);
		
	}

	
	
}
