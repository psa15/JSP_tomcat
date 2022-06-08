<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%--회원가입 폼의 데이터를 db에 추가 --%>


<% request.setCharacterEncoding("utf-8"); %>
<%
	//오라클 데이터베이스 member테이블에 사용자가 입력하는 데이터 저장 목적으로 존재-> tag 필요 x
	//getParameter의 리턴타입이 String
	String userId = request.getParameter("userId");
	String passwd = request.getParameter("passwd");
	String username = request.getParameter("username");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	//jdbc작업
	//데이터베이스 연결
	Connection conn = null;
	//sql구문
	PreparedStatement pstmt = null;
	
	try {
		//데이터베이스 연결정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		//@localhost 부분이 실무에서 변경될 것. 현재는 같은 컴퓨터에 jdbc, oracle jdk 등등 다 있어서 지들끼리 함
		//xe : sid 중 하나
		String id ="ezen";
		String password = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		//DriverManager 객체가 메모리상에 생성
		
		//1)conn객체 생성
		conn=DriverManager.getConnection(url, id, password);
		//conn객체가 생성이 되면 오라클db에 연결됐음을 의미
		//conn에서 에러가 나면 getConnection의 파라미터가 잘못된 것!
		
		//out.println("연결성공"); 확인용
		
		//쿼리문 구성
		String sql = "insert into member(userid, PASSWD, USERNAME, ADDR, TEL) values(?, ?, ?, ?, ?)";
		
		//2)pstmt 객체 생성
		pstmt = conn.prepareStatement(sql);
		//5개의 ?에 대치될 값을 할당
		//컬럼의 값을 지정 시 set타입이름() 메소드가 존재
		//pstmt.setString(parameterIndex, x)
		pstmt.setString(1, userId);
		pstmt.setString(2, passwd);
		pstmt.setString(3, username);
		pstmt.setString(4, addr);
		pstmt.setString(5, tel);
		
		//쿼리실행 요청
		//select문 사용 시 - pstmt.executeQuery();
		//insert, update, delete 사용 시
		pstmt.executeUpdate();
		//sql변수의 insert구문이 오라클 서버에게 실행요청을 함
		
		out.println("member테이블에 새로운 레코드가 삽입되었습니다.");
		//위에서 conn객체 연결 확인을 했으므로 에러나면 insert문이 문제라는 뜻
		
	} catch(Exception e) {
		e.printStackTrace();
		//예외정보를 콜솔에서 확인
		out.println("member테이블에 레코드 삽입 실패");
	} finally {
		//예외 발생 여부와 상관없이 반드시 실행시킬 구문 작성
		//jdbc관련 객체는 소멸작업을 해주어야 메모리누수를 방지
		//객체 생성 역순으로 close()작업호출
		if(pstmt != null)
			try{pstmt.close();} //close()메소드가 예외처리 요구
			catch(Exception e) {}
		if(conn != null)
			try{conn.close();} catch(Exception e) {}
	}
	
	response.sendRedirect("insertSelectList.jsp");
%>