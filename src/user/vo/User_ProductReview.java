package user.vo;

public class User_ProductReview {
	private String rtitle;
	private String rphoto1;
	private String sname;
	private String odcolor;
	private String odsize;
	private String rcontent;
	private String mid;
	public User_ProductReview() {}
	public User_ProductReview(String rtitle, String rphoto1, String sname, String odcolor, String odsize,
			String rcontent, String mid) {
		super();
		this.rtitle = rtitle;
		this.rphoto1 = rphoto1;
		this.sname = sname;
		this.odcolor = odcolor;
		this.odsize = odsize;
		this.rcontent = rcontent;
		this.mid = mid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRphoto1() {
		return rphoto1;
	}
	public void setRphoto1(String rphoto1) {
		this.rphoto1 = rphoto1;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getOdcolor() {
		return odcolor;
	}
	public void setOdcolor(String odcolor) {
		this.odcolor = odcolor;
	}
	public String getOdsize() {
		return odsize;
	}
	public void setOdsize(String odsize) {
		this.odsize = odsize;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
