package com.team168.shy.model;

import java.util.HashMap;
import java.util.List;

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

	public HashMap<String, String> getshynow(String idx) {
		
		
		
		List<HashMap<String, String>> listoneshy = sqlsession.selectList("ddung.getshynow", idx);
		
		HashMap<String, String> shynow = listoneshy.get(0);
		return shynow;
		
		
	}

	public void insert_tbl_image(HashMap<String, String> parameters) {
		
		sqlsession.insert("ddung.insert_tbl_image", parameters);
		
	}

	public List<String> followlist(int idx) {
		
		List<String> followlist = sqlsession.selectList("ddung.followlist", idx);
		return followlist;
	}

	public List<HashMap<String, String>> getmainshy(List<String> followlist) {
		
		List<HashMap<String, String>> shies = sqlsession.selectList("ddung.shies", followlist);
		
		return shies;
	}

	public String imgaddr(String snsno) {
		
		String imgaddr = sqlsession.selectOne("ddung.imgaddr", snsno);
		return imgaddr;
	}

	public void insertReply(HashMap<String, String> parameters) {
		
		sqlsession.insert("ddung.insertReply", parameters);
		
	}

	
}
