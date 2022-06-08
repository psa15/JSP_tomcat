<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	//오라클 데이터베이스 member테이블에 사용자가 입력하는 데이터 저장 목적으로 존재-> tag 필요 x
	String userId = request.getParameter("userId");
	String passwd = request.getParameter("passwd");
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
		String id ="ezen";
		String password = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		
		//1)conn객체 생성
		conn=DriverManager.getConnection(url, id, password);
		//conn객체가 생성이 되면 오라클db에 연결됐음을 의미
		
		//out.println("연결성공"); 확인용
		
		//쿼리문 구성
		String sql = "update member set addr = ?, tel = ? where userId = ? and passwd = ?";
		
		//2)pstmt 객체 생성
		pstmt = conn.prepareStatement(sql);
		//5개의 ?에 대치될 값을 지정
		//컬럼의 값을 지정 시 set타입이름() 메소드가 존재
		//pstmt.setString(parameterIndex, x)
		pstmt.setString(1, addr);
		pstmt.setString(2, tel);
		pstmt.setString(3, userId);
		pstmt.setString(4, passwd);
		
		//쿼리실행 요청
		pstmt.executeUpdate();
		
		out.println("member테이블에 새로운 레코드가 수정되었습니다.");
		
	} catch(Exception e) {
		e.printStackTrace();
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
	
	response.sendRedirect("updateSelectList.jsp");
%>