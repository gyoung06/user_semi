package user.vo;

import java.sql.Date;

public class User_ReviewVo {
	private int rid;
	private String rpw;
	private String rtitle;
	private String rcontent;
	private String rphoto1;
	private String rphoto2;
	private String rphoto3;
	private Date rrdate;
	private int rhit;
	private String mid;
	private String pid;
	public User_ReviewVo(int rid, String rpw, String rtitle, String rcontent, String rphoto1, String rphoto2,
			String rphoto3, Date rrdate, int rhit, String mid, String pid) {
		super();
		this.rid = rid;
		this.rpw = rpw;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.rphoto1 = rphoto1;
		this.rphoto2 = rphoto2;
		this.rphoto3 = rphoto3;
		this.rrdate = rrdate;
		this.rhit = rhit;
		this.mid = mid;
		this.pid = pid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRpw() {
		return rpw;
	}
	public void setRpw(String rpw) {
		this.rpw = rpw;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRphoto1() {
		return rphoto1;
	}
	public void setRphoto1(String rphoto1) {
		this.rphoto1 = rphoto1;
	}
	public String getRphoto2() {
		return rphoto2;
	}
	public void setRphoto2(String rphoto2) {
		this.rphoto2 = rphoto2;
	}
	public String getRphoto3() {
		return rphoto3;
	}
	public void setRphoto3(String rphoto3) {
		this.rphoto3 = rphoto3;
	}
	public Date getRrdate() {
		return rrdate;
	}
	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}
	public int getRhit() {
		return rhit;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
}
