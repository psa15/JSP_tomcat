<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC Driver 테스트</title>
</head>
<body>
	<h3>JDBC Driver 테스트</h3>
	<%
		/*
		준비
		- WEB-INF/lib 폴더에 JDBC Driver가 존재해야함
		- 현재 오라클이므로, ojdbc6.jar(jdk 1.8 / oracle 11g xe 지원)
		*/
		//1)데이터베이스 연결 기능
		Connection conn = null;
		
		//예외(Exception) 문법이 존재 하니 try-catch 작업필
		try { //2) 데이터베이스 연결 정보
			// sql developer 접속툴에서 사용한 정보를 코드에서 구성
			//ora_user계정 사용
			String jdbcUrl ="jdbc:oracle:thin:@localhost:1521:xe";
			String dbId ="ora_user";
			String dbPass ="1234";
			
			//oracle회사에서 제공하는 오라클 db를 접속하기 위한 Driver의 정보
			//메모리상에 DriverManager객체 생성함
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//여기까지의 작업이 sqldeveloper에서 새 접속을 생성하여 접속을 시도하는 과정
			//시도해서 성공하면 객체 생성
			out.println("연결 성공");
			
			//SQL구문 실행작업
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>