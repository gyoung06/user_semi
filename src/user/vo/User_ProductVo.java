package user.vo;

public class User_ProductVo {
	//product테이블: 상품아이디,가격,할인율,대표이미지,추가이미지1,추가이미지2,등록일,상품팔린수
	private int pid;
	private int pprice;
	private int pdiscount;
	private String pimage1;
	private int sid;

	public User_ProductVo(int pid, int pprice, int pdiscount, String pimage1, int sid) {
		super();
		this.pid = pid;
		this.pprice = pprice;
		this.pdiscount = pdiscount;
		this.pimage1 = pimage1;
		this.sid = sid;
	}
	public User_ProductVo() {
	}
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPdiscount() {
		return pdiscount;
	}
	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}
	public String getPimage1() {
		return pimage1;
	}
	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}
}
