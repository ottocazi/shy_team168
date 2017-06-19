package com.team168.shy.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DDung_DAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	public void shyup(HashMap<String, String> shyform) {
		
		sqlsession.insert("ddung.shyup", shyform);
		
	}

	
}
