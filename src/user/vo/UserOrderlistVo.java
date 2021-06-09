package user.vo;

import java.sql.Date;

public class UserOrderlistVo {
	private Date ordate;
	private int orid;
	private String pimage2;
	private String sname;
	private String odcolor;
	private int odcount;
	private int pprice;
	private String ordelivery;
	private String orcancel;
	public UserOrderlistVo() {}
	public UserOrderlistVo(Date ordate, int orid, String pimage2, String sname, String odcolor, int odcount, int pprice,
			String ordelivery, String orcancel) {
		super();
		this.ordate = ordate;
		this.orid = orid;
		this.pimage2 = pimage2;
		this.sname = sname;
		this.odcolor = odcolor;
		this.odcount = odcount;
		this.pprice = pprice;
		this.ordelivery = ordelivery;
		this.orcancel = orcancel;
	}
	public Date getOrdate() {
		return ordate;
	}
	public void setOrdate(Date ordate) {
		this.ordate = ordate;
	}
	public int getOrid() {
		return orid;
	}
	public void setOrid(int orid) {
		this.orid = orid;
	}
	public String getPimage2() {
		return pimage2;
	}
	public void setPimage2(String pimage2) {
		this.pimage2 = pimage2;
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
	public int getOdcount() {
		return odcount;
	}
	public void setOdcount(int odcount) {
		this.odcount = odcount;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getOrdelivery() {
		return ordelivery;
	}
	public void setOrdelivery(String ordelivery) {
		this.ordelivery = ordelivery;
	}
	public String getOrcancel() {
		return orcancel;
	}
	public void setOrcancel(String orcancel) {
		this.orcancel = orcancel;
	}

}
