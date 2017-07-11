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
		
		
		
		HashMap<String, String> shynow = sqlsession.selectOne("ddung.getshynow", idx);
		System.out.println("중요!!!: "+shynow.get("snsno"));
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

	public List<HashMap<String, String>> getComments(String snsno) {
		
		List <HashMap <String, String>> comments = sqlsession.selectList("ddung.getComments", snsno);
		return comments;
	}

	public void insertGeo(HashMap<String, String> parameters) {
		
		sqlsession.insert("ddung.insertGeo", parameters);
		
	}

	// ===== 댓글 Cmtno 가져오기 ===== //
	public String getCmtno(HashMap<String, String> parameters) {
		String cmtno = sqlsession.selectOne("ddung.getCmtno",parameters);
		return cmtno;
	}

	public String alarmTarget(String shyidx) {
		String alarm_target = sqlsession.selectOne("pa.alarmTarget",shyidx);
		return alarm_target;
	}

	public void insertAlarm(HashMap<String, String> parameters) {
		sqlsession.insert("pa.insertCmtAlarm",parameters);
		
	}

	
}
