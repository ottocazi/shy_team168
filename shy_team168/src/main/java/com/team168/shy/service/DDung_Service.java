package com.team168.shy.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team168.shy.model.DDung_DAO;

@Service
public class DDung_Service {

		@Autowired
		private DDung_DAO dao;

		public void shyup(HashMap<String, String> shyform) {
			
			dao.shyup(shyform);
			
		}
		
	
	
}
