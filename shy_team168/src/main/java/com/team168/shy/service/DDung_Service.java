package com.team168.shy.service;

import java.util.HashMap;
import java.util.List;

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

		public HashMap<String, String> getshynow(String idx) {
			
			HashMap <String,String> shynow = dao.getshynow(idx);
			return shynow;
			
			
		}

		public void insert_tbl_image(HashMap<String, String> parameters) {
			
			dao.insert_tbl_image(parameters);
			
		}

		public List<String> followlist(int idx) {
			
			List<String> followlist = dao.followlist(idx);
			return followlist;
		}

		public List<HashMap<String, String>> getmainshy(List<String> followlist) {
			
			List<HashMap<String, String>> shies = dao.getmainshy(followlist);
			return shies;
			
		}

		public String imgaddr(String snsno) {
			
			String imgaddr = dao.imgaddr(snsno);
			return imgaddr;
		}

		public void insertReply(HashMap<String, String> parameters) {
		
			dao.insertReply(parameters);
			
		}

		public List<HashMap<String, String>> getComments(String snsno) {
			
			List <HashMap <String, String>> comments = dao.getComments(snsno);
			return comments;
			
		}

		public void insertGeo(HashMap<String, String> parameters) {
			
			dao.insertGeo(parameters);
			
		}
		
	
	
}
