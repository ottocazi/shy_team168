package com.team168.shy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.CommonDAO;

@Service
public class CommonService implements Interface_CommonService  {
	
	@Autowired
	private CommonDAO dao;

}
