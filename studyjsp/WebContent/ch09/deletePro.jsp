<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//삭제하기 위해 primary key 받아오기
	String userid = request.getParameter("userid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	try {
		//데이터베이스 연결정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		//drivermanager 객체 생성됨
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, password);
		
		String sql = "delete from member WHERE USERID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//객체 생성의 역순으로 close()작업
		if(pstmt != null)
			try{pstmt.close();} catch(Exception e) {}
		if(conn != null)
			try{conn.close();} catch(Exception e) {}
	}
	
	//selectList.jsp로 돌아가기
	response.sendRedirect("selectList.jsp");

%>
