<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function fn_deleteOk(userid) {
		if(!confirm(userid + "를 삭제 하겠습니까?")) return;
		//취소를 누르면 false가 되어 !로 인해 true로 작용하여 return됨
		//확인을 누르면 true가 되어 !로 인해 false로 작용하여 아리 코드 실행
		location.href="deletePro.jsp?userid=" + userid;
	}
</script>

<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>가입 일자</td>
		<td>비고</td>
	</tr>
	
<%
	//데이터베이스 연결
	Connection conn = null;
	//sql구문
	PreparedStatement pstmt = null;
	//테이블의 데이터를 저장할 기억장소
	ResultSet rs = null;
	
	String str = "";
	
	try {
		//데이터베이스 연결정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="ezen";
		String password = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection(url, id, password);
		
		//쿼리문 구성
		String sql = "select userid, USERNAME, TEL, reg_date from member"; 
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
			while (rs.next()) {
			
			String userid = rs.getString("userid");
			String username = rs.getString("username");
			String tel = rs.getString("tel");
			Timestamp reg_date = rs.getTimestamp("reg_date");

			
%>
	<tr>
		<td><a href ="selectDetail.jsp?userid=<%=userid%>"><%=userid %></a></td>
		<td><%=username %></td>
		<td><%=tel %></td>
		<td><%=reg_date %></td>
		<td>
			<input type="button" value="삭제" onclick="fn_deleteOk('<%=userid%>');">
		</td>
	</tr>
<%
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

</table>