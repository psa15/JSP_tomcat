<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//html 태그에 사용하고 싶음
	//try안에서 선언하면 html태그에서는 사용 불가
	String d_userid = ""; 
	//String 타입이어서 ""
	String d_username = "";
	String d_addr = "";
	String d_tel = "";
	String d_passwd = "";
	
	try {
		//데이터베이스 연결정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		//drivermanager 객체 생성됨
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, password);
		
		//? : placeholder
		String sql = "select userid, passwd, USERNAME, ADDR, TEL from member WHERE USERID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		//처음에는 커서가 헤더위치를 가리킴
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			d_userid = rs.getString("userid");
			d_username = rs.getString("username");
			d_addr = rs.getString("addr");
			d_tel = rs.getString("tel");
			d_passwd = rs.getString("passwd");
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
<title>회원가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post" action="updatePro.jsp">
		<dl>
			<dd>
				<label for="userId">아이디</label>
				<input type="text" name="userId" id="userId" value="<%=d_userid %>" placeholder="user01@abc.com" readonly>
				<%--
				value="<%=d_userid %>" 를 사용한 이유:
				updateSelectList.jsp를 실행하여 수정버튼을 클릭하면 수정할 아이디에 해당하는 데이터를 불러오는데
				기본값이 해당아이디와 관련된 정보로 보여져야 하기 때문!
				기본값으로 회원가입할 때 작성했던 정보들이 보여져야 거기서 수정하여 update할 수 있음
				--%>
			</dd>
			<dd>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" value="<%=d_passwd %>" placeholder="비밀번호 입력" readonly>
			</dd>
			<dd>
				<label for="username">이름</label>
				<input type="text" name="username" id="username" value="<%=d_username %>" placeholder="이름 입력" readonly>
			</dd>
			<dd>
				<label for="addr">주소</label>
				<input type="text" name="addr" id="addr" value="<%=d_addr %>" placeholder="주소 입력" required>
			</dd>
			<dd>
				<label for="tel">연락처</label>
				<input type="text" name="tel" id="tel" value="<%=d_tel %>" placeholder="연락처 입력" required>
			</dd>
			<dd>
				<input type="submit" value="수정하기">
			</dd>
		</dl>
	</form>
</body>
</html>