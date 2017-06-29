package com.team168.shy.model;

public class GroupVO {
	private int groupno;
	private String fk_idx;
	private String gname;
	private String description;
	private String groupdate;
	private String gimg;
	private int gcount;
	private int status;
	
	//////// 그룹상세 ////////
	private int gpdetailno; 
	private String fk_groupidx;
	private String gregisterdate;
	private int gmstatus;
	
	public GroupVO() {
	}

	public GroupVO(int groupno, String fk_idx, String gname, String description, String groupdate, String gimg,
			int gcount, int status) {
		this.groupno = groupno;
		this.fk_idx = fk_idx;
		this.gname = gname;
		this.description = description;
		this.groupdate = groupdate;
		this.gimg = gimg;
		this.gcount = gcount;
		this.status = status;
	}
	
	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getFk_idx() {
		return fk_idx;
	}

	public void setFk_idx(String fk_idx) {
		this.fk_idx = fk_idx;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGroupdate() {
		return groupdate;
	}

	public void setGroupdate(String groupdate) {
		this.groupdate = groupdate;
	}

	public String getGimg() {
		return gimg;
	}

	public void setGimg(String gimg) {
		this.gimg = gimg;
	}

	public int getGcount() {
		return gcount;
	}

	public void setGcount(int gcount) {
		this.gcount = gcount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getGpdetailno() {
		return gpdetailno;
	}

	public void setGpdetailno(int gpdetailno) {
		this.gpdetailno = gpdetailno;
	}

	public String getFk_groupidx() {
		return fk_groupidx;
	}

	public void setFk_groupidx(String fk_groupidx) {
		this.fk_groupidx = fk_groupidx;
	}

	public String getGregisterdate() {
		return gregisterdate;
	}

	public void setGregisterdate(String gregisterdate) {
		this.gregisterdate = gregisterdate;
	}

	public int getGmstatus() {
		return gmstatus;
	}

	public void setGmstatus(int gmstatus) {
		this.gmstatus = gmstatus;
	}

	
	
}
