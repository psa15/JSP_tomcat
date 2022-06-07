<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function fn_deleteOk(userid) {
		location.href="deletePro.jsp?userid=" + userid;
	}
	function fn_update(userid) {
		location.href="updateForm.jsp?userid=" + userid;
	}
</script>
<%--데이터들을 테이블형태로 출력하기 위해 --%>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>가입 일자</td>
		<td>비고</td>
	</tr>
	
<%
 	//member테이블의 모든 데이터를 불러와서 웹화면에 출력
 	
	//jdbc작업
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
		//conn객체가 생성이 되면 오라클db에 연결됐음을 의미
		
		//out.println("연결성공"); 확인용
		
		//쿼리문 구성
		String sql = "select userid, USERNAME, TEL, reg_date from member"; 
		//select문에 ""안에 ; 금지
		pstmt = conn.prepareStatement(sql);
		
		//rs객체가 "select * from member"구문이 실행된 결과를 메모리상에서 참조
		rs = pstmt.executeQuery();
		//rs라는 이름으로 select문의 결과를 참조
		
		//rs객체에 데이터 위치를 나타내는 커서가 존재, 처음에는 커서가 헤더위치에 존재
		//rs.next() : 커서를 다음 줄로 이동, 이동된 위치에 데이터가 존재하면 true 반환
		while (rs.next()) {
			//rs객체의 커서가 헤더에 존재하는 상태에서 next()메소드에 의하여 다음위치로 이동되고 데이터 존재 유무를 확인
			String userid = rs.getString("userid"); //rs.getString("컬럼명");
			//String passwd = rs.getString("passwd");
			String username = rs.getString("username");
			//String addr = rs.getString("addr");
			String tel = rs.getString("tel");
			Timestamp reg_date = rs.getTimestamp("reg_date");
			//데이터가 3개니까 헤더 -> rs.next -> 1번째 데이터 행(true) -> rs.next -> 2번째 데이터 행(true) 
			//				->rs.next ->3번째 데이터 행(true) ->rs.next ->4번째 위치(false) while문 종료
			
%>
	<tr>
		<td><a href ="selectDetail.jsp?userid=<%=userid%>"><%=userid %></a></td>
		<td><%=username %></td>
		<td><%=tel %></td>
		<td><%=reg_date %></td>
		<td>
			<input type="button" value="삭제" onclick="fn_deleteOk('<%=userid%>');">
			<input type="button" value="수정" onclick="fn_update('<%=userid%>');">
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