package ch10.logon;

import java.sql.*;
import java.util.ArrayList;

//java bean을 이용한 로그인
//비즈니스 로직을 가지고 있는 자바빈
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
	
	//2) Connection 객체 생성
	private Connection getConnection() throws Exception {
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		
		return DriverManager.getConnection(url, id, password);
	}
	
	//로그인 체크
	//return값인 x가 1이면 로그인 성공, 0이면 비밀번호 틀림, -1이면 아이디 틀림
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
	
	//회원 목록
	public ArrayList<Member> selectList() {
		//ArrayList<Member> 리턴타입
		//ArrayList 사용 이유 : 순서대로 저장
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select userid, passwd, username, addr, tel, reg_date from member";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			Member memObj = null;
			
			while(rs.next()) {
				String userid = rs.getString("userid");
				String passwd = rs.getString("passwd");
				String username = rs.getString("username");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				Date reg_date = rs.getDate("reg_date");
				
				memObj = new Member(userid, passwd, username, addr, tel, reg_date);
				memberList.add(memObj);
				//while문의 수 만큼 컬렉션에 저장
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
		return memberList;
	}
}

	
