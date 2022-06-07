package ch08.bean;

public class TestBean {

	/*
	 자바빈(Java Bean)
		: 특정한 작업을 하기 위한 독립적으로 수행하는 컴포넌트
		- jsp 페이지에서 html코드와 java 코드를 분리하기 위한 목적
		- 1) 데이터 저장 및 관리 목적 : 데이터베이스 테이블에 매핑되는 클래스
				<jsp:useBean id="객체명" class="자바빈 클래스명"></jsp:useBean> 이용
		- 2) 기능 구현 목적 : 비지니스 로직으로 구성된 클래스
	
	1) 데이터 저장 및 관리 목적 : 데이터베이스 테이블에 매핑되는 클래스
	 DB - 테이블
	  CREATE TABLE TEST
	  (
	  	ID VARCHAR2(20) PRIMARY KEY
	  );
	  DB에 위와 같은 테이블이 생성되어 있을 때, TEST테이블과 구조가 동일한 클래스를 만드는 것
	  	- 멤버는 private 접근자를 가짐
	  	- 멤버에 대한 getter, setter 메소드 정의
	 */
	
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
