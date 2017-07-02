package com.team168.shy.model;

public class ShyMemberVO {
	
	private int idx;          
	private String name;     
	private String email;   
	private String pwd;      
	private String registerdate;  
	private int status;    
	private String myimg;     
	private String myintro;     
	private String birthday;     
	private String gender;   
	private String phone;
	
	GroupVO grpvo;
	
	public ShyMemberVO(){ }
	
	public ShyMemberVO(int idx, String name, String email, String pwd, String registerdate, int status, String myimg,
			String myintro, String birthday, String gender, String phone,GroupVO grpvo) {
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.registerdate = registerdate;
		this.status = status;
		this.myimg = myimg;
		this.myintro = myintro;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.grpvo = grpvo;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMyimg() {
		return myimg;
	}

	public void setMyimg(String myimg) {
		this.myimg = myimg;
	}

	public String getMyintro() {
		return myintro;
	}

	public void setMyintro(String myintro) {
		this.myintro = myintro;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public GroupVO getGrpvo() {
		return grpvo;
	}

	public void setGrpvo(GroupVO grpvo) {
		this.grpvo = grpvo;
	}
	
}
