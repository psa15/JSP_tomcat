package ch10.logon;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

//java bean을 이용한 로그인
//비즈니스 로직을 가지고 있는 자바빈 - 기능 위주의 메소드로만 
public class LogonBean {
	//싱글톤 패턴 적용 - 객체를 단 하나만 생성
	//1) 자기자신의 객체를 내부에서 생성, 외부에서 접근 못하게 private, 자동으로 생성되게 static
	private static LogonBean instance = new LogonBean();
	
	//2)외부에서 참조
	public static LogonBean getInstance() {
		//외부에서 접근할 수 있게 public
		return instance;
	}
	
	//3)생성자 접근 못하도록 작업
	private LogonBean() {} //외부에서 생성자 접근 못하게 private
	//없으면 디폴트생성자가 자동생성되어 public으로 접근할 수 있음
	
	//2) Connection 객체 생성 - 재사용성
	private Connection getConnection() throws Exception {
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		
		return DriverManager.getConnection(url, id, password);
	}
	
	//로그인 체크
	//return값인 x가 1이면 로그인 성공, 0이면 비밀번호 틀림, -1이면 아이디 틀림
	//sessionLoginPro.jsp - 로그인 시 입력하는 정보는 userid, passwd 뿐. -> db의 데이터와 비교하여 결과를 출력
	public int loginCheck(String userid, String passwd) {
		//사용자 아이디와 비번 받음
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = -1;
		
		try {
			conn = getConnection();
			
			String sql = "select passwd from member where userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//아이디가 존재 한다는 의미 (select문에 where절)
				String d_passwd = rs.getString("passwd");
				if(passwd.equals(d_passwd)) {
					//사용자가 입력한 비밀번호와 DB에서 가져온 비밀번호 비교해서 같으면 true
					x = 1;
				} else {
					x = 0;
				}
			} else { //아이디 존재 x 근데 위에 int x = -1이 있는데 이거 지워도 되나?
				x = -1;
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null)
				try{rs.close();} catch(Exception e) {}
			if(pstmt != null)
				try{pstmt.close();} //close()메소드가 예외처리 요구
				catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
		
		return x;
	}

	//insertPro.jsp - 회원가입을 위해 입력한 정보를 db의 테이블에 추가하는 작업이 필요하므로 자동으로 추가되는 reg_date 제외 모든 컬럼이 필요
	public void insertMember(String userId, String passwd, String username, String addr, String tel) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into member(userid, PASSWD, USERNAME, ADDR, TEL) values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, passwd);
			pstmt.setString(3, username);
			pstmt.setString(4, addr);
			pstmt.setString(5, tel);
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null)
				try{pstmt.close();} //close()메소드가 예외처리 요구
				catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
	}
	
	/*
	 insertPro.jsp - 회원가입을 위해 입력한 정보를 db의 테이블에 추가하는 작업을 시행하는데 
	 				 Member클래스는 db의 MEMBER 테이블을 기준으로 작성된 클래스기 때문에 모든 컬럼명이 생성자의 파라미터에 존재
	 따라서, insertMember2()메소드의 파라미터에 Member클래스의 객체를 작성한 것
	 
	 */
	public void insertMember2(Member memObj) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into member(userid, PASSWD, USERNAME, ADDR, TEL) values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memObj.getUserid());
			pstmt.setString(2, memObj.getPASSWD());
			pstmt.setString(3, memObj.getUSERNAME());
			pstmt.setString(4, memObj.getADDR());
			pstmt.setString(5, memObj.getTEL());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null)
				try{pstmt.close();} //close()메소드가 예외처리 요구
				catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
	}
	
	/*
	 회원 목록
	 selectList.jsp - 회원목록을 출력하는 파일이므로 모든 데이터 행이 필요 -> ArrayList 사용
	 				- 리턴값인 memberList에 MEMBER테이블의 모든 데이터 행이 순서대로 저장되어 있음
	 				- memberList는 컬렉션 형태로 저장되어 있기 때문에 for문을 사용하여 memberList의 i번째 데이터를 출력(selectList.jsp 파일에 있음)
	 */
	public ArrayList<Member> selectList() {
		//ArrayList<Member> 리턴타입
		//ArrayList 사용 이유 : 순서대로 저장
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1)
			conn = getConnection();//
			
			//2)
			String sql = "select userid, passwd, username, addr, tel, reg_date from member";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();//2)
			
			//3)
			/*
			 Member테이블의 데이터 행을 불러올 거니까 Member테이블의 컬럼이 선언되어 있는 Member클래스 데이터타입을 가진 필드를 선언
			 rs = pstmt.executeQuery(); 코드로 인해 sql문으로 데이터들을 불러왔고, rs.next() 를 통해 데이터들을 memObj에 Member객체를 생성하여 할당
			 */
			//필드 선언?
			Member memObj = null;
			
			while(rs.next()) {
				String userid = rs.getString("userid");
				String passwd = rs.getString("passwd");
				String username = rs.getString("username");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				java.util.Date reg_date = rs.getDate("reg_date");
				
				memObj = new Member(userid, passwd, username, addr, tel, reg_date);
				memberList.add(memObj);
				//while문의 수 만큼 컬렉션에 저장
			}//3)
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null)
				try{rs.close();} catch(Exception e) {}
			if(pstmt != null)
				try{pstmt.close();} catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
		return memberList;
	}
	
	/*
	 deletePro.jsp - 선택한 아이디에 대한 모든 데이터를 삭제하는 것이기 때문에 선택한 아이디만 메소드의 파라미터로 작성
	 				 쿼리에 userid만 필요함 "delete from member WHERE USERID = ?"
	 
	 */
	public void deleteMember(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "delete from member WHERE USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null)
				try{pstmt.close();} //close()메소드가 예외처리 요구
				catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
	}
	
	//회원정보, 회원수정 폼
	//updateForm.jsp - 회원정보를 수정해야 해서 아이디에 해당하는 정보들을 불러와야함, 조회 = select
	//selectDetail.jsp - 아이디에 해당하는 데이터들을 출력
	public Member getMember(String userid) {
		//Member테이블의 컬럼을 불러오기 때문에 타입이 Member
		Member member = null; //return type 때문에 작성
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1)
			conn = getConnection();
			
			//2)
			String sql = "select userid, passwd, USERNAME, ADDR, TEL, reg_date from member WHERE USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			//3)
			if(rs.next()) {
//				String userId = rs.getString("userid"); //파라미터에 userid가 있어서 제외
				String uSERNAME = rs.getString("username");
				String aDDR = rs.getString("addr");
				String tEL = rs.getString("tel");
				String pASSWD = rs.getString("passwd");
				Date reg_date = rs.getDate("reg_date");
				
				//데이터가 있으면 객체로 읽어와서 return 한다.
				member = new Member(userid, pASSWD, uSERNAME, aDDR, tEL, reg_date);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null)
				try{rs.close();} catch(Exception e) {}
			if(pstmt != null)
				try{pstmt.close();} catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
		return member;
	}
	
	//updatePro.jsp - 회원정보를 수정한 결과를 반영해야 함, 수정 = update
	public void updateMember(Member memObj) {
		/*
		 파라미터 받는 방법
		  - 1) 개별적으로 작성
		  - 2) 클래스로 받아오기
		 2)Member클래스 안에 
		 	1)String userId, String passwd, String username, String addr, String tel
		 	이 들어 있음
		 */
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1) Connection  객체
			conn = getConnection();
			
			//2)sql문 실행 작업
			//pstmt.executeUpdate(); 를 실행하기 위해  값을 주는 작업을 함
			String sql = "update member set addr = ?, tel = ? where userId = ? and passwd = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memObj.getADDR());
			pstmt.setString(2, memObj.getTEL());
			pstmt.setString(3, memObj.getUserid());
			pstmt.setString(4, memObj.getPASSWD());
			
			pstmt.executeUpdate(); //항상 마지막에 와야 함 값이 제공된 후에 실행시키는 기능을 하기 때문!
			
		} catch(Exception e) {
			e.printStackTrace();
//			out.println("member테이블에 레코드 삽입 실패");
		} finally {
			if(pstmt != null)
				try{pstmt.close();} 
				catch(Exception e) {}
			if(conn != null)
				try{conn.close();} catch(Exception e) {}
		}
	}
	
}

	
