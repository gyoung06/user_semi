package user.vo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import test.db.DBConnection;

public class User_OrdersVo {
	public int orid;
	public Date ordate;
	public String orname ;
	public String orphone;
	public String oraddress;
	public String orpost;
	public int orpayment;
	public int orinvoice;
	public int ordelpay;
	public char ordelivery;
	public char orcomplete;
	public char orcancle;
	public String mid;
	public User_OrdersVo(int orid, Date ordate, String orname, String orphone, String oraddress, String orpost,
			int orpayment, int orinvoice, int ordelpay, char ordelivery, char orcomplete, char orcancle, String mid) {
		super();
		this.orid = orid;
		this.ordate = ordate;
		this.orname = orname;
		this.orphone = orphone;
		this.oraddress = oraddress;
		this.orpost = orpost;
		this.orpayment = orpayment;
		this.orinvoice = orinvoice;
		this.ordelpay = ordelpay;
		this.ordelivery = ordelivery;
		this.orcomplete = orcomplete;
		this.orcancle = orcancle;
		this.mid = mid;
	}
	public int getOrid() {
		return orid;
	}
	public void setOrid(int orid) {
		this.orid = orid;
	}
	public Date getOrdate() {
		return ordate;
	}
	public void setOrdate(Date ordate) {
		this.ordate = ordate;
	}
	public String getOrname() {
		return orname;
	}
	public void setOrname(String orname) {
		this.orname = orname;
	}
	public String getOrphone() {
		return orphone;
	}
	public void setOrphone(String orphone) {
		this.orphone = orphone;
	}
	public String getOraddress() {
		return oraddress;
	}
	public void setOraddress(String oraddress) {
		this.oraddress = oraddress;
	}
	public String getOrpost() {
		return orpost;
	}
	public void setOrpost(String orpost) {
		this.orpost = orpost;
	}
	public int getOrpayment() {
		return orpayment;
	}
	public void setOrpayment(int orpayment) {
		this.orpayment = orpayment;
	}
	public int getOrinvoice() {
		return orinvoice;
	}
	public void setOrinvoice(int orinvoice) {
		this.orinvoice = orinvoice;
	}
	public int getOrdelpay() {
		return ordelpay;
	}
	public void setOrdelpay(int ordelpay) {
		this.ordelpay = ordelpay;
	}
	public char getOrdelivery() {
		return ordelivery;
	}
	public void setOrdelivery(char ordelivery) {
		this.ordelivery = ordelivery;
	}
	public char getOrcomplete() {
		return orcomplete;
	}
	public void setOrcomplete(char orcomplete) {
		this.orcomplete = orcomplete;
	}
	public char getOrcancle() {
		return orcancle;
	}
	public void setOrcancle(char orcancle) {
		this.orcancle = orcancle;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
