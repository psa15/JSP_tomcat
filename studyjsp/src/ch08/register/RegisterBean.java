package ch08.register;

import java.sql.Timestamp;

/*
 자바빈 : 데이터 저장 및 관리 목적 
  회원테이블 참조
  userId, passwd, name, reg_date 컬럼 존재
 */
public class RegisterBean {
	
	//private field
	private String userId;
	private String passwd;
	private String name;
	private Timestamp reg_date;
	
	//getter, setter method
	public String getUserId() {
		return userId;
	}
	public void setUserID(String userId) {
		this.userId = userId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
