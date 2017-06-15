package com.team168.shy.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO implements Interface_CommonDAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
}
