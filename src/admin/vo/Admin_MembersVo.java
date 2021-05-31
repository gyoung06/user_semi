package admin.vo;

import java.sql.Date;

public class Admin_MembersVo {
	private String mid;
	private String mpw;
	private String mname;
	private String maddress;
	private String mpost;
	private Date mrdate;
	private Date mbirth;
	private int mdrop;
	
	public Admin_MembersVo() {}
	public Admin_MembersVo(String mid, String mpw, String mname, String maddress, 
			String mpost,Date mrdate, Date mbirth, int mdrop) {
		super();
		this.mid=mid;
		this.mpw=mpw;
		this.mname=mname;
		this.maddress=maddress;
		this.mpost=mpost;
		this.mpost=mpost;
		this.mrdate=mrdate;
		this.mbirth=mbirth;
		this.mdrop=mdrop;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMpost() {
		return mpost;
	}
	public void setMpost(String mpost) {
		this.mpost = mpost;
	}
	public Date getMrdate() {
		return mrdate;
	}
	public void setMrdate(Date mrdate) {
		this.mrdate = mrdate;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public int getMdrop() {
		return mdrop;
	}
	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}
	
}
