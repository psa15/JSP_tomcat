<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//html 태그에 사용하고 싶음
	String d_userid = ""; 
	String d_username = "";
	String d_addr = "";
	String d_tel = "";
	Timestamp d_reg_date = null;
	
	try {
		//데이터베이스 연결정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		//drivermanager 객체 생성됨
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, password);
		
		//? : placeholder
		String sql = "select userid, USERNAME, ADDR, TEL, reg_date from member WHERE USERID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		//처음에는 커서가 헤더위치를 가리킴
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			d_userid = rs.getString("userid");
			d_username = rs.getString("username");
			d_addr = rs.getString("addr");
			d_tel = rs.getString("tel");
			d_reg_date = rs.getTimestamp("reg_date");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//객체 생성의 역순으로 close()작업
		if(rs != null)
			try{rs.close();} catch(Exception e) {}
		if(pstmt != null)
			try{pstmt.close();} catch(Exception e) {}
		if(conn != null)
			try{conn.close();} catch(Exception e) {}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<dl>
		<dd>
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId" value="<%=d_userid %>" readonly>
		</dd>
		<dd>
			<label for="username">이름</label>
			<input type="text" name="username" id="username" value="<%=d_username %>" readonly>
		</dd>
		<dd>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" value="<%=d_addr %>" readonly>
		</dd>
		<dd>
			<label for="tel">연락처</label>
			<input type="text" name="tel" id="tel" value="<%=d_tel %>" required>
		</dd>
		<dd>
			<label for="reg_date">등록 일자</label>
			<input type="text" name="reg_date" id="reg_date" value="<%=d_reg_date %>" required>
		</dd>
	</dl>
</body>
</html>