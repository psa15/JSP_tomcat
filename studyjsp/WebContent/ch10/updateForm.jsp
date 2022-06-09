<%@page import="ch10.logon.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");
	
	LogonBean logon = LogonBean.getInstance();
	Member member = logon.getMember(userid);

	String d_userid = member.getUserid(); 
	String d_username = member.getUSERNAME();
	String d_addr = member.getADDR();
	String d_tel = member.getTEL();
	String d_passwd = member.getPASSWD();
	//위 변수를 안지운 이유는 밑의 html코드에 사용되고 있기 때문
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<h3>회원정보 수정</h3>
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