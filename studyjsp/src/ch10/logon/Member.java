package ch10.logon;

import java.util.Date;

//ezen계정의 Member테이블을 기본 베이스로 - 변수로만
public class Member {
	//userid, PASSWD, USERNAME, ADDR, TEL, REG_DATE
	private String userid;
	private String PASSWD;
	private String USERNAME;
	private String ADDR;
	private String TEL;
	private Date REG_DATE;
	
	//getter, setter 메소드
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPASSWD() {
		return PASSWD;
	}
	public void setPASSWD(String pASSWD) {
		PASSWD = pASSWD;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getADDR() {
		return ADDR;
	}
	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public Date getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(Date rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	
	//생성자메소드
	public Member(String userid, String pASSWD, String uSERNAME, String aDDR, String tEL, Date reg_date) {
		super();
		this.userid = userid;
		this.PASSWD = pASSWD;
		this.USERNAME = uSERNAME;
		this.ADDR = aDDR;
		this.TEL = tEL;
		this.REG_DATE = reg_date;
	}
	
	
}
