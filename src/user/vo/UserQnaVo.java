package user.vo;

import java.sql.Date;

public class UserQnaVo {
	private int qid;
	private int qcate;
	private String qwriter;
	private String qpw;
	private String qtitle;
	private String qcontent;
	private String qfile;
	private Date qrdate;
	private int qlev;
	private int qref;
	private String mid;
	private int pid;

	public UserQnaVo(int qid, int qcate, String qpw, String qtitle, String qcontent, String qfile, Date qrdate,
			int qlev, int qref, String mid, int pid) {
		super();
		this.qid = qid;
		this.qcate = qcate;
		this.qpw = qpw;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qfile = qfile;
		this.qrdate = qrdate;
		this.qlev = qlev;
		this.qref = qref;
		this.mid = mid;
		this.pid = pid;
	}

	public UserQnaVo() {
		super();
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int number) {
		this.qid = number;
	}

	public int getQcate() {
		return qcate;
	}

	public void setQcate(int qcate) {
		this.qcate = qcate;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public String getQpw() {
		return qpw;
	}

	public void setQpw(String qpw) {
		this.qpw = qpw;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQfile() {
		return qfile;
	}

	public void setQfile(String qfile) {
		this.qfile = qfile;
	}

	public Date getQrdate() {
		return qrdate;
	}

	public void setQrdate(Date qrdate) {
		this.qrdate = qrdate;
	}

	public int getQlev() {
		return qlev;
	}

	public void setQlev(int qlev) {
		this.qlev = qlev;
	}

	public int getQref() {
		return qref;
	}

	public void setQref(int qref) {
		this.qref = qref;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

}
